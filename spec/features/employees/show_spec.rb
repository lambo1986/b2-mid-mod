require "rails_helper"

RSpec.describe "employees show page", type: :feature do
  it "shows the employee's name and dept and their tickets, oldest to newest" do
    dept1 = Department.create!(name: "Warehouse", floor: 1)
    employee1 = dept1.employees.create!(name: "George", level: 3)
    ticket1 = employee1.tickets.create!(description: "Screen Broke Won't Work")
    ticket2 = employee1.tickets.create!(description: "Screen Shows Laughing Skull Always")
    ticket3 = employee1.tickets.create!(description: "Screen Missing Altogether")

    visit "/employees/#{employee1.id}"

    expect(page).to have_content(employee1.name)
    expect(page).to have_content(employee1.department.name)
    expect(page).to have_content(ticket1.description)
    expect(page).to have_content(ticket1.created_at)
    expect(page).to have_content(ticket2.description)
    expect(page).to have_content(ticket2.created_at)
    expect(page).to have_content(ticket3.description)
    expect(page).to have_content(ticket3.created_at)
    expect(ticket1.description).to appear_before(ticket2.description)
    expect(ticket2.description).to appear_before(ticket3.description)
  end

  it "does not show tickets not assigned to this employee,
      has a form to assign a ticket to this employee by ticket_id" do
    dept1 = Department.create!(name: "Warehouse", floor: 1)
    employee1 = dept1.employees.create!(name: "George", level: 3)
    employee2 = dept1.employees.create!(name: "James", level: 8)
    ticket4 = employee1.tickets.create!(description: "Damn thing won't print!")
    ticket5 = employee1.tickets.create!(description: "When will they put these in ABC order!??!")
    ticket6 = employee2.tickets.create!(description: "Calculator Fire")

    visit "/employees/#{employee1.id}"

    expect(page).not_to have_content(ticket6.description)
    expect(page).to have_button("Add Ticket")

    fill_in "Add Ticket", with: ticket6.id
    click_button("Add Ticket")

    expect(current_path).to eq("/employees/#{employee1.id}")
    expect(page).to have_content(ticket6.description)
  end
end
