class Feedback < ActionMailer::Base

  def send_feedback( feedback )
    # Email header info MUST be added here
    @recipients = "jonmagic@gmail.com"
    @from = "feedback@foreverrememberme.com"
    @subject = “Feedback from #{feedback.name}” 

    # Email body substitutions go here
    @body[“message”] = feedback.message
    @body["name"] = feedback.name
  end

end
