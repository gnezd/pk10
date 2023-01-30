#!/usr/bin/ruby
# Expand Bessel function of the 1st kind with Froebinius series
# Notation reference: https://en.wikipedia.org/wiki/Bessel_function
# {\displaystyle J_{\alpha }(x)=\sum _{m=0}^{\infty }{\frac {(-1)^{m}}{m!\Gamma (m+\alpha +1)}}{\left({\frac {x}{2}}\right)}^{2m+\alpha },}
def j(x, a, exp_order)
  result = 0.0
  (0..exp_order).each do |m|
    result +=
    ((-1)**m).to_f / (Math.gamma(m+1) * Math.gamma(m+1+a)) * ((x.to_f / 2)**(m.to_f*2+a))
  end
  result
end

# Now output J_1(x) from 0~20
sampling_rate = 10000
fout = File.open('J_1_0-20.txt', 'w')
(0..20*sampling_rate).each do |pt|
  x = pt.to_f/sampling_rate
  fout.puts "#{x} #{j(x, 1, 50)}"
end

fout.close