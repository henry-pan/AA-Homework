fish_arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish_octopus(arr)
  new_arr = arr.dup
  sorted = false
  while !sorted
    sorted = true
    (0...new_arr.length-1).each do |i|
      if new_arr[i].length > new_arr[i+1].length
        new_arr[i], new_arr[i+1] = new_arr[i+1], new_arr[i]
        sorted = false
      end
    end
  end
  new_arr[-1]
end


def dominant_octopus(arr)
  merge_sort(arr)[-1]
end

def merge_sort(arr)
  return arr if arr.length < 2
  mid = arr.length / 2
  left = arr[0...mid]
  right = arr[mid..-1]

  merge(merge_sort(left), merge_sort(right))
end

def merge(left, right)
  sorted = []
  while !left.empty? && !right.empty?
    if left.first.length < right.first.length
      sorted << left.shift
    else
      sorted << right.shift
    end
  end
  sorted + left + right
end


def clever_octopus(arr)
  longest = ""
  arr.each { |fish| longest = fish if fish.length > longest.length }
  longest
end


def slow_dance(str, arr)
  arr.each_with_index { |ele, i| return i if ele == str}
end


def fast_dance(key, hash)
  hash[key]
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
tiles_hash = {"up"=> 0, "right-up"=> 1, "right"=> 2, "right-down"=> 3, "down"=> 4, "left-down"=> 5, "left"=> 6,  "left-up"=> 7}
p fast_dance("up", tiles_hash) # 0
p fast_dance("right-down", tiles_hash) # 3
