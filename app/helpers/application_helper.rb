module ApplicationHelper
  def comment; end

  def render_layout(layout, &block)
    view_flow.set :layout, capture(&block)
    render template: "layouts/#{layout}" # rubocop:disable GitHub/RailsViewRenderLiteral
  end
end
