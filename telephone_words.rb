MAP = {
	"0" => %w{0},
	"1" => %w{1},
	"2" => %w{a b c},
	"3" => %w{d e f},
	"4" => %w{g h i},
	"5" => %w{j k l},
	"6" => %w{m n o},
	"7" => %w{p q r s},
	"8" => %w{t u v},
	"9" => %w{w x y z}
}

def telephone_words num_string
	num_array = num_string.split("")
	perm = []
	set = []

	first_digit = num_array[0]
	second_digit = num_array[1]
	third_digit = num_array[2]
	fourth_digit = num_array[3]
	fifth_digit = num_array[4]
	sixth_digit = num_array[5]
	seventh_digit = num_array[6]

	for a in 0..MAP[first_digit].length-1 do 
		for b in 0..MAP[second_digit].length-1 do
			for c in 0..MAP[third_digit].length-1 do
				for d in 0..MAP[fourth_digit].length-1 do
					for e in 0..MAP[fifth_digit].length-1 do
						for f in 0..MAP[sixth_digit].length-1 do
							for g in 0..MAP[seventh_digit].length-1 do
								set << MAP[first_digit][a] << MAP[second_digit][b] << MAP[third_digit][c] << MAP[fourth_digit][d] << MAP[fifth_digit][e] << MAP[sixth_digit][f] << MAP[seventh_digit][g]
								perm << set.join
								set = []
							end
						end
					end
				end
			end
		end
	end
	perm.sort.join(",")
end

p telephone_words("4155230")
###########################################################

# def permutation(array, k, n, result=[])
#     if k == n 
# 		result << array.join
# 	else
# 		for i in (k..n)
# 			array[i], array[k] = array[k], array[i]
# 			permutation(array, k+1, n, result)
# 			array[i], array[k] = array[k], array[i]
# 		end
# 	end
# 	result.sort.join(",")
# end

# File.open(ARGV[0]).each_line do |line|
# 	array = line.strip.split("")
# 	k = 0
# 	n = array.length - 1
# 	puts permutation(array,k,n)
# end
