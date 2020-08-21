fish_arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'] #=> "fiiiissshhhhhh"
# Sluggish Octopus
# Find the longest fish in O(n^2) time. Do this by comparing all fish lengths to all other fish lengths

def sluggish_oct(fish_arr)
    sorted = false
    while !sorted
        sorted = true
        (0...fish_arr.length-1).each do |i|
            if fish_arr[i].length > fish_arr[i+1].length
                fish_arr[i], fish_arr[i+1] = fish_arr[i+1], fish_arr[i]
                sorted = false
            end
        end
    end

    fish_arr.last
end

# Dominant Octopus
# Find the longest fish in O(n log n) time. Hint: You saw a sorting algorithm that runs in O(n log n) in the Sorting Complexity Demo. Remember that Big O is classified by the dominant term.

def dominant_oct(fish_arr)
    return fish_arr if fish_arr.length < 2

    mid_idx = fish_arr.length / 2
    left = fish_arr.take(mid_idx)
    right = fish_arr.drop(mid_idx)

    left_sorted = dominant_oct(left)
    right_sorted = dominant_oct(right)

    merge_sort(left, right).last
end

def merge_sort(left, right)
    results = []
    until left.empty? || right.empty?
        if left.first.length < right.first.length
            results << left.shift
        else
            results << right.shift
        end
    end

    results + left + right
end
# Clever Octopus
# Find the longest fish in O(n) time. The octopus can hold on to the longest fish that you have found so far while stepping through the array only once.

def clever_oct(fish_arr)
    fish_arr.inject { |acc, el| acc.length > el.length ? acc : el }
end


tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
# Slow Dance
# Given a tile direction, iterate through a tiles array to return the tentacle number (tile index) the octopus must move. This should take O(n) time.

def slow_dance(direction, dance_array)
    dance_array.each_with_index { |dance, idx| return idx if dance == direction }
end

# Constant Dance!
# Now that the octopus is warmed up, let's help her dance faster. Use a different data structure and write a new function so that you can access the tentacle number in O(1) time.
tiles_hash = { "up" => 0, "right-up" => 1, "right" => 2, "right-down" => 3, "down" => 4, "left-down" => 5, "left" => 6,  "left-up" => 7 }
def fast_dance(direction, tiles_hash)
    tiles_hash[direction]
end


if __FILE__ == $PROGRAM_NAME

    p sluggish_oct(fish_arr) == "fiiiissshhhhhh"
    p dominant_oct(fish_arr) == "fiiiissshhhhhh"
    p clever_oct(fish_arr) == "fiiiissshhhhhh"

    p slow_dance("up", tiles_array) == 0
    p slow_dance("right-down", tiles_array) == 3
    p fast_dance("up", tiles_hash) == 0
    p fast_dance("right-down", tiles_hash) == 3
end