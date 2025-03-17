if Reactor.none?
  puts 'Creating reactors...'
  require_relative 'seeds/reactors'
end

if Microorganism.none?
  puts 'Creating microorganisms...'
  require_relative 'seeds/microorganisms'
end

if Culture.none?
  puts 'Creating cultures...'
  require_relative 'seeds/cultures'
end

if CultureLog.none? && Culture.any?
  puts 'Creating culture logs...'
  require_relative 'seeds/culture_logs'
end


puts 'Seeding completed!'
puts 'Created:'
puts "  - #{Reactor.count} reactors"
puts "  - #{Microorganism.count} microorganisms"
puts "  - #{Culture.count} cultures"
puts "  - #{CultureLog.count} culture logs"