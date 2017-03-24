require('pry')
require_relative('models/customer')
require_relative('models/films')
require_relative('models/ticket')


customer1 = Customer.new({
  'name' => 'Allegra',
  'funds' => 20
  })

film1 = Film.new({
  'title' => 'sing street',
  'price' => 15
  })

ticket1 = Ticket.new({
  'customer_id' => customer1.id,
  'film_id' => film1.id
  })







binding.pry
nil