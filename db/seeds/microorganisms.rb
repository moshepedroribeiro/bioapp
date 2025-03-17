microorganisms = [
  {
    name: 'E. coli K-12',
    code: 'ECK12',
    desired_pressure: 3,
    desired_oxygen: 20,
    desired_temperature: 37,
    desired_ph: 7,
    activated_at: Time.current
  },
  {
    name: 'S. cerevisiae',
    code: 'SC001',
    desired_pressure: 2,
    desired_oxygen: 15,
    desired_temperature: 30,
    desired_ph: 6,
    activated_at: Time.current
  }
]

Microorganism.create!(microorganisms)