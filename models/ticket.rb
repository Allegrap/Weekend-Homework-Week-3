require_relative('../db/sql_runner')

class Ticket

  attr_accessor :customer_id, :film_id

  def initialize(options)
    @id = options['id'].to_i
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
  end

  def save()
    sql = "INSERT INTO tickets 
    (customer_id, film_id) 
    VALUES 
    (#{@customer_id}, #{@film_id}) 
    RETURNING *"
    ticket = SqlRunner.run(sql).first()
    @id = ticket['id'].to_i
  end

  def customer()
    sql = "SELECT * FROM customers WHERE id = #{@customer_id}"
    customer = SqlRunner.run(sql).first
    return Customer.new(customer)
  end

  def film()
    sql = "SELECT * FROM films WHERE id = #{@film_id}"
    film = SqlRunner.run(sql).first
    return Film.new(film)
  end

  def self.all()
    sql = "SELECT * FROM tickets"
    tickets =  SqlRunner.run(sql)
    return tickets.map{|ticket| Ticket.new(ticket)}
  end

  def self.delete_all()
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end

end