require_relative('../db/sql_runner')

class Customer

  attr_reader :id, :name, :funds

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def save()
    sql = "INSERT INTO customers 
    (name, funds) 
    VALUES 
    ('#{@name}', #{@funds}) 
    RETURNING *"
    customer = SqlRunner.run(sql).first()
    @id = customer['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM customers"
    return SqlRunner.run(sql)
  end

end