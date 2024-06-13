class TwilioService
  def initialize
    @client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
  end

  def send_sms(content, destination_phone = nil)
    @client.messages.create(
      body: content,
      from: ENV['TWILIO_SCOURCE_PHONE'],
      to: destination_phone || ENV['TWILIO_VIRTUAL_PHONE']
    )
  end
end
