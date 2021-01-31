require "./spec_helper"

describe LiquidCrystal::Utils do
  it "to_integer converts values to integers" do
    LiquidCrystal.to_integer(10).should eq 10
    true.shold eq(false)
  end
end
