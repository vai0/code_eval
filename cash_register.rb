MONEY = {
	'ONE HUNDRED'=> 10000,
	'FIFTY'=> 5000,
	'TWENTY'=> 2000,
	'TEN'=> 1000,
	'FIVE'=> 500,
	'TWO'=> 200,
	'ONE'=> 100,
	'HALF DOLLAR'=> 50,
	'QUARTER'=> 25,
	'DIME'=> 10,
	'NICKEL'=> 5,
	'PENNY'=> 1
}

def cash_register string
	total, out_of = string.split(';').map(&:to_f)
	total = (total * 100).round
	out_of = (out_of * 100).round

	return "ERROR" if out_of < total
	return "ZERO"  if out_of == total

	change = out_of - total

	change_in_words = []

	MONEY.each do |word, value|
		next if value > change
		quantity = change / value
		quantity.times { change_in_words << word }
		change -= quantity * value
	end
	
	change_in_words.join(',')
end

File.open('pad.txt','r').each do |line|
	next if line == "\n"
	puts cash_register(line.strip)
end