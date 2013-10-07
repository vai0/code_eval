def is_square? a, b, c, d
  #distances between all points
  ab = Math.sqrt((a[0] - b[0])**2 + (a[1] - b[1])**2).round(2)
  ac = Math.sqrt((a[0] - c[0])**2 + (a[1] - c[1])**2).round(2)
  ad = Math.sqrt((a[0] - d[0])**2 + (a[1] - d[1])**2).round(2)

  cd = Math.sqrt((c[0] - d[0])**2 + (c[1] - d[1])**2).round(2)
  bc = Math.sqrt((b[0] - c[0])**2 + (b[1] - c[1])**2).round(2)
  bd = Math.sqrt((b[0] - d[0])**2 + (b[1] - d[1])**2).round(2)

  ba = ab, ca = ac, da = ad, dc = cd, cb = bc, db = bd

  if ab == ac
    return false if bc != Math.sqrt(ab**2 + ac**2).round(2) #check if right triangle
    return false if bd != cd #check if other sides equal each other
    return false if bc != ad #check diagonals
    return false if ab != bd #check if all sides are equal
  elsif ab == ad
    return false if bd != Math.sqrt(ab**2 + ad**2).round(2) #check if right triangle
    return false if bc != dc #check if other sides equal each other
    return false if ac != bd #check diagonals
    return false if ab != bc #check if all sides are equal
  elsif ac == ad
    return false if cd != Math.sqrt(ac**2 + ad**2).round(2) #check if right triangle
    return false if cb != db #check if other sides equal each other
    return false if ab != cd #check diagonals
    return false if ac != cb #check if all sides are equal
  else 
    return false
  end

  return true
end
    
File.open('pad.txt', 'r').each_line do |line|
  a, b, c, d = line.strip.split(" ")

  a = a.scan(/\d+/).map(&:to_i)
  b = b.scan(/\d+/).map(&:to_i)
  c = c.scan(/\d+/).map(&:to_i)
  d = d.scan(/\d+/).map(&:to_i)

  puts is_square?(a, b, c, d)
end