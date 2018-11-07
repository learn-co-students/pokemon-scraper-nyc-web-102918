class Pokemon
	def self.find(id, db)
		data = db.execute("SELECT * FROM pokemon WHERE id = ?", id).first

		self.new(id: data[0], name: data[1], type: data[2], db: db)
	end

	def self.save(name, type, db)
		db.execute("INSERT OR IGNORE INTO pokemon(name, type) VALUES (?, ?)", name, type)
	end

	attr_accessor :name, :type
	attr_reader :id, :db, :hp

	def initialize(id:, name:, type:, db:)
		@id = id
		@name = name
		@type = type
		@db = db
		@hp = 60

		db.execute("INSERT OR IGNORE INTO pokemon(id, name, type) VALUES (?, ?, ?)", id, name, type)
	end

	# def alter_hp(hp, db)
	# 	@hp = hp

	# 	db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, @id)
	# end
end
