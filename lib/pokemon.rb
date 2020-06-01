class Pokemon
  attr_accessor :id, :name, :type, :db
  
  def initialize(id: nil, name:, type:, db:)  
    @id = id
    @name = name
    @type = type
    @db = db
  end
  
  def self.save(name, type, db)
    sql = "INSERT INTO pokemon (name, type, db) VALUES (?, ?, ?);"
    @db[:conn].execute(sql, name, type, db)
    @id = @db[:conn].execute("SELECT last_insert_rowid()")[0][0]
  end
    
  def self.find(id, db)
    sql = "SELECT * FROM pokemon WHERE id = ?;"
    result = @db[:conn].execute(sql, id)
    self.new(result[0], result[1], result[2], db)
  end

end
