require 'spec_helper'

describe SVG::Circle do
  it "#render should return sting with passed data without color" do
    circle = SVG::Circle.new 50, 180, 3
    expected_result = "<circle cx=\"50\" cy=\"180\" r=\"3\" fill=\"\" />"

    expect(circle.render).to eq(expected_result)
  end

  it "#render should return sting with passed data with color" do
    circle = SVG::Circle.new 50, 180, 3, 'red'
    expected_result = "<circle cx=\"50\" cy=\"180\" r=\"3\" fill=\"red\" />"
    
    expect(circle.render).to eq(expected_result)
  end
end