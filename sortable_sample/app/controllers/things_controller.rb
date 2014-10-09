class ThingsController < ApplicationController
  def permitted_params
    params.permit(menu: [:id, :name, :display_order_position,
      widgets_attributes: [
        :id,
        :name,
        :display_order_position,
        :_destroy,
      ],
    ])
  end

  def update_display_order
    if params[:id] && params[:display_order_position]
      @thing = Thing.find(params[:id])
      if @thing
        @thing.display_order_position = params[:display_order_position].to_i
        @thing.save
      end
    end
    render nothing: true # this is a POST action, updates sent via AJAX, no view rendered
  end
end
