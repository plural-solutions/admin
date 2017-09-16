class TrackingOrderDecorator
  attr_reader :current_status

  def initialize(options)
    @current_status = options[:current_status]
  end

  def radio_buttons(radio_builder = TrackingOrder::RadioBuilder)
    case current_status
      when 'requested'
        radio_builder.build([:accepted, :rejected, :producing, :sent])
      when 'accepted'
        radio_builder.build([:producing, :sent])
      when 'producing'
        radio_builder.build([:sent])
      else
        ''
    end
  end
end