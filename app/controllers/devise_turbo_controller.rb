class DeviseTurboController < ApplicationController
  # class Responder < ActionController::Responder
  #   def to_turbo_stream
  #     controller.render(options.merge(formats: :html))
  #   rescue ActionView::MissingTemplate => error
  #     if get?
  #       raise error
  #     elsif has_errors? && default_action
  #       render rendering_options.merge(formats: :html, status: :unprocessable_entity)
  #     else
  #       redirect_to navigation_location
  #     end
  #   end
  # end

  class Responder < ActionController::Responder
    def to_turbo_stream
      if @default_response
        @default_response.call(options.merge(formats: :html))
      else
        controller.render(options.merge(formats: :html))
      end
    rescue ActionView::MissingTemplate => error
      if get?
        raise error
      elsif has_errors? && default_action
        render rendering_options.merge(formats: :html, status: :unprocessable_entity)
      else
        navigation_behavior error
      end
    end
  end

  self.responder = Responder
  respond_to :html, :turbo_stream
end
