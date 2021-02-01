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
    ["now", "today"].each do |label|
      LiquidCrystal::Utils.to_date(label).not_nil!.should be >= (Time.local - Time::Span.new(seconds: 1))
      LiquidCrystal::Utils.to_date(label).not_nil!.should be <= (Time.local + Time::Span.new(seconds: 1))
    end

    now = Time.local
    LiquidCrystal::Utils.to_date(now.to_unix).not_nil!.to_unix.should eq now.to_unix
    LiquidCrystal::Utils.to_date(now.to_unix.to_s).not_nil!.to_unix.should eq now.to_unix

    LiquidCrystal::Utils.to_date("2021-02-01 15:15:15").to_s.should eq "2021-02-01 15:15:15 UTC"
    LiquidCrystal::Utils.to_date("2021-02-01 15:16:47 -07:00").to_s.should eq "2021-02-01 15:16:47 -07:00"
    LiquidCrystal::Utils.to_date("1 February 2020").to_s.should eq "2020-02-01 00:00:00 UTC"
  end

  it "slice_collection_using_each carves up a collection" do
    c = ["a", "b", "c", "d", "e", "f"]

    LiquidCrystal::Utils.slice_collection_using_each(c, 2, 4).should eq c[2,2]
  end
end
