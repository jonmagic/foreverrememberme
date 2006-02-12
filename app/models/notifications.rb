class Notifications < ActionMailer::Base

  def signup(sent_at = Time.now)
    @subject    = 'Notifications#signup'
    @body       = {}
    @recipients = ''
    @from       = ''
    @sent_on    = sent_at
    @headers    = {}
  end

  def anniversary(sent_at = Time.now)
    @subject    = 'Notifications#anniversary'
    @body       = {}
    @recipients = ''
    @from       = ''
    @sent_on    = sent_at
    @headers    = {}
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
