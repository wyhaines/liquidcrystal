require "big"
require "minion-common"

module LiquidCrystal
  module Utils
    def self.slice_collection(collection, from, to)
      if (from != 0 || !to.nil?) && collection.respond_to?(:load_slice)
        collection.load_slice(from, to)
      else
        slice_collection_using_each(collection, from, to)
      end
    end

    def self.slice_collection_using_each(collection, from, to)
      segments = [] of String
      index = 0

      if collection.is_a?(String)
        return collection.empty? ? [] of String : [collection]
      end
      return [] of String unless collection.respond_to?(:each)

      collection.each do |item|
        if to && to <= index
          break
        end

        if from <= index
          segments << item
        end

        index += 1
      end

      segments
    end

    def self.to_integer(num : Number | String)
      return num if num.is_a?(Int)
      num = num.to_s

      class_list = [Int64, BigInt, nil]
      class_list.each do |klass|
        if klass.nil?
          begin
            return BigInt.new(BigFloat.new(num))
          rescue ::ArgumentError
            raise LiquidCrystal::ArgumentError.new("invalid integer")
          end
        else
          begin
            return klass.new(num)
          rescue ::ArgumentError
            next
          end
        end
      end
    end

    def self.to_number(obj)
      case obj
      when Float
        Float64.new(obj)
      when Number
        obj
      when String
        /\A-?\d+\.\d+\z/.matches?(obj.strip) ? BigDecimal.new(obj) : obj.to_i
      else
        if obj.respond_to?(:to_number)
          obj.to_number
        else
          0
        end
      end
    end

    def self.to_date(obj)
      return obj if obj.is_a?(Time)

      if obj.is_a?(String)
        return nil if obj.empty?
        obj = obj.downcase
      end

      case obj
      when "now", "today"
        Time.local
      when /\A\d+\z/, Int
        Time.new(seconds: obj.to_i64, nanoseconds: 0, location: Time::Location.local)
      when String
        Minion::ParseDate.parse(obj)
      end
    rescue ::ArgumentError
      nil
    end
  end
end
