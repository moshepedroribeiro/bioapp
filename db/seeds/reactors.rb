reactors = [
  { name: 'Bioreactor A', code: 'BIO-A', activated_at: Time.current },
  { name: 'Bioreactor B', code: 'BIO-B', activated_at: Time.current }
]

Reactor.create!(reactors)