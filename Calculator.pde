Button[] numButtons = new Button[10];
Button[] opButtons = new Button[7];
String ls, rs;
float ans; //answer
char op; //operator
boolean left, eq; //left of operator

void setup () {
  size(300, 420);
  ls = "0";
  rs = "0";
  ans = 0.0;
  op = ' ';
  left = true;
  eq = false;
  numButtons[0] = new Button(24, 190, 55, 31).asNumber(1);
  numButtons[1] = new Button(89, 190, 55, 31).asNumber(2);
  numButtons[2] = new Button(154, 190, 55, 31).asNumber(3);
  numButtons[3] = new Button(24, 235, 55, 31).asNumber(4);
  numButtons[4] = new Button(89, 235, 55, 31).asNumber(5);
  numButtons[5] = new Button(154, 235, 55, 31).asNumber(6);
  numButtons[6] = new Button(24, 280, 55, 31).asNumber(7);
  numButtons[7] = new Button(89, 280, 55, 31).asNumber(8);
  numButtons[8] = new Button(154, 280, 55, 31).asNumber(9);
  numButtons[9] = new Button(24, 325, 120, 31).asNumber(0);

  opButtons[0] = new Button(219, 190, 55, 31).asOperator('-');
  opButtons[1] = new Button(219, 235, 55, 31).asOperator('+');
  opButtons[2] = new Button(219, 145, 55, 31).asOperator('*');
  opButtons[3] = new Button(219, 280, 55, 77).asOperator('=');
  opButtons[4] = new Button(154, 145, 55, 31).asOperator('/');
  opButtons[5] = new Button(154, 325, 55, 31).asOperator('.');
  opButtons[6] = new Button(24, 145, 120, 31).asOperator('C');
  
}


void draw() {
  background(195, 195, 195);
  for (int i=0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].over();
  }
  for (int i=0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].over();
  }
  updateDisplay();
}

void mouseReleased() {
  for (int i=0; i<numButtons.length; i++) {
    if (numButtons[i].hov && left) {
      ls += numButtons[i].v;
    } else if (numButtons[i].hov && !left) {
      rs += numButtons[i].v;
    }
  }

  for (int i=0; i<opButtons.length; i++) {
    if (opButtons[i].hov && opButtons[i].o == '+') {
      left = false;
      op = opButtons[i].o;
      rs = "";
    } else if  (opButtons[i].hov && opButtons[i].o == '-') {
      left = false;
      op = opButtons[i].o;
      rs = "";
    } else if  (opButtons[i].hov && opButtons[i].o == '/') {
      left = false;
      op = opButtons[i].o;
      rs = "";
    } else if (opButtons[i].hov && opButtons[i].o == '*') {
      left = false;
      op = opButtons[i].o;
      rs = "";
    } else if (opButtons[i].hov && opButtons[i].o == 'C') {
      performClear();
    } else if (opButtons[i].hov && opButtons[i].o == '=') {
      eq = true;
      performCalc();
    } else if (opButtons[i].hov && opButtons[i].o == 'n') {
      if (left) {
        ans = float(ls)*-1;
        ls = str((float)ans);
      } else {
        ans = float(rs)*-1;
        rs = str((float)ans);
      }
    } else if (opButtons[i].hov && opButtons[i].o == '.') {
      if (left) {
        ls += opButtons[i].o;
      } else {
        rs += opButtons[i].o;
      }
    }
  }
}

void performClear() {
  ls = "0";
  rs = "0";
  ans = 0.0;
  op = ' ';
  left = true;
  eq = false;
}

void performCalc() {
  switch(op) {
  case '+':
    ans = float(ls)+float(rs);
    ls = str((float)ans);
    left = true;
    break;
  case '-':
    ans = float(ls)-float(rs);
    ls = str((float)ans);
    left = true;
  case '/':
    ans = float(ls)/float(rs);
    ls = str((float)ans);
    left = true;
  case '*':
    ans = float(ls)*float(rs);
    ls = str((float)ans);
    left = true;
  }
}

void updateDisplay() {
  fill(206, 214, 160);
  noStroke();
  rect(20, 20, 260, 70, 7);
  fill(0);
  stroke(0);
  textSize(8);
  text("Eq: " + eq, 25, 30);
  text("Left: " + left, 25, 40);
  text("Op: " + op, 25, 50);
  text("ls: " + ls, 80, 30);
  text("rs: " + rs, 80, 40);
  text("Ans: " + (float)ans, 80, 50);
  textSize(33);
  fill(0);
    if (eq) {
      text((float)ans, 35, 80);
    } else {
      if (left) {
        text(ls, 25, 80);
      } else {
        text(rs, 25, 80);
      }
    }
  eq = false;
}