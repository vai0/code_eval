def trailing_string string
	sent, word = string.split(",")
	length = word.length
	sent[-length..-1] == word ? bool = 1 : bool = 0
	bool
end

File.open('pad.txt', 'r').each do |line|
	next if line == "\n"
	puts trailing_string(line.strip)
end