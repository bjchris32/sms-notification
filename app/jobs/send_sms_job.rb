class SendSmsJob
  include Sidekiq::Job
  sidekiq_options queue: 'user_registration', retry: 2

  def perform(user_email)
    twilio_service = TwilioService.new
    twilio_service.send_sms("New User #{user_email} Just Signed up!")
  end
end
