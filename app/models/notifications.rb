class Notifications < ActionMailer::Base

  def signup(user)
    @recipients = user.login
    @from       = 'info@foreverrememberme.com'
    @subject    = 'Thank you for signing up at Forever Remember Me'
    @body["firstname"] = user.firstname
    @body["lastname"] = user.lastname
  end

  def anniversary(sent_at = Time.now)
    @recipients = user.login
    @from       = 'info@foreverrememberme.com'
    @subject    = 'Thank you for signing up at Forever Remember Me'
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

  def complaint(sent_at = Time.now)
    @subject    = 'Notifications#complaint'
    @body       = {}
    @recipients = ''
    @from       = ''
    @sent_on    = sent_at
    @headers    = {}
  end
end
