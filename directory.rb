# first e print a list of students
students = [
  "Dr. Hannibal Lector",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]
# and then print them
puts "The students of Villians Academy"
puts "______________"
students.each do |student|
  puts student 
end
# finally, we print the total number of students
puts "Overall, we have #{students.count} great students"
