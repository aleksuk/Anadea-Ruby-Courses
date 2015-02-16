require_relative 'view'

class MyApp

  @path = {
    '/name' => :say_hello,
    '/' => :main,
    '/svg' => :svg
  }

  def self.get_view path
    @path[path]
  end

  def call env
    params = get_request_parameters env
    path = get_request_path env
    view = MyApp.get_view path
    view ||= :main
    [200, { 'Content-Type' => 'text/html' }, [View.send(view, params)]]
  end

  def get_request_parameters env
    params_heshs = env['QUERY_STRING'].split('&')

    params = {}

    params_heshs.each do |el|
      param = el.split('=')
      params[param[0]] = param[1]
    end

    params
  end

  def get_request_path env
    path = env['REQUEST_PATH']
  end

end