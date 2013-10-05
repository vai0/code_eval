TWENTY = 	%w{buffer One Two Three Four Five Six Seven Eight 
			Nine Ten Eleven Twelve Thirteen Fourteen 
			Fifteen Sixteen Seventeen Eighteen Nineteen Twenty}
TENS = 		%w{buffer Ten Twenty Thirty Forty Fifty Sixty Seventy 
			Eighty Ninety}

def num_to_word(num)
	word = []
	num_buff = num.to_i.to_s.split("") #to_i is done to remove leading zeroes

	until num_buff.empty? || num_buff.all? {|str| str == "0"}
		case l = num_buff.length 
		when 2, 5, 8 	#when position is in tens, ten thousand, ten million place
			if num_buff[0] != "0" #if string is 0, shift it and loop again
				word << under_hundred(num_buff.slice!(0..1))
				word << "Thousand" if l == 5
				word << "Million" if l == 8
			else
				num_buff.shift
			end
		when 4, 7
			if num_buff[0] != "0"
				word << TWENTY[num_buff.shift.to_i]
				word << "Thousand" if l == 4
				word << "Million" if l == 7
			else
				num_buff.shift
			end
		when 3, 6, 9 	#when position is in hundreds, hundred thousand, hundred mllion place
			if num_buff[0] != "0"
				word << TWENTY[num_buff.shift.to_i] << "Hundred"
			else
				num_buff.shift
			end
		else 			#when number is single digit
			word << TWENTY[num_buff.shift.to_i] 
		end
	end
	word.join
end

def under_hundred(num)
	num_buff = num
	result = []
	if num.join == "00"		#do nothing if string are 0's
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


