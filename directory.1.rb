@students = [] # an empty array accessible to all methods

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end

def show_students
  print_header
  print_student_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit # this will cause the program to terminate
  else
    puts "I don't know what you meant, try again"
  end
end

def input_students
  student_check = false
  puts "Type any key and then return to submit student details or return to exit"

  name = STDIN.gets.chomp

  @months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" ]

  while !name.empty? do
      student_check = false
      # prevents any missing details in the input
      while student_check == false
        # using alternative to chomp to remove the last white space
          # gets.chop will remove the last character
          # gets.strip will remove all white space at the beginning and end
          # or first_name = gets[0...-1].capitalize
  puts "Please enter first name: "
  first_name = STDIN.gets.chomp.capitalize
  puts "Please enter surname: "
  surname = STDIN.gets.chomp.capitalize
  cohort_month = false
   while  cohort_month == false
  puts "Please enter cohort: "
  cohort = STDIN.gets.chomp.capitalize
    # check to see if valid month is entered
    if !@months.include? cohort
      puts "Invalid entry please re-enter cohort"
    else
      cohort_month = true
   end
   end
  puts "Please enter hobbies: "
  hobbies = STDIN.gets.chomp.capitalize
  puts "\nPlease enter country of birth: "
  country_of_birth = STDIN.gets.chomp.capitalize
  puts "\nPlease enter height in inches: "
  height = STDIN.gets.chomp.capitalize

    # check to see if all fields have been populated
    if first_name == "" || surname == "" || hobbies == "" || country_of_birth == "" || height == ""
      puts "some student details are missing please try again"
    else
      student_check = true
    end
    end

    #add the student to the array
    @students << {first_name: first_name, surname: surname, cohort: cohort, hobbies: hobbies, country_of_birth: country_of_birth, heighth: height}

  # checking to see if students are singular or plural
  if @students.count == 1
      plural = "student"
    else
      plural = "students"
  end

    puts "Now we have #{@students.count} #{plural}".center(60)
    puts "Type any key and then return to submit student details or enter for main menu"
  name = STDIN.gets.chomp
  end
end


def print_student_list()
  # adding months to use the index as an ordering mechanism for sorting
  # creating a new hash that sorts and groups students by months
  student_sort = @students.sort_by { |student| @months.index student[:cohort]} #sort_by { |x| x[:cohort] }
  # puts student details
  student_sort.each.with_index(1) do |x, index|
  puts "#{index} #{x[:first_name]} #{x[:surname]} (#{x[:cohort]} cohort)".center(60)
    end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_header
  puts "The students of Villians Academy".center(60)
  puts "______________".center(60)
end

def print_footer()
  # checking to see if students are singular or plural
    if @students.count == 0
      exit
    elsif @students.count == 1
      plural = "student"
    else
      plural = "students"
    end
      puts "Overall, we have #{@students.count} great #{plural}".center(60)
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # get out of the method if ti isnt given
  if File.exists?(filename) # if it exists
    load_students(filename)
      puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

# nothing will happen until we call the methods
try_load_students
interactive_menu
