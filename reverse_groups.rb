def reverse_groups list, k
  i = 1
  pocket = []
  result = []

  list.each do |e|
    pocket << e
    if i % k == 0
      result << pocket.reverse
      pocket = []
    end
    i += 1
  end

  result << pocket
  result.flatten.join(',')
end
	
File.open('pad.txt','r').each do |line|
  list, k = line.strip.split(';')

  list = list.split(',').map(&:to_i)
  k = k.to_i

  puts reverse_groups(list, k)
end                         
