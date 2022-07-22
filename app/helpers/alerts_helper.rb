# frozen_string_literal: true

module AlertsHelper
  def alert_class(flash_type)
    case flash_type
    when 'alert' then 'alert-danger'
    when 'notice' then 'alert-success'
    else
      raise "Invalid flash_type: #{flash_type.inspect}"
    end
  end
end
