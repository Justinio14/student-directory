# first e print a list of students
students = [
  {name: "Dr. Hannibal Lector", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
]

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    #add the student to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end
def print_header
  puts "The students of Villians Academy"
  puts "______________"
end

def print(students)

  # 4. will use a while loop to return student names
  count = students.count
  while count > 0 do
  students.each.with_index(1) do |student, index|
   puts "#{index} #{student[:name]} (#{student[:cohort]} cohort)"
  count -= 1
  end
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end
# nothing will happen until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
