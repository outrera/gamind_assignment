## Python 2.6
#################################################

from __future__ import print_function

class cons(object):
  def __init__(self,head,tail):
    self.head = head
    self.tail = tail

def reverse_list(xs):
  ys = None
  while not xs is None:
    ys = cons(xs.head,ys)
    xs = xs.tail
  return ys

def print_list(xs):
  while not xs is None:
    print("%s " % xs.head, end="")
    xs = xs.tail
  print("")

def list(*args):
  xs = None
  for a in reversed(args):
    xs = cons(a,xs)
  return xs

print_list(reverse_list(list(1,2,3,4,5)))

def sums_to(what, xs):
  hs = {}
  for x in xs:
    hs[what-x] = x
  for x in xs:
    h = hs[x]
    if not xs is None:
      print("%s %s" % (x, h))

sums_to(10, [0,1,2,3,4,5,6,7,8,9,10])