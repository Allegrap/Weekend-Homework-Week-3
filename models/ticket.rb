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

  def self.all()
    sql = "SELECT * FROM tickets"
    tickets =  SqlRunner.run(sql)
    return tickets.map{|ticket| Ticket.new(ticket)}
  end

end