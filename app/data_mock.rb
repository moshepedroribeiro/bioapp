require 'sinatra'
require 'json'
require 'faker'

# run ruby data_mock.rb

# Enable CORS if needed
before do
  content_type :json
  headers 'Access-Control-Allow-Origin' => '*'
end

get '/mock_data/cultures/:id/culture_logs' do |culture_id|
	JSON.generate(
		{
			id: Faker::Number.unique.number(digits: 5),
			culture_id: culture_id,
			pressure: Faker::Number.within(range: 0.10..0.50),
			oxygen: Faker::Number.within(range: 0.00..0.11),
			temperature: Faker::Number.within(range: 26.00..30.00),
			ph: Faker::Number.within(range: 5.0..8.0),
			concentration: Faker::Number.within(range: 0.0..100.0),
			contaminants: Faker::Boolean.boolean(true_ratio: 0.2)
		}
	)
end

get '/mock_data/reactors/:id/data' do |id|
	JSON.generate(
		{
			id: id,
			name: "Reator #{Faker::Number.between(from: 1, to: 12)}",
			code: Faker::Number.unique.number(digits: 5),
		}
	)
end

get '/mock_data/microorganisms/:id/data' do |id|
	JSON.generate(
		{
			id: id,
			name: Faker::Creature::Animal.name,
			code: Faker::Number.unique.number(digits: 5),
		}
	)
end

get '/mock_data/cultures/:id/data' do |id|
	JSON.generate(
		{
			id: id,
			name: Faker::Creature::Animal.name,
			code: Faker::Number.unique.number(digits: 5),
			reactor_id: Faker::Number.unique.number(digits: 5),
			microorganism_id: Faker::Number.unique.number(digits: 5),
		}
	)
end