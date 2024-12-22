require 'faker'

# Generate dummy Employee data
def generate_employees(count)
  employees = []

  count.times do
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    email = Faker::Internet.email(name: "#{first_name} #{last_name}")
    salary = rand(40_000..120_000)
    active = [true, false].sample

    employees << {
      first_name: first_name,
      last_name: last_name,
      salary: salary,
      active: active,
      email: email
    }
  end

  employees
end

class Employee
  attr_accessor :first_name, :last_name, :salary, :active, :email

  def initialize(input_options)
    @first_name = input_options[:first_name] || "First"
    @last_name = input_options[:last_name] || "Last"
    @salary = input_options[:salary]
    @active = input_options[:active]
    @email = input_options[:email] || "#{@first_name}#{@last_name}@gmail.com".downcase
  end

  def print_info
    puts "#{@first_name} #{@last_name} makes #{@salary} a year."
  end

  def give_annual_raise
    @salary = 1.05 * @salary
  end
  def full_name
    if last_name[-1] == "s"
      puts "#{first_name} #{last_name}, Esquire"
    else
      puts "#{first_name} #{last_name}"
    end
  end
end

employee1 = Employee.new({first_name: "Majora", last_name: "Carter", salary: 80000, active: true})
employee2 = Employee.new(first_name: "Danilo", last_name: "Campos", salary: 70000, active: true)
employee3 = Employee.new(last_name: "Barbe", salary: 70000, active: true)
employee1.print_info
employee2.print_info

puts "First solution"
employee1.full_name
employee2.full_name

puts "Second solution"
employee3.full_name

puts "Third solution"
puts employee3.email
# employee3.email = "me@mail.me"
# puts employee3.email

puts "Fourth solution"

generate_employees(100).each do |employee|
  system("clear")
  puts "Hello I am #{employee[:first_name]} #{employee[:last_name]}"
  puts "Email: #{employee[:email]}"
  puts "Would you like to continue? Hit enter."
  input = gets.chomp
  if !input.empty?
    break
  end
end