def input_students


  students = []

  puts "Press any key then enter to submit student details or just enter to exit"


  name = gets.chomp

  months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" ]

  while !name.empty? do
  puts "Please enter first name: "
  first_name = gets.chomp.capitalize
  #if first_name.empty? then students[:first_name] "misc"
  #end
  puts "Please enter surname: "
  surname = gets.chomp.capitalize
  cohort_month = false
   while  cohort_month == false
  puts "Please enter cohort: "
  cohort = gets.chomp.capitalize
    if !months.include? cohort
      puts "Invalid entry please re-enter cohort"
    else
      cohort_month = true
   end
   end
  puts "Please enter hobbies: "
  hobbies = gets.chomp.capitalize
  puts "\nPlease enter country of birth: "
  country_of_birth = gets.chomp.capitalize
  print "\nPlease enter height in inches: "
  height = gets.chomp.capitalize

  #add the student to the array
  students << {first_name: first_name, surname: surname, cohort: cohort, hobbies: hobbies, country_of_birth: country_of_birth, heighth: height}
    puts "Now we have #{students.count} students".center(60)
    puts "Press any key and return to add another student or just return to exit"
  name = gets.chomp
  end
    students

end

def print_body(students)

  # 4. will use a while loop to return student names
  count = students.count
  while count > 0 do
  students.each.with_index(1) do |student, index|
   puts "#{index} #{student[:first_name]} #{student[:surname]}(#{student[:cohort]} cohort)".center(60)
  count -= 1
  end
  end
end

def print_header
  puts "The students of Villians Academy".center(60)
  puts "______________".center(60)
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(60)
end
# nothing will happen until we call the methods
students = input_students
print_header
print_body(students)
print_footer(students)
