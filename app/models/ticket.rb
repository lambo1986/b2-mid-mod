class Ticket < ApplicationRecord
  belongs_to :employee

  def self.oldest_first
    order(created_at: :desc)
  end
end
