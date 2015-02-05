require_relative 'line'
require_relative 'circle'
require_relative 'rect'

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

  private

    def create_svg_file str
      File.open('picture.svg', 'wb') do |f|
        f.write(str)
      end
    end

end
