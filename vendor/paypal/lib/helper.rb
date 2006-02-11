module Paypal 
  # This is a collection of helpers which aid in the creation of paypal buttons 
  # 
  # Example:
  #
  #    <%= form_tag Paypal::Notification.ipn_url %>
  #    
  #      <%= paypal_setup "Item 500", Money.us_dollar(50000), "bob@bigbusiness.com" %>  
  #      Please press here to pay $500US using paypal. <%= submit_tag %>
  #    
  #    <% end_form_tag %> 
  #
  # For this to work you have to include these methods as helpers in your rails application.
  # One way is to add "include Paypal::Helpers" in your application_helper.rb
  # See Paypal::Notification for information on how to catch payment events. 
  module Helpers
    
    # Convenience helper. Can replace <%= form_tag Paypal::Notification.ipn_url %>
    def paypal_form_tag
      form_tag(Paypal::Notification.ipn_url)
    end

    # This helper creates the hidden form data which is needed for a paypal purchase. 
    # 
    # * <tt>item_number</tt> -- The first parameter is the item number. This is for your personal organization and can 
    #   be arbitrary. Paypal will sent the item number back with the IPN so its a great place to 
    #   store a user ID or a order ID or something like  this. 
    #
    # * <tt>amount</tt> -- should be a parameter of type Money ( see http://leetsoft.com/api/money ) but can also 
    #   be a string of type "50.00" for 50$. If you use the string syntax make sure you set the current 
    #   currency as part of the options hash. The default is USD
    #
    # * <tt>business</tt> -- This is your paypal account name ( a email ). This needs to be a valid paypal business account.
    #
    # The last parameter is a options hash. You can override several things:
    #
    # * <tt>:notify_url</tt> -- default is nil. Supply an url which paypal will send its IPN notification to once a 
    #   purchase is made, canceled or any other status changes occure. 
    # * <tt>:return_url</tt> -- default is nil. If provided paypal will redirect a user back to this url after a 
    #   successful purchase. Useful for a kind of thankyou page. 
    # * <tt>:cancel_url</tt> -- default is nil. If provided paypal will redirect a user back to this url when
    #   the user cancels the purchase.
    # * <tt>:item_name</tt> -- default is 'Store purchase'. This is the name of the purchase which will be displayed
    #   on the paypal page. 
    # * <tt>:no_shipping</tt> -- default is '1'. By default we tell paypal that no shipping is required. Usually
    #   the shipping address should be collected in our application, not by paypal. 
    # * <tt>:no_note</tt> -- default is '1'
    # * <tt>:currency</tt> -- default is 'USD'
    #
    # Examples:
    #   
    #   <%= paypal_setup @order.id, Money.us_dollar(50000), "bob@bigbusiness.com" %>  
    #   <%= paypal_setup @order.id, '50.00', "bob@bigbusiness.com", :currency => 'USD' %>  
    #   <%= paypal_setup @order.id, '50.00', "bob@bigbusiness.com", :currency => 'USD', :notify_url => url_for(:only_path => false, :action => 'paypal_ipn') %>  
    #   <%= paypal_setup @order.id, Money.ca_dollar(50000), "bob@bigbusiness.com", :item_name => 'Snowdevil shop purchase', :return_url => paypal_return_url, :cancel_url => paypal_cancel_url, :notify_url => paypal_ipn_url  %>  
    # 
    def paypal_setup(item_number, amount, business, options = {})

      params = {
        :item_name => 'Store purchase',
        :no_shipping => '1',
        :no_note => '1',
        :currency => 'USD',
        :return_url => nil
      }.merge(options)

      # We accept both, strings and money objects as amount    
      amount = amount.cents / 100 if amount.respond_to?(:cents)
      amount = sprintf("%.2f", amount)

      # Build the form 
      returning button = [] do
        button << tag(:input, :type => 'hidden', :name => 'cmd', :value => "_xclick")
        button << tag(:input, :type => 'hidden', :name => 'undefined_quantity', :value => 1)
        button << tag(:input, :type => 'hidden', :name => 'business', :value => business)
        button << tag(:input, :type => 'hidden', :name => 'amount', :value => amount)
        button << tag(:input, :type => 'hidden', :name => 'item_number', :value => item_number)
        button << tag(:input, :type => 'hidden', :name => 'item_name', :value => params[:item_name])
        button << tag(:input, :type => 'hidden', :name => 'no_shipping', :value => params[:no_shipping])
        button << tag(:input, :type => 'hidden', :name => 'no_note', :value => params[:no_note])
        button << tag(:input, :type => 'hidden', :name => 'return', :value => params[:return_url]) if params[:return_url]
        button << tag(:input, :type => 'hidden', :name => 'notify_url', :value => params[:notify_url]) if params[:notify_url]
        button << tag(:input, :type => 'hidden', :name => 'cancel_return', :value => params[:cancel_url]) if params[:cancel_url]

        # if amount was a object of type money or something compatible we will use its currency, 
        # otherwise get the currency from the options. default is USD
        button << tag(:input, :type => 'hidden', :name => 'currency_code', :value => amount.respond_to?(:currency) ? amount.currency : params[:currency])
      end.join("\n")
    end
    
  end
end