require 'spec_helper'

describe Picture do
  xit "#render_picture create content for creating svg" do
    picture = Picture.new 
    expected_result = '<?xml version="1.0" encoding="UTF-8" standalone="no"?><svg xmlns="http://www.w3.org/2000/svg" version="1.1" width="300" height="300"><circle></circle><line></line></svg>'

    el1 = Object.new 
    el2 = Object.new 
    el1.render = double()
    el2.render = double()
    elements = [
      .stub(:render => '<circle></circle>'),
      Object.new.stub(:render => '<line></line>')
    ]
    picture.render_picture elements
    # expect(picture.render_picture).to recive(:create_svg_file)

  end

  xit "#render should return sting with passed data with stroke width" do
    picture = Picture.new 50, 160, 50, 220, 2
    expected_result = "<picture x1=\"50\" y1=\"160\" x2=\"50\" y2=\"220\" stroke_width=\"2\" />"
    
    expect(picture.render).to eq(expected_result)
  end
end