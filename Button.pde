class Button {
  int x, y, w, h, v; //position and dimension
  char o;
  boolean hov, num; //hover


  Button(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  Button asNumber (int v) {
    num = true;
    this.v = v;
    return this;
  }

  Button asOperator(char o) {
    num = false;
    this.o = o;
    return this;
  }

  void display() {
    noStroke();
    fill(150);
    rect(x+3, y+3, w, h, 5);
    fill(219, 222, 221);
    rect(x, y, w, h, 5);
    fill(0);
    textSize(15);
    if (num) {
      text(v, x+23, y+20);
    } else {
      if (o == '*') {
        text("*", x+23, y+20);
      } else if (o == '-') {
        text("-", x+23, y+20);
      } else if (o == '+') {
        text("+", x+23, y+20);
      } else if (o == '=') {
        text("=", x+23, y+20);
      } else if (o == '.') {
        text(".", x+26, y+20);
      } else if (o == '/') {
        text("/", x+23, y+20);
      } else if (o == 'C') {
        text("C", x+23, y+20);
      }
    }
  }


  void over() {
    hov = mouseX>x && mouseX<x+w && mouseY>y && mouseY<y+h;
  }
}