def input_students

  students = []

  puts "Press any key then enter to submit student details or just enter to exit"

  name = gets.chomp

  while !name.empty? do
  puts "Please enter first name: "
  first_name = gets.chomp.capitalize
  puts "Please enter surname: "
  surname = gets.chomp.capitalize
  puts "Please enter cohort: "
  cohort = gets.chomp.capitalize
  puts "Please enter hobbies: "
  hobbies = gets.chomp.capitalize
  puts "\nPlease enter country of birth: "
  country_of_birth = gets.chomp.capitalize
  puts "\nPlease enter height in inches: "
  height = gets.chomp.capitalize

  #add the student to the array
  students << {first_name: first_name, surname: surname, cohort: cohort, hobbies: hobbies, country_of_birth: country_of_birth, heighth: height}
    puts "Now we have #{students.count} students"
    puts "Press any key and return to add another student or just return to exit"
  name = gets.chomp
  end
    students

end

def print(students)

  # 4. will use a while loop to return student names
  count = students.count
  while count > 0 do
  students.each.with_index(1) do |student, index|
   puts "#{index} #{student[:first_name]} #{student[:surname]}(#{student[:cohort]} cohort)"
  count -= 1
  end
  end
end

def print_header
  puts "The students of Villians Academy"
  puts "______________"
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end
# nothing will happen until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
