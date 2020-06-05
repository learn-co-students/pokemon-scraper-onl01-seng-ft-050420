class Pokemon
    attr_accessor :name, :type, :db
    attr_reader :id
    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end
    def self.save(name, type, db)
            sql = <<-SQL
                INSERT INTO pokemon (name, type)
                VALUES (?, ?)
SQL
            db.execute(sql, name, type)
    end
    def self.find(id, db)
        p = db.execute("SELECT name, type FROM pokemon WHERE id=?", id)
        new = Pokemon.new(id: id, name: p[0][0], type: p[0][1], db: db)
    end
end
