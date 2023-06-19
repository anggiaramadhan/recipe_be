# frozen_string_literal: true

# recipe class
class Recipe
  attr_reader :name, :ingredients, :method_steps

  # state management
  @@recipes = {}

  def initialize(name)
    @name = name
    @ingredients = []
    @method_steps = []
  end

  class << self
    def clear
      @@recipes = {}
    end

    def describe(&block)
      instance_eval(&block)
    end

    def recipe(name, &block)
      rec = Recipe.new(name)
      rec.instance_eval(&block)
      @@recipes[name] = rec
    end

    def for(name)
      @@recipes[name]
    end
  end

  def method(&block)
    instance_eval(&block)
  end

  def ingredient(ing)
    @ingredients.push(ing)
  end

  def step(stp)
    @method_steps.push(stp)
  end
end
