require_relative 'picture'

class View

  def self.main *params
    result = <<STR
    What is your name?
    <form action=\"/name\">
        <input name=\"name\">
        <input type=\"submit\">
    </form>

    <a href=\"/svg\"> SVG </a>
STR
  end

  def self.say_hello *params
    result =<<STR
    Hello #{params[0]['name']}!
    <a href="/"> Main </a>
STR
  end

  def self.svg *params
    SVG::Picture.new.get_picture + '<a href="/">Main</a>'
  end

end
