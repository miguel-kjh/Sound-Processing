
Diagram charBar;
int[] v = {100,200,400,250,139,313,40};

void setup() {
  size(600,600);
  charBar = new Diagram(width*0.05,height*0.8,width*0.10,height*0.85, int(width*0.8));
}

void draw() {
  background(255,255,255);
  charBar.buildCharBar(v);
  charBar.paintDiagram();
}
