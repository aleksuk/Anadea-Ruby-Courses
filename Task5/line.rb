module SVG

  class Line

    def initialize startX, startY, endX, endY, stroke_width = nil
      @startX, @startY, @endX, @endY, @stroke_width = startX, startY, endX, endY, stroke_width
    end

    def render
      result = "<line x1=\"#{@startX}\" y1=\"#{@startY}\" x2=\"#{@endX}\" y2=\"#{@endY}\" "

      result += @stroke_width ? "stroke_width=\"#{@stroke_width}\" />" : "/>"
    end
    
  end

end