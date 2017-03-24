require('pry')
require_relative('models/customer')
require_relative('models/film')
require_relative('models/ticket')

Ticket.delete_all()
Customer.delete_all()
Film.delete_all()

customer1 = Customer.new({
  'name' => 'Allegra',
  'funds' => 20
  })
customer1.save()

customer2 = Customer.new({
  'name' => 'Chiara',
  'funds' => 13
  })
customer2.save()


film1 = Film.new({
  'title' => 'sing street',
  'price' => 15
  })
film1.save()

film2 = Film.new({
  'title' => 'pride',
  'price' => 25
  })
film1.save()


ticket1 = Ticket.new({
  'customer_id' => customer1.id,
  'film_id' => film1.id
  })
ticket1.save()

ticket2 = Ticket.new({
  'customer_id' => customer2.id,
  'film_id' => film1.id
  })
ticket1.save()

ticket3 = Ticket.new({
  'customer_id' => customer1.id,
  'film_id' => film2.id
  })
ticket1.save()







binding.pry
nil