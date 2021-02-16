class Waiter
    @@all = []
    attr_accessor :name, :age
    def initialize(name, age)
        @name = name
        @age = age
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select do |meal| 
            meal.waiter==self
        end
    end

    def best_tipper
        besttipper=meals.max do |meal_a, meal_b|
            meal_a.tip <=> meal_b.tip
        end
        besttipper.customer
    end
end