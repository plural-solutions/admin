class Order < ApplicationRecord
  has_many :product_orders
  enum status: {
    requested: 'requested',
    accepted: 'accepted',
    rejected: 'rejected',
    producing: 'producing',
    sent: 'sent',
  }

  rails_admin do
    show do
      field :status do
        pretty_value do
          I18n.t("admin.actions.order.show.status.#{value}")
        end
      end
      field :product_orders do
        pretty_value do
          bindings[:view].render partial: 'order_description', locals: { object: self }
        end
      end
      field :inserted_at
    end

    list do
      field :status do
        pretty_value do
          I18n.t("admin.actions.order.show.status.#{value}")
        end
      end
      field :inserted_at
    end
  end
end
