# frozen_string_literal: true

require_relative '../../config/environment'

class CultureLogWorker
  include Sidekiq::Worker

  def perform(culture_id)
    url = "http://localhost:4567/mock_data/cultures/#{culture_id}/culture_logs"
    response = HTTParty.get(url)

    if response.success?
      data = JSON.parse(response.body)

      reactor = Reactor.find(Culture.find(culture_id).reactor_id)
      microorganism = Microorganism.find(Culture.find(culture_id).microorganism_id)
      microorganism_desired_values = {
        pressure: microorganism.desired_pressure,
        oxygen: microorganism.desired_oxygen,
        temperature: microorganism.desired_temperature,
        ph: microorganism.desired_ph,
      }

      if data["pressure"] != microorganism_desired_values[:pressure]
        TelegramMessageService.new.send_message('-1002311779878', "O microorganismo #{microorganism.name} no #{reactor.name} está com pressão inapropiada")
      end

      if data["oxygen"] != microorganism_desired_values[:oxygen]
        TelegramMessageService.new.send_message('-1002311779878', "O microorganismo #{microorganism.name} no #{reactor.name} está com oxigênio inapropiado")
      end

      if data["temperature"] != microorganism_desired_values[:temperature]
        TelegramMessageService.new.send_message('-1002311779878', "O microorganismo #{microorganism.name} no #{reactor.name} está com temperatura inapropiada")
      end

      if data["ph"] != microorganism_desired_values[:ph]
        TelegramMessageService.new.send_message('-1002311779878', "O microorganismo #{microorganism.name} no #{reactor.name} está com pH inapropiado")
      end

    end

  end
end