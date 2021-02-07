require "time"

module LiquidCrystal
  module ToLiquid
    def to_liquid
      self
    end
  end
end

class String
  include LiquidCrystal::ToLiquid
end

struct Symbol
  include LiquidCrystal::ToLiquid
end

class Array
  include LiquidCrystal::ToLiquid
end

class Hash
  include LiquidCrystal::ToLiquid
end

struct Number
  include LiquidCrystal::ToLiquid
end

struct Range
  include LiquidCrystal::ToLiquid
end

struct Time
  include LiquidCrystal::ToLiquid
end

struct Bool
  include LiquidCrystal::ToLiquid
end

struct Nil
  include LiquidCrystal::ToLiquid
end

struct Tuple
  include LiquidCrystal::ToLiquid
end
