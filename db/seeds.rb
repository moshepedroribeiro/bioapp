puts 'Cleaning database...'
Reactor.destroy_all
CultureLog.destroy_all
Culture.destroy_all
Microorganism.destroy_all

puts 'Creating reactors...'
reactors = [
  {
    name: 'Bioreactor A',
    code: 'BIO-A',
    active: true
  },
  {
    name: 'Bioreactor B',
    code: 'BIO-B',
    active: true
  }
]

created_reactors = Reactor.create!(reactors)

puts 'Creating microorganisms...'
microorganisms = [
  {
    name: 'E. coli K-12',
    code: 'ECK12',
    desired_pressure: 3,
    desired_oxygen: 20,
    desired_temperature: 37,
    desired_ph: 7,
    active: true
  },
  {
    name: 'S. cerevisiae',
    code: 'SC001',
    desired_pressure: 2,
    desired_oxygen: 15,
    desired_temperature: 30,
    desired_ph: 6,
    active: true
  }
]

created_microorganisms = Microorganism.create!(microorganisms)

puts 'Creating cultures...'
current_date = Date.new(2025, 1, 15)
cultures = []

created_reactors.each do |reactor|
  created_microorganisms.each do |microorganism|
    cultures << {
      reactor_id: reactor.id,
      microorganism_id: microorganism.id,
      culture_end_date: current_date + 7.days,
      active: true
    }
  end
end

created_cultures = Culture.create!(cultures)

puts 'Creating culture logs...'
culture_logs = []

created_cultures.each do |culture|
  # Create 24 logs for each culture, one per hour for a day
  24.times do |hour|
    base_time = DateTime.new(2025, 1, 15, hour, 0, 0)

    culture_logs << {
      culture_id: culture.id,
      pressure: rand(0.10..0.50).round(2),
      oxygen: rand(0.00..0.11).round(2),
      temperature: rand(26.00..30.00).round(2),
      ph: rand(5.0..8.0).round(2),
      concentration: rand(0.00..100.00).round(2),
      contaminants: [true, false].sample,
      created_at: base_time,
      updated_at: base_time
    }
  end
end

CultureLog.create!(culture_logs)

puts 'Seeding completed!'
puts 'Created:'
puts "  - #{Reactor.count} reactors"
puts "  - #{Microorganism.count} microorganisms"
puts "  - #{Culture.count} cultures"
puts "  - #{CultureLog.count} culture logs"