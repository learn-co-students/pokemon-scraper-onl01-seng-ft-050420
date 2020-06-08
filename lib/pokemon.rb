require 'pry'

class Pokemon
  attr_accessor :name, :type, :db, :id
  
  
  def initialize(id: , name: , type: , db: )
    @name = name
    @type = type
    @db = db
    @id = id
  end
  
  def self.save(name, type, db)
    db.execute(
      "INSERT INTO pokemon (name, type) VALUES (?, ?)",
      name, 
      type)
  end
 
  
  def self.find(i_d, data_base)
    row = data_base.execute("SELECT * FROM pokemon WHERE id = (?)", i_d).flatten
    pokemon = Pokemon.new(id: row[0], name: row[1], type: row[2], db: data_base)
  end
  
  
end
