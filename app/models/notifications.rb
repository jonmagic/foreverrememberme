class Notifications < ActionMailer::Base

  def signup(user)
    @recipients = user.login
    @from       = 'info@foreverrememberme.com'
    @subject    = 'Thank you for signing up at Forever Remember Me'
    @body["firstname"] = user.firstname
    @body["lastname"] = user.lastname
  end

  def anniversary(user, memorial)
    @recipients = user.login
    @from       = 'info@foreverrememberme.com'
    @subject    = 'Remembering #{@memorial.fullname} today.'
  end

  def renew_memorial(sent_at = Time.now)
    @subject    = 'Notifications#renew_memorial'
    @body       = {}
    @recipients = ''
    @from       = ''
    @sent_on    = sent_at
    @headers    = {}
  end

  def thankyou_for_purchasing_memorial(sent_at = Time.now)
    @subject    = 'Notifications#thankyou_for_purchasing_memorial'
    @body       = {}
    @recipients = ''
    @from       = ''
    @sent_on    = sent_at
    @headers    = {}
  end

  def contactus(sent_at = Time.now)
    @recipients         = 'info@foreverrememberme.com'
    @from               = notification.email
    @subject            = 'ForeverRememberMe.com ContactUs Help Request'
    @body["message"]    = notification.message
    @body["firstname"]  = notification.firstname
    @body["lastname"]   = notification.lastname
    @body["email"]      = notification.email
  end
end
