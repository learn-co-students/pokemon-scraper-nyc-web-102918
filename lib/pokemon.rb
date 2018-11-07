class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  @@all = []

  def initialize(id:, name:, type:, db:, hp:60)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp

    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, database)
    pokemon_data = database.execute("SELECT * FROM pokemon WHERE id = ?", id).first
    Pokemon.new(id:pokemon_data[0], name:pokemon_data[1], type:pokemon_data[2], hp:pokemon_data[3], db:database)
  end

  def alter_hp(hp, db)
    self.hp = hp
    pokemon_data = db.execute("SELECT * FROM pokemon ")
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", self.hp, self.id)
  end
end
