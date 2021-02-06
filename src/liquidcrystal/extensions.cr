require 'time'

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

class Symbol
  include LiquidCrystal::ToLiquid
end

class Array
  include LiquidCrystal::ToLiquid
end

class Hash
  include LiquidCrystal::ToLiquid
end

class Numeric
  include LiquidCrystal::ToLiquid
end

class Range
  include LiquidCrystal::ToLiquid
end

class Time
  include LiquidCrystal::ToLiquid
end

class TrueClass
  include LiquidCrystal::ToLiquid
end

class FalseClass
  include LiquidCrystal::ToLiquid
end

class NilClass
  include LiquidCrystal::ToLiquid
end
