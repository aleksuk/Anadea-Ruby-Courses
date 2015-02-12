module SVG

  class Rect

    def initialize x, y, width, height
      @x, @y, @width, @height = x, y, width, height
    end

    def render
      "<rect x=\"#{@x}\" y=\"#{@y}\" width=\"#{@width}\" height=\"#{@height}\" />"
    end
    
  end

end