class Pokemon
  attr_accessor :name, :type, :id, :db

  def initialize(id:, name:, type:, db:)
    @id, @name, @type, @db = id, name, type, db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id_num, db)
    sql = "SELECT * FROM pokemon WHERE id = ?"
    result = db.execute(sql, id_num)[0]
    Pokemon.new(id: result[0], name:result[1], type:result[2], db: db)
  end
end
