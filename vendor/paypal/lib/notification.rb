module Paypal
  # Parser and handler for incoming Instant payment notifications from paypal. 
  # The Example shows a typical handler in a rails application.
  # 
  # Example
  #  
  #   class BackendController < ApplicationController
  #   
  #     def paypal_ipn
  #       notify = PaypalNotification.new(request.raw_post)
  #   
  #       order = Order.find(notify.item_id)
  #     
  #       if notify.acknowledge 
  #         begin
  #           
  #           if notify.complete? and order.total == notify.amount
  #             order.status = 'success' 
  #             
  #             shop.ship(order)
  #           else
  #             logger.error("Failed to verify Paypal's notification, please investigate")
  #           end
  #   
  #         rescue => e
  #           order.status        = 'failed'      
  #           raise
  #         ensure
  #           order.save
  #         end
  #       end
  #   
  #       render :nothing
  #     end
  #   end
  class Notification
    attr_accessor :params
    attr_accessor :raw

    # Overwrite this url. It points to the Paypal sandbox by default.
    # Please note that the Paypal technical overview (doc directory)
    # speaks of a https:// address for production use. In my tests 
    # this https address does not in fact work. 
    # 
    # Example: 
    #   Paypal::Notification.ipn_url = http://www.paypal.com/cgi-bin/webscr
    #
    cattr_accessor :ipn_url
    @@ipn_url = 'http://www.sandbox.paypal.com/cgi-bin/webscr'

    # Creates a new paypal object. Pass the raw html you got from paypal in. 
    # In a rails application this looks something like this
    # 
    #   def paypal_ipn
    #     paypal = Paypal::Notification.new(request.raw_post)
    #     ...
    #   end
    def initialize(post)
      empty!
      parse(post)
    end

    # Was the transaction complete?
    def complete?
      status == "Completed"
    end

    # When was this payment received by the client. 
    # sometimes it can happen that we get the notification much later. 
    # One possible scenario is that our web application was down. In this case paypal tries several 
    # times an hour to inform us about the notification
    def recieved_at
      Time.parse params['payment_date']
    end

    # Whats the status of this transaction?
    def status
      params['payment_status']
    end

    # Id of this transaction (paypal number)
    def transaction_id
      params['txn_id']
    end

    # What type of transaction are we dealing with? 
    #  "cart" "send_money" "web_accept" are possible here. 
    def type
      params['txn_type']
    end

    # the money amount we received in X.2 decimal.
    def gross
      params['mc_gross']
    end

    # the markup paypal charges for the transaction
    def fee
      params['mc_fee']
    end

    # What currency have we been dealing with
    def currency
      params['mc_currency']
    end
  
    # This is the item number which we submitted to paypal 
    def item_id
      params['item_number']
    end

    # This combines the gross and currency and returns a proper Money object. 
    # this requires the money library located at http://dist.leetsoft.com/api/money
    def amount
      amount = gross.sub(/[^\d]/, '').to_i
      Money.new(amount, currency)
    end
    
    # reset the notification. 
    def empty!
      @params  = Hash.new
      @raw     = ""      
    end

    # Acknowledge the transaction to paypal. This method has to be called after a new 
    # ipn arrives. Paypal will verify that all the information we received are correct and will return a 
    # ok or a fail. 
    # 
    # Example:
    # 
    #   def paypal_ipn
    #     notify = PaypalNotification.new(request.raw_post)
    #
    #     if notify.acknowledge 
    #       ... process order ... if notify.complete?
    #     else
    #       ... log possible hacking attempt ...
    #     end
    def acknowledge
      uri = URI.parse(self.class.ipn_url)
      status = nil
      Net::HTTP.start(uri.host, uri.port) do |request|
        status = request.post(uri.path, raw + "&cmd=_notify-validate").body
      end
      status == "VERIFIED"
    end

    private
    
    # Take the posted data and move the relevant data into a hash
    def parse(post)
      @raw = post
      for line in post.split('&')    
        key, value = *line.scan( %r{^(\w+)\=(.*)$} ).flatten
        params[key] = CGI.unescape(value)
      end    
    end

  end
end