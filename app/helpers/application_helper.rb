module ApplicationHelper
  def delivery_proximity_label(delivery_date)
    days_until_delivery = (delivery_date - Date.current).to_i

    case days_until_delivery
    when ..-1
      overdue_days = days_until_delivery.abs
      "Overdue by #{pluralize(overdue_days, 'day')}"
    when 0
      "Due Today"
    when 1
      "Due Tomorrow"
    else
      "Due in #{pluralize(days_until_delivery, 'day')}"
    end
  end
end
