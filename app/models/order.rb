class Order < ApplicationRecord
  enum status: {
    requested: 'requested',
    accepted: 'accepted',
    rejected: 'rejected',
    producing: 'producing',
    sent: 'sent',
  }
end
