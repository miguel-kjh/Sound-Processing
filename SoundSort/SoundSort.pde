
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
boolean isSorted;

Integer[] v     = {
               10,20,30,40,50,60,70,80,90,100,
               110,120,130,140,150,160,170,180,190,200,
               210,220,230,240,250,260,270,280,290,300,
               310,320,330,340,350,360
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
  charBar   = new Diagram();
  notes     = new ListOfNotes();
  for(int i = 0; i < v.length; i++){
     notes.add(new Note(v[i],n[i])); 
  }
  notes.shuflle();
  v             = notes.getValues();
  selection     = new SelectionSort(notes);
  bubbleSort    = new BubbleSort(notes);
  insertionSort = new InsertionSort(notes);
  gnomeSort     = new GnomeSort(notes);
  choose        = SortAlgoritm.NONE;
  daleyTime     = 0;
  isSorted      = false;
  textAlign(CENTER,CENTER);
}

void draw() {
  background(221, 214, 216);
  paintInstrutions();
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
  isSorted = sortAlgoritm.itSorted();
  charBar.paintDiagram();
  if(isSorted){
    paintBox();
  } else {
     delay(daleyTime);
     sortAlgoritm.doSort();
  }
  charBar.removeChar();
}

void paintBox(){
  noFill();
  fill(0);
  text("Sorted!!!", width*0.5,height*0.25);
  text("S -> shuflle",  width * 0.5, height*0.35);
  line(width*0.4,height*0.4, width*0.6,height*0.4);
  line(width*0.4,height*0.4, width*0.4,height*0.2);
  line(width*0.6,height*0.4, width*0.6,height*0.2);
  line(width*0.4,height*0.2, width*0.6,height*0.2);
}

void paintInstrutions(){
  noFill();
  fill(0);
  switch(choose) {
    case SELECTION:
      fill(255,0,0);
      text("Q->Selection Sort", width*0.25, 20);
      fill(0);
      text("W->Bubble Sort", width*0.45, 20);
      text("E->Insertion Sort", width*0.65, 20);
      text("R->Gnome Sort", width*0.85, 20);
      break;
    case BUBBLE:
      text("Q->Selection Sort", width*0.25, 20);
      fill(255,0,0);
      text("W->Bubble Sort", width*0.45, 20);
      fill(0);
      text("E->Insertion Sort", width*0.65, 20);
      text("R->Gnome Sort", width*0.85, 20);
      break;
    case INSERTION:
      text("Q->Selection Sort", width*0.25, 20);
      text("W->Bubble Sort", width*0.45, 20);
      fill(255,0,0);
      text("E->Insertion Sort", width*0.65, 20);
      fill(0);
      text("R->Gnome Sort", width*0.85, 20);
      break;
    case GNOME:
      text("Q->Selection Sort", width*0.25, 20);
      text("W->Bubble Sort", width*0.45, 20);
      text("E->Insertion Sort", width*0.65, 20);
      fill(255,0,0);
      text("R->Gnome Sort", width*0.85, 20);
      break;
    default:
      fill(0);
      text("Q->Selection Sort",width*0.25, 20);
      text("W->Bubble Sort", width*0.45, 20);
      text("E->Insertion Sort", width*0.65, 20);
      text("R->Gnome Sort", width*0.85, 20);
      break;
  }
}

void keyPressed(){
  if(isSorted && (key=='s' || key == 'S')){
    notes.shuflle();
    selection     = new SelectionSort(notes);
    bubbleSort    = new BubbleSort(notes);
    insertionSort = new InsertionSort(notes);
    gnomeSort     = new GnomeSort(notes);
  }
  
  if(key=='q' || key=='Q'){
    choose    = SortAlgoritm.SELECTION;
    selection.resetIndex();
    daleyTime = 500;
  }
  
  if(key=='w' || key=='W'){
    choose    = SortAlgoritm.BUBBLE;
    bubbleSort.resetIndex();
    daleyTime = 900;
  }
  
  if(key=='e' || key=='E'){
    choose    = SortAlgoritm.INSERTION;
    insertionSort.resetIndex();
    daleyTime = 600;
  }
  
  if(key=='r' || key=='R'){
    choose    = SortAlgoritm.GNOME;
    gnomeSort.resetIndex();
    daleyTime = 150;
  }
  
  
}
