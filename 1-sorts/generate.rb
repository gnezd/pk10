#!/usr/bin/ruby
# 產生待排序測試資料與標準答案
testdata = File.open('testdata.txt', 'w')
solution = File.open('solution.txt', 'w')

# 不同長度，短的供測試，長的測時間
lengths = [5, 10, 50, 100, 1000, 10000, 65535]
lengths.each do |length|
  unsorted = (0..length).map {rand(65536)}
  testdata.puts unsorted.join(' ')
  sorted = unsorted.sort
  solution.puts sorted.join(' ')
end

testdata.close
solution.close