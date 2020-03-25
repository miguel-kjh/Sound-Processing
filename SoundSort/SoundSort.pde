
import ddf.minim.*;
import ddf.minim.ugens.*;
import java.util.Collections;

Diagram charBar;
SelectionSort selection;
Minim minim;
AudioOutput out;
int[] v     = {100,200,400,250,139,313,40,302,499,387,150,79,103};
String [] n = {"A3", "B3", "C4", "D4", "E4", "F4", "G4", "A4", "B4", "C5", "D5","E5", "F5"};
ListOfNotes notes;


void setup() {
  size(600,600);
  minim = new Minim(this);
  out = minim.getLineOut();
  charBar   = new Diagram(width*0.05,height*0.8,width*0.10,height*0.85, int(width*0.8));
  notes     = new ListOfNotes();
  for(int i = 0; i < v.length; i++){
     notes.add(new Note(v[i],n[i])); 
  }
  selection = new SelectionSort(notes);
}

void draw() {
  background(255,255,255);
  charBar.buildCharBar(selection.getArray());
  if(selection.itSorted()){
    text("Sorted!!!", width/2, 50);
  }
  charBar.paintDiagram();
  delay(500);
  selection.doSort();
  charBar.removeChar();
}

void keyPressed(){
  if(key=='s' || key == 'S'){
    selection.shuflle();
  }
}
