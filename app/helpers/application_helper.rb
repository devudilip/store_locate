module ApplicationHelper

  def width_on_param
    params[:query] ? "col-lg-9" : "col-lg-12"
  end

end
