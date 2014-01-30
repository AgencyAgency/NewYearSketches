def setup
  num_cols = 10
  side_w = 300
  
  size side_w, side_w
  grid_w = width / num_cols.to_f

  stroke 255
  (1...num_cols).each do |idx|
    delta = idx*grid_w
    line delta, 0, delta, height
    line 0, delta, width, delta
  end
end

def draw
  
end