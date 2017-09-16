module TrackingOrder
  class RadioBuilder

    class << self
      include ActionView::Helpers::FormHelper
      def build(type_collection = [])
        type_collection.map do |type|
          html = [radio_button_tag(:status, type.to_sym)]
          html << label_tag(:status, I18n.t("admin.actions.tracking_order.status_type.#{type}"))
          html << '<br />'
          html.join(' ')
        end.join
      end
    end
  end
end