class Employee < ApplicationRecord
  belongs_to :department
  has_many :tickets

  def oldest_tickets_first
    self.tickets.order(created_at: :asc)
  end

  def oldest_ticket
    oldest_tickets_first.first
  end
end
