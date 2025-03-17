# frozen_string_literal: true

require './app/services/telegram_message_service'

class TelegramController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:message_chat]
  def message_chat
    chat_id = params[:chat_id]
    text = params[:text]
    telegram_service = TelegramMessageService.new
    telegram_service.send_message(chat_id, text)

    render json: { message: "Action completed and Telegram message sent" }
  end
end
