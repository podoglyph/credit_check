#@TODO: need to verify a number is entered, also try and use methods for clarity

puts "Enter a credit card number."
card_num = gets.to_s.gsub(/\s+/, "")

#determine index range
num_length = card_num.length
if num_length.even?
  num_range_extract = (0..num_length - 1)
  num_range_remain = (1..num_length)
else
  num_range_extract = (1..num_length - 1)
  num_range_remain = (0..num_length)
end

num_set = []
num_set_two_digit = []
singles_set = []

#extract numbers and multiply
num_range_extract.step(2).each do |index|
  num_set.push(card_num[index].to_i * 2)
end

#select double digit numbers
num_set_two_digit = num_set.select { |x| x > 9 }

#remove double digit numbers
num_set = num_set - num_set_two_digit

#break down double digit numbers, add their parts, and put them back with num_set
num_set_two_digit.map! { |x| x.to_s }
num_set_two_digit.map! { |x| x[0].to_i + x[1].to_i }
doubles_set = num_set + num_set_two_digit

#grab the numbers still remaining from the original card number
num_range_remain.step(2).each do |index|
  singles_set.push(card_num[index].to_i)
end

#merge and sum the sets
all_digits = singles_set + doubles_set
sum = all_digits.inject(0) { |sum, x| sum + x}

if sum % 10 == 0
  puts "The number is valid."
else
  puts "Invalid number."
end