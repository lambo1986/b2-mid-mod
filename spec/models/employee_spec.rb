require "rails_helper"

RSpec.describe Employee, type: :model do
  describe "relationships" do
    it { should belong_to :department }
    it { should have_many :tickets }
  end

  describe "instance methods" do
    it "has a method to sort tickets by oldest to newest" do
      dept1 = Department.create!(name: "Warehouse", floor: 1)
      employee1 = dept1.employees.create!(name: "George", level: 3)
      ticket1 = employee1.tickets.create!(description: "Screen Broke Won't Work")
      ticket2 = employee1.tickets.create!(description: "Screen Shows Laughing Skull Always")
      ticket3 = employee1.tickets.create!(description: "Screen Missing Altogether")

      expect(employee1.oldest_tickets_first).to eq [ticket1, ticket2, ticket3]
    end

    it "has a method to show the oldest ticket" do
      dept1 = Department.create!(name: "Warehouse", floor: 1)
      employee1 = dept1.employees.create!(name: "George", level: 3)
      ticket1 = employee1.tickets.create!(description: "Screen Broke Won't Work")
      ticket2 = employee1.tickets.create!(description: "Screen Shows Laughing Skull Always")
      ticket3 = employee1.tickets.create!(description: "Screen Missing Altogether")

      expect(employee1.oldest_ticket).to eq ticket1
    end
  end
end
