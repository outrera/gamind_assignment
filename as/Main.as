package {
import flash.text.TextField;
import flash.display.Sprite;

public class Main extends Sprite {

public function Main() {
  stdout = new TextField();
  this.addChild(stdout);
  stdout.text = "";
  list_print(list_reverse(list(1,2,3,4,5,6)));
  sums_to(10, [0,1,2,3,4,5,6,7,8,9,10]);
}

} //class Main

}

import flash.text.TextField;
import flash.utils.*;

// quick and ugly hack to simulate console
var stdout:TextField = null;
function print(... As) : void {
  for (var i:int = 0; i < As.length; i++) {
    stdout.appendText(""+As[i]);
  }
}

class Pair {
  internal var head:*;
  internal var tail:Pair;
}

function cons(head:*,tail:Pair) : Pair {
  var p:Pair = new Pair();
  p.head = head;
  p.tail = tail;
  return p;
}

function list_print(xs:Pair) : void {
  var i:int = 0;
  while (xs != null) {
    if (i != 0) print(" ");
    print(xs.head);
    xs = xs.tail;
    i++;
  }
  print("\n");
}

function list_reverse(xs:Pair) : Pair {
  var ys:Pair = null;
  while (xs != null) {
    ys = cons(xs.head, ys);
    xs = xs.tail;
  }
  return ys;
}

function list(... As) : Pair {
  var xs:Pair = null;
  As = As.reverse();
  for (var i:int = 0; i < As.length; i++) {
    xs = cons(As[i], xs);
  }
  return xs;
}

function sums_to(what:int, xs:Array) : void {
  var hs:Dictionary = new Dictionary();
  var x:int = 0;
  var h:* = null;
  var i:int = 0;
  for (i = 0; i < xs.length; i++) {
    x = xs[i];
    hs[what-x] = x;
  }

  for (i = 0; i < xs.length; i++) {
    x = xs[i];
    h = hs[x];
    if (h != null) {
       print(x, " ", h, "\n");
    }
  }
}

