current_date = Date.new(2025, 1, 15)
cultures = []

Reactor.find_each do |reactor|
  Microorganism.find_each do |microorganism|
    cultures << {
      reactor: reactor,
      microorganism: microorganism,
      culture_end_date: current_date + 7.days,
      activated_at: Time.current
    }
  end
end

Culture.create!(cultures)