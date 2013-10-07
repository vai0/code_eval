def point_in_circle? center, radius, point
  distance = Math.sqrt((center[0] - point[0])**2 + (center[1] - point[1])**2)

  radius > distance ? (return true) : (return false)
end
	
File.open('pad.txt','r').each do |line|
	center, radius, point = line.strip.split(';')

	center = center.scan(/-?\d+[\.\d+]*/).map(&:to_f)
  radius = radius.scan(/-?\d+[\.\d+]*/).first.to_f
  point = point.scan(/-?\d+[\.\d+]*/).map(&:to_f)

	puts point_in_circle?(center, radius, point)
end                         
