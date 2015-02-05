class Circle

  def initialize centerX, centerY, radius, color = ''
    @centerX, @centerY, @radius, @color = centerX, centerY, radius, color
  end

  def render
    "<circle cx=\"#{@centerX}\" cy=\"#{@centerY}\" r=\"#{@radius}\" fill=\"#{@color}\" />"
  end
end