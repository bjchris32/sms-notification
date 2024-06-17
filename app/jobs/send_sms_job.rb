class SendSmsJob < ApplicationJob
  queue_as :user_registration
  sidekiq_options retry: 3

  def perform(user)
    twilio_service = TwilioService.new
    twilio_service.send_sms("New User #{user.email} Just Signed up!")
  end
end
