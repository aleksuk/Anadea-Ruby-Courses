require 'spec_helper'

describe SVG::Rect do
  it "#render should return sting with passed data" do
    rect = SVG::Rect.new 42, 120, 16, 40
    expected_result = "<rect x=\"42\" y=\"120\" width=\"16\" height=\"40\" />"
    
    expect(rect.render).to eq(expected_result)
  end
end