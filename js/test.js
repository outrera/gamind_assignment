// Node JS
//////////////////////////////////////

function args_to_array(o) {
  return Array.prototype.slice.call(o);
}

function print() {
  var as = args_to_array(arguments)
  for(var i=0; i<as.length; i++) {
    process.stdout.write(String(as[i]));
  }
}

function pair(head, tail) {
  this.head = head;
  this.tail = tail;
}

function cons(head,tail) {
  return new pair(head,tail);
}

function reverse_list(xs) {
  ys = null;
  while (xs != null) {
    ys = cons(xs.head, ys);
    xs = xs.tail;
  }
  return ys;
}

function print_list(xs) {
  while (xs != null) {
    print(xs.head, " ");
    xs = xs.tail;
  }
  print("\n");
}

function list() {
  var as = args_to_array(arguments).reverse();
  xs = null
  for(var i=0; i<as.length; i++) {
    xs = cons(as[i], xs);
  }
  return xs;
}

print_list(reverse_list(list(1,2,3,4,5)));



function sums_to(what, xs) {
  hs = {};
  for(var x in xs) {
    hs[what-x] = x;
  }
  for(var x in xs) {
    h = hs[x];
    if (h != null) {
       print(x, " ", h, "\n");
    }
  }
}

sums_to(10, [0,1,2,3,4,5,6,7,8,9,10]);
