
import ddf.minim.*;
import ddf.minim.ugens.*;
import java.util.Collections;
import java.util.List;
import java.util.Arrays;

Diagram charBar;
Sort selection;
Sort bubbleSort;
Sort insertionSort;
Sort gnomeSort;
Minim minim;
AudioOutput out;
ListOfNotes notes;
int daleyTime;
SortAlgoritm choose;

Integer[] v     = {
               10,20,30,40,50,60,80,90,100,
               110,120,130,140,150,160,170,180,190,200,
               210,220,230,240,250,260,270,280,290,300,
               310,320,330,340,350,360,370
               };
String [] n = {
               "B", "B", "B", "A", "B", "D5b", "B5",  "F5#", "A2",
               "B", "B", "B", "A", "B", "F5b", "E5b", "D5b", "A2",
               "B", "B", "B", "A", "B", "D5b", "B5",  "F5#", "A2",
               "B", "B", "B", "A", "B", "F5b", "E5b", "D5b", "A2"
               };

enum SortAlgoritm{
  SELECTION,BUBBLE,INSERTION,GNOME,NONE
}


void setup() {
  size(600,600);
  minim = new Minim(this);
  out = minim.getLineOut();
  charBar   = new Diagram(width*0.05,height*0.8,width*0.10,height*0.85, int(width*0.8));
  notes     = new ListOfNotes();
  List<Integer> l = Arrays.asList(v);
  Collections.shuffle(l);
  v = (Integer[])l.toArray();
  for(int i = 0; i < v.length; i++){
     notes.add(new Note(v[i],n[i])); 
  }
  selection     = new SelectionSort(notes);
  bubbleSort    = new BubbleSort(notes);
  insertionSort = new InsertionSort(notes);
  gnomeSort     = new GnomeSort(notes);
  choose        = SortAlgoritm.NONE;
  daleyTime     = 0;
}

void draw() {
  background(255,255,255);
  switch(choose) {
    case SELECTION:
      drawCharBar(selection);
      break;
    case BUBBLE:
      drawCharBar(bubbleSort);
      break;
    case INSERTION:
      drawCharBar(insertionSort);
      break;
    case GNOME:
      drawCharBar(gnomeSort);
      break;
    default:
      drawCharBar();
      break;
  }
  
}

void drawCharBar(){
  charBar.buildCharBar(v);
  charBar.paintDiagram();
}

void drawCharBar(Sort sortAlgoritm){
  charBar.buildCharBar(sortAlgoritm.getArray());
  if(sortAlgoritm.itSorted()){
    noFill();
    fill(0);
    text("Sorted!!!", width/2, height/2);
  }
  charBar.paintDiagram();
  delay(daleyTime);
  sortAlgoritm.doSort();
  charBar.removeChar();
}

void keyPressed(){
  if(key=='s' || key == 'S'){
    switch(choose) {
      case SELECTION:
        selection.shuflle();
        break;
      case BUBBLE:
        bubbleSort.shuflle();
        break;
      case INSERTION:
        insertionSort.shuflle();
        break;
      case GNOME:
        gnomeSort.shuflle();
        break;
      default:
        break;
    }
  }
  
  if(key=='q' || key=='Q'){
    choose    = SortAlgoritm.SELECTION;
    daleyTime = 500;
  }
  
  if(key=='w' || key=='W'){
    choose    = SortAlgoritm.BUBBLE;
    daleyTime = 900;
  }
  
  if(key=='e' || key=='E'){
    choose    = SortAlgoritm.INSERTION;
    daleyTime = 600;
  }
  
  if(key=='r' || key=='R'){
    choose    = SortAlgoritm.GNOME;
    daleyTime = 150;
  }
  
}
