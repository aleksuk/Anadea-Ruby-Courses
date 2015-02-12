require_relative 'line'
require_relative 'circle'
require_relative 'rect'
# require_relative 'arrow'

module SVG
  def render &block
    
  end
  
  class Picture

    def initialize
      @start_picture = '<?xml version="1.0" encoding="UTF-8" standalone="no"?><svg xmlns="http://www.w3.org/2000/svg" version="1.1" width="300" height="300">'

      @end_picture = '</svg>'
    end

    def render_picture arr
      @content = arr.reduce '' do |sum, el|
        sum + el.render
      end

      create_svg_file @start_picture + @content + @end_picture
    end

    def get_picture
      result = [
        Line.new(50, 160, 50, 220),
        Rect.new(42, 120, 16, 40),
        Line.new(75, 235, 100, 235),
        Line.new(50, 275, 200, 275),
        Circle.new(50, 180, 3, 'black'),
        Line.new(50, 100, 50, 120),
        # Arrow.new(200, 250, 175, 240),
        Line.new(75, 220, 75, 250, 3),
        Circle.new(100, 100, 3, 'black'),
        Line.new(100, 160, 100, 180),
        Line.new(200, 220, 175, 230),
        Line.new(110, 290, 140, 290),
        Line.new(178, 165, 178, 195),
        Line.new(200, 160, 200, 220),
        Line.new(100, 180, 150, 235),
        Line.new(150, 180, 100, 235),
        Line.new(200, 250, 200, 275),
        Line.new(200, 100, 200, 120),
        Circle.new(125, 275, 3, 'black'),
        Line.new(78, 165, 78, 195),
        # Arrow.new(50, 100, 250, 100),
        Circle.new(100, 180, 3, 'black'),
        Line.new(100, 100, 100, 120),
        Rect.new(92, 120, 16, 40),
        Circle.new(200, 100, 3, 'black'),
        Circle.new(200, 180, 3, 'black'),
        Line.new(50, 180, 72, 180),
        Line.new(72, 165, 72, 195),
        Circle.new(70, 235, 25),
        Line.new(150, 100, 150, 120),
        Line.new(125, 275, 125, 290),
        Line.new(78, 180, 100, 180),
        Line.new(150, 180, 172, 180),
        Circle.new(180, 235, 25),
        Line.new(172, 165, 172, 195),
        Circle.new(150, 180, 3, 'black'),
        # Arrow.new(178, 180, 250, 180),
        Line.new(150, 160, 150, 180),
        Line.new(175, 235, 150, 235),
        Rect.new(142, 120, 16, 40),
        Line.new(50, 250, 50, 275),
        Circle.new(150, 100, 3, 'black'),
        Rect.new(192, 120, 16, 40),
        Line.new(50, 220, 75, 230),
        Line.new(175, 220, 175, 250, 3),
        # Arrow.new(50, 250, 75, 240)
      ].reduce '' do |sum, el|
        sum + el.render
      end

      @start_picture + result + @end_picture
    end

    private

      def create_svg_file str
        File.open('picture.svg', 'wb') do |f|
          f.write(str)
        end
      end

  end

end