class Pokemon
    require 'pry'
attr_accessor :id, :name, :type, :db
@@all = []
    def initialize (hash)
       
        @id = hash[:id]
        @name = hash[:name]
        @type = hash[:type]
        @db = hash[:db]
        @@all << self
    end

    def self.save(name, type, db)
        sql = <<-SQL
          INSERT INTO pokemon (name, type) VALUES (?, ?);
        SQL
        
        db.execute(sql, [name, type])
        end

        def self.find(id, db)
           
            sql = <<-SQL
              SELECT * FROM pokemon WHERE id = (?);
            SQL
            array = db.execute(sql, [id]).flatten
            array << db
            hash = {}
            hash[:id] = array[0]
            hash[:name] = array[1]
            hash[:type] = array[2]
            hash[:db] = array[3]
            Pokemon.new(hash)
            
          end
end
