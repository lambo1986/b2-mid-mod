require "rails_helper"

RSpec.describe "departments index page", type: :feature do
  it "shows the departments and their name and floor number, and all the employees" do
    dept1 = Department.create!(name: "Warehouse", floor: 1)
    dept2 = Department.create!(name: "Marketing", floor: 2)
    dept3 = Department.create!(name: "Human Relations", floor: 3)

    employee1 = dept1.employees.create!(name: "George", level: 3)
    employee2 = dept1.employees.create!(name: "James", level: 8)
    employee3 = dept2.employees.create!(name: "Jill", level: 3)
    employee4 = dept2.employees.create!(name: "Susie", level: 9)
    employee5 = dept3.employees.create!(name: "Johnson", level: 5)

    visit "/departments"

    expect(current_path).to eq("/departments")
    expect(page).to have_content("Warehouse: Floor 1")
    expect(page).to have_content("Marketing: Floor 2")
    expect(page).to have_content("Human Relations: Floor 3")
    expect(page).to have_content(employee1.name)
    expect(page).to have_content(employee2.name)
    expect(page).to have_content(employee3.name)
    expect(page).to have_content(employee4.name)
    expect(page).to have_content(employee5.name)
  end
end
