require 'twilio-ruby'

class MessagesController < ApplicationController
  TWILIO_SID = ENV['TWILIO_ACCOUNT_SID']
  TWILIO_AUTH_TOKEN = ENV['TWILIO_AUTH_TOKEN']
  TWILIO_PHONE_NUMBER = ENV['TWILIO_PHONE_NUMBER']
  before_action :authenticate_user!

  def create
    response = send_message(
      message_params[:phone_number], 
      message_params[:content]
    )
    
    Rails.logger.info("HERE")
    Rails.logger.info(response.sid)

    @message = Message.create do |doc|
      doc.content = message_params[:content]
      doc.phone_number = message_params[:phone_number]
      doc.user = current_user
      doc.sent_at = Time.zone.now
      doc.sid = response.sid
    end

    current_user.messages << @message

    Rails.logger.info("HERE")
    Rails.logger.info(@message.sid)

    render :show
  end

  def send_message(phone_number, content)
    twilio_client.messages.create(
      body: content,
      to: phone_number,
      from: TWILIO_PHONE_NUMBER
    )
  end

  def twilio_client
    @client ||= Twilio::REST::Client.new TWILIO_SID, TWILIO_AUTH_TOKEN
  end

  private

  def message_params
    params.expect(message: [:content, :phone_number])
  end
end
