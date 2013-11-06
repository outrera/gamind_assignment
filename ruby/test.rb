class Pair
  attr_accessor :head, :tail
  def initialize(head, tail)
    @head = head
    @tail = tail
  end
end

def cons(head, tail)
  Pair.new(head, tail)
end

def reverse_list(xs)
  ys = nil
  until xs.nil?
    ys = cons(xs.head,ys)
    xs = xs.tail
  end
  ys
end

def print_list(xs)
  until xs.nil?
    print("#{xs.head} ")
    xs = xs.tail
  end
  print "\n"
end

def list *args
  xs = nil
  args.reverse.each do |a|
    xs = cons(a,xs)
  end
  xs
end

print_list(reverse_list(list(1,2,3)))


def sums_to(what, xs)
  hs = Hash.new
  xs.each do |x|
    hs[what-x] = x
  end
  xs.each do |x|
    h = hs[x]
    unless h.nil?
      print("#{x} #{h}\n");
    end
  end
end

sums_to(10, [0,1,2,3,4,5,6,7,8,9,10])
