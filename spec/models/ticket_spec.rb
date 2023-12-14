require "rails_helper"

RSpec.describe Ticket, type: :model do
  describe "relationships" do
    it { should belong_to :employee }
  end

  describe "class methods" do
    it "has a method to sort tickets by oldest to newest" do
      dept1 = Department.create!(name: "Warehouse", floor: 1)
      employee1 = dept1.employees.create!(name: "George", level: 3)
      ticket1 = employee1.tickets.create!(description: "Screen Broke Won't Work")
      ticket2 = employee1.tickets.create!(description: "Screen Shows Laughing Skull Always")
      ticket3 = employee1.tickets.create!(description: "Screen Missing Altogether")

      expect(Ticket.oldest_first).to eq [ticket3, ticket2, ticket1]
    end
  end
end
