TWENTY = %w{buff One Two Three Four Five Six Seven Eight Nine Ten Eleven Twelve Thirteen Fourteen Fifteen Sixteen Seventeen Eighteen Nineteen Twenty}
TENS = %w{buff Ten Twenty Thirty Forty Fifty Sixty Seventy Eighty Ninety}

def num_to_word(num)
	word = []
	num_buff = num.to_s.split("")

	until num_buff.empty?
		case l = num_buff.length 
		when 1
			word << TWENTY[num_buff.shift.to_i] 
		when 2, 5, 8 #when position is in tens, ten thousand, ten million place
			word << under_hundred(num_buff.slice!(0..1))
			word << "Thousand" if l == 5
		when 4, 7
			word << under_hundred(num_buff.slice!())
		when 3, 6, 9 #when position is in hundreds, hundred thousand, hundred mllion place
			word << TWENTY[num_buff.shift.to_i] << "Hundred"
		else
		end
	end
	# word << "Dollars"
	word.join
end

def under_hundred(num)
	num_buff = num
	result = []
	if num.join == "00" #do nothing if string are 0's
		return 
	elsif num.join.to_i < 21
		result << TWENTY[num_buff.join.to_i]
	else
		result << TENS[num_buff.shift.to_i]
		return result.join if num_buff.join == "0"
		result << TWENTY[num_buff.shift.to_i]
	end
	result.join
end

p num_to_word()

# a = [1,2,3,4,5,6,7,8,9]

# a.each do |num|
# 	puts case 
# 	when num % 3 == 0
# 		num
# 	when num == 1
# 		"this is number one"
# 	end
# end