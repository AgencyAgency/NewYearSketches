TWO_PI = Math::PI*2
NUM_MOONS = 36
MOON_DIAMETER = 20

def x_from_polar r, theta
  r * Math.cos(theta)
end

def y_from_polar r, theta
  r * Math.sin(theta)
end

def x_y_from_polar r, theta
  [
    x_from_polar(r, theta),
    y_from_polar(r, theta)
  ]
end

def display_moon x, y, gray
  push_style
  fill gray
  ellipse x, y, MOON_DIAMETER, MOON_DIAMETER
  pop_style
end

def display_earth x, y, d, gray
  push_style
  fill gray
  ellipse x, y, d, d
  pop_style
end

def translated_mouse_x_y
  [
    x = mouse_x - width/2.0,
    y = mouse_y - height/2.0
  ]
end

def offset_theta
  Math.atan2(*translated_mouse_x_y)
end

def setup
  size 300, 300
  stroke_width 0
end

def draw
  background 0
  translate width/2, height/2
  
  earth_d = width*1/4
  offset = offset_theta
  gray = 255.0 * Math.sin(offset).abs
  display_earth 0, 0, earth_d, gray

  (0..(NUM_MOONS-1)).each do |idx|
    ratio = idx/NUM_MOONS.to_f
    theta = TWO_PI * ratio + offset
    gray = 255.0 * ratio
    display_moon( *x_y_from_polar(earth_d, theta), gray )
  end
end