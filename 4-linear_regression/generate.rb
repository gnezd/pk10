#!/usr/bin/ruby
# 產生帶隨機誤差的點群供擬合
# 共兩組：
# Data a: 直線
# Data b: 三次曲線

data_a = File.open('a.txt', 'w')
# Underlying eqation: y = ax + b
a = rand()
b = rand()
points = 100
noise_level = 0.1

data_a.puts "# y = #{a} x + #{b}"
(0..points).each do |point|
  x = point.to_f/points
  y = a * x + b + noise_level*(rand()-0.5)
  data_a.puts "#{x} #{y}"
end


data_b = File.open('b.txt', 'w')
# Underlying eqation: y = ax^3 + bx^2 + cx + d
a = rand()
b = rand()
c = rand()
d = rand()

data_b.puts "# y = #{a}x^3 + #{b}x^2 + #{c}x + #{d}"
(0..points).each do |point|
  x = point.to_f/points
  y = a * (x**3) + b * (x**2) + c*(x) + d + noise_level*(rand()-0.5)
  data_b.puts "#{x} #{y}"
end

data_a.close
data_b.close