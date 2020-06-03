class Pokemon
  attr_accessor :name, :type
  attr_reader :id, :db 
  
  def initialize(name:, type:, db:, id:nil)
    @name = name 
    @type = type 
    @id = id 
    @db = db
    @@all << self
  end 
  
  def self.save(name, type, db)
    pk = self.all.find{|obj| obj.name == name}
    sql = <<-SQL 
      INSERT INTO pokemon (name, type)
      VALUES (?,?)
    SQL
    db.execute(sql, pk.name, pk.type)
    @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end
  
  def self.find(id, db)
    sql = <<-SQL 
      SELECT * FROM pokemon 
      WHERE id = ? 
    SQL
    db.execute(sql, id).collect {|row| self.new(id: row[0], name: row[1], type: row[2], db: db)}[0]
  end 
  
end 
