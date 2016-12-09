def input_students


  students = []
  student_check = false
  puts "Type any key and then return to submit more student details or return to exit"
  # using alternative to chomp to remove the last white space
    # gets.chop will remove the last character
    # gets.strip will remove all white space at the beginning and end

  name = gets.chomp

  months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" ]

  while !name.empty? do
    # using alternative to chomp to remove the last white space
      # gets.chop will remove the last character
      # gets.strip will remove all white space at the beginning and end
      student_check = false
      # prevents any missing details in the input
      while student_check == false
  puts "Please enter first name: "
  first_name = gets[0...-1].capitalize
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
    if first_name == "" || surname == "" || hobbies == "" || country_of_birth == "" || height == ""
      puts "some student details are missing please try again" 
    else
      student_check = true
    end
    end

  #add the student to the array
    #add the student to the array
    #students << {first_name: first_name, surname: surname, cohort: cohort} #, hobbies: hobbies, country_of_birth: country_of_birth, heighth: height}
    students << {first_name: first_name, surname: surname, cohort: cohort, hobbies: hobbies, country_of_birth: country_of_birth, heighth: height}
  # checking to see if students are singular or plural

  if students.count == 1
      plural = "student"
    else
      plural = "students"
  end

    puts "Now we have #{students.count} #{plural}".center(60)
    puts "Type any key and then return to submit more student details or return to exit"
  name = gets.chomp
  end
    students

end

def print_body(students)
  # adding months to use the index as an ordering mechanism for sorting
  months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" ]
  # creating a new hash that sorts and groups students by months
  student_sort = students.sort_by { |student| months.index student[:cohort]} #sort_by { |x| x[:cohort] }
  # puts student details
  student_sort.each.with_index(1) do |x, index|
  puts "#{index} #{x[:first_name]} #{x[:surname]} (#{x[:cohort]} cohort)".center(60)
    end
end

def print_header
  puts "The students of Villians Academy".center(60)
  puts "______________".center(60)
end

def print_footer(students)
  # checking to see if students are singular or plural
    if students.count == 0
      exit
    elsif students.count == 1
      plural = "student"
    else
      plural = "students"
    end
      puts "Overall, we have #{students.count} great #{plural}".center(60)
end
# nothing will happen until we call the methods
students = input_students
print_header
print_body(students)
print_footer(students)
