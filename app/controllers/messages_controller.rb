class MessagesController < ApplicationController
  def index
    @messages = current_user_session.messages.timeline
  end

  def create
    twilio_messager.call
    @message = current_user_session.create_message(twilio_messager.message_attributes)
    render @message
  end

  private

  def message_params
    params.require(:message).permit(:phone_number, :body)
  end

  def twilio_messager
    @twilio_messager ||= TwilioMessager.new(message_params)
  end
end
