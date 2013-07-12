require 'erb'
require 'active_support/core_ext'
require_relative 'params'
require_relative 'session'


class ControllerBase
  attr_reader :params

  def initialize(req, res)
    @req = req
    @res = res
    @params = Params.new(req)
    # @route_params = route_params
    @already_rendered = false

  end

  def session
    @session ||= Session.new(@req)
  end

  #not sure I need this?
  def already_rendered?
    @already_rendered
  end

  def redirect_to(url)
    raise 'Can not render body twice.' if already_rendered?
    #needs to set the response status and header
    @res.set_redirect(WEBrick::HTTPStatus::TemporaryRedirect, url)
    @already_rendered = true
    session.store_session(@req)
  end

  def render_content(body, content_type)
    raise 'Can not render body twice.' if already_rendered?
    @res.body = body
    @res.content_type = content_type
    @already_rendered = true
    session.store_session(@req)
  end

  def render(template_name)
    template_address = "views/#{self.class.name.underscore}/#{template_name}.html.erb"
    erb_template = ERB.new(File.read(template_address)).result(binding)
    render_content(erb_template, "text/html")
  end

  def invoke_action(name)
  end
end
