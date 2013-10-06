def minimum_coins string
	num = string.to_i

	values = [5, 3, 1]

	values.inject(0) do |count, val|
		count += num / val
		num = num % val
		count
	end
end

File.open('pad.txt','r').each do |line|
	puts minimum_coins(line.strip)
end