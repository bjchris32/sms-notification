class SendSmsJob < ApplicationJob
  retry_on Exception, wait: :exponentially_longer, attempts: 5
  queue_as :user_registration

  def perform(user)
    twilio_service = TwilioService.new
    twilio_service.send_sms("New User #{user.email} Just Signed up!")
  end
end
