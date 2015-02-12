require 'spec_helper'

describe SVG::Line do
  it "#render should return sting with passed data without stroke width" do
    line = SVG::Line.new 50, 160, 50, 220
    expected_result = "<line x1=\"50\" y1=\"160\" x2=\"50\" y2=\"220\" />"

    expect(line.render).to eq(expected_result)
  end

  it "#render should return sting with passed data with stroke width" do
    line = SVG::Line.new 50, 160, 50, 220, 2
    expected_result = "<line x1=\"50\" y1=\"160\" x2=\"50\" y2=\"220\" stroke_width=\"2\" />"
    
    expect(line.render).to eq(expected_result)
  end
end