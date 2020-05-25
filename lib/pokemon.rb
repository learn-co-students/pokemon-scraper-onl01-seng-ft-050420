class Pokemon
  attr_accessor :name, :type, :db, :id
  
  def initialize(name:, type:, db:, id:nil)
    @name = name
    @type = type
    @db = db
    @id = id
  end
  
  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?, ?)
    SQL
 
    db.execute(sql, name, type)
  end
  
  def self.find(id, db)
    sql = <<-SQL
      SELECT * FROM pokemon WHERE id = ?
    SQL
 
    result = db.execute(sql, id)
    pokemon = Pokemon.new(name: result[0][1], type: result[0][2], db: db, id: result[0][0])
    return pokemon
  end
end
