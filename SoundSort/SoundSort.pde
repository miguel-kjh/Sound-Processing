
Diagram charBar;
GnomeSort selection;
int[] v = {100,200,400,250,139,313,40,302,499,387,150};

void setup() {
  size(600,600);
  charBar   = new Diagram(width*0.05,height*0.8,width*0.10,height*0.85, int(width*0.8));
  selection = new GnomeSort(v);
}

void draw() {
  background(255,255,255);
  charBar.buildCharBar(selection.getArray());
  if(selection.itSorted()){
    text("Sorted!!!", width/2, 50);
  }
  charBar.paintDiagram();
  selection.doSort();
  delay(500);
  charBar.removeChar();
}
