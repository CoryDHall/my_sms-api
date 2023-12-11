# frozen_string_literal: true

class TwilioMessager
  attr_reader :phone_number, :body, :message

  def initialize(phone_number:, body:)
    @phone_number = phone_number
    @body = body
  end

  def call
    client = Twilio::REST::Client.new
    @message = client.messages.create(**message_payload)
  end

  def message_attributes
    {
      phone: message.to,
      body:,
      error_message: message.error_message,
      sid: message.sid,
      status: message.status,
      # TODO: check if date sent is updated when message is delivered
      sent_at: message.date_sent || message.date_created
    }
  end

  private

  def message_payload
    {
      to: phone_number,
      from: Rails.application.credentials.twilio.phone_number,
      body:,
      send_as_mms: long_message?
    }
  end

  def long_message?
    body.length > 160
  end
end

# # Path: my_sms-api/app/controllers/messages_controller.rb
# class MessagesController < ApplicationController
#   def create
#     TwilioMessager.new(message_params[:phone_number], message_params[:body]).call
#   end

#   private

#   def message_params
#     params.require(:message).permit(:phone_number, :body)
#   end
# end
