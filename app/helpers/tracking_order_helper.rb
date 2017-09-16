module TrackingOrderHelper
  def radio_button_status(current_status)
    decorator = TrackingOrderDecorator.new(current_status: current_status)
    decorator.radio_buttons
  end
end