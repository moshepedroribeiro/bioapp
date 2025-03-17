Culture.find_each do |culture|
  # Create 24 logs for each culture, one per hour for a day
  24.times do |hour|
    base_time = DateTime.new(2025, 1, 15, hour, 0, 0)
    
    CultureLog.create!(
      culture: culture,
      pressure: rand(0.10..0.50).round(2),
      oxygen: rand(0.00..0.11).round(2),
      temperature: rand(26.00..30.00).round(2),
      ph: rand(5.0..8.0).round(2),
      concentration: rand(0.00..100.00).round(2),
      contaminants: [true, false].sample,
      created_at: base_time,
      updated_at: base_time
    )
  end
end



