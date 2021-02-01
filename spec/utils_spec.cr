require "./spec_helper"

describe LiquidCrystal::Utils do
  it "to_integer converts values to integers" do
    LiquidCrystal::Utils.to_integer(10).should eq 10
    LiquidCrystal::Utils.to_integer(9999999999).should eq 9999999999
    LiquidCrystal::Utils.to_integer(9999999999.0).should eq 9999999999
    LiquidCrystal::Utils.to_integer(BigInt.new("99999999999999999999")).should eq BigInt.new("99999999999999999999")
    LiquidCrystal::Utils.to_integer(BigFloat.new("99999999999999999999.0")).should eq BigInt.new("99999999999999999999")
    LiquidCrystal::Utils.to_integer("999999999999999999999999999").should eq BigInt.new("999999999999999999999999999")
    LiquidCrystal::Utils.to_integer("999999999999999999999999999.0").should eq BigInt.new("999999999999999999999999999")
  end

  it "to_number returns numbers from arguments" do
    LiquidCrystal::Utils.to_number(10).should eq 10
    LiquidCrystal::Utils.to_number(10.0).should eq 10.0
    LiquidCrystal::Utils.to_number("10").should eq 10
    LiquidCrystal::Utils.to_number("10.0").should eq BigDecimal.new("10.0")
  end

  it "to_date renders a date from the arguments" do
  end
end
