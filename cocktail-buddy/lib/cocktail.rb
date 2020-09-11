class Cocktail
    @@all = []

    attr_accessor :name, :index, :ingredients, :method

    def initialize(name)
        self.name = name
        self.index = index
        @@all << self
    end

    def self.all
        @@all
    end
end