# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
    dept1 = Department.create!(name: "Warehouse", floor: 1)
    dept2 = Department.create!(name: "Marketing", floor: 2)
    dept3 = Department.create!(name: "Human Relations", floor: 3)

    employee1 = dept1.employees.create!(name: "George", level: 3)
    employee2 = dept1.employees.create!(name: "James", level: 8)
    employee3 = dept2.employees.create!(name: "Jill", level: 3)
    employee4 = dept2.employees.create!(name: "Susie", level: 9)
    employee5 = dept3.employees.create!(name: "Johnson", level: 5)

    ticket1 = employee1.tickets.create!(description: "Screen Broke Won't Work")
    ticket2 = employee1.tickets.create!(description: "Screen Shows Laughing Skull Always")
    ticket3 = employee1.tickets.create!(description: "Screen Missing Altogether")
    ticket4 = Ticket.create!(description: "Damn thing won't print!")
    ticket5 = Ticket.create!(description: "When will they put these in ABC order!??!")
    ticket6 = Ticket.create!(description: "Calculator Fire")
