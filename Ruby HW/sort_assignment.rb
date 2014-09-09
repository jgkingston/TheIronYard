

a = [3,4,6,1,3,6,7,8,9,2,4,5,6,7,10,146,3,4,7,8,74]

def sort_list list

  sorted = false
  while sorted == false
    sorted = true
    for i in 0...list.length - 1
      if list[i] > list[i+1]
        hold = list[i]
        list[i] = list[i+1]
        list[i+1] = hold
        sorted = false
      end
    end
  end

end

p a
sort_list a
p a