class Diagram {
  private ArrayList<Bar> charBar;
  float x1,y1;
  float x2,y2;
  int widthLines;
  
  public Diagram(float x1,float y1, float x2, float y2, int widthLines){
    this.x1         = x1;
    this.x2         = x2;
    this.y1         = y1;
    this.y2         = y2;
    this.charBar    = new ArrayList(); 
    this.widthLines = widthLines;
    
  }
  
  public void buildCharBar(Integer[] array){
    int amount = 100;
    for(int index = 0; index < array.length; index++){
      charBar.add(new Bar(amount,(height)-array[index],array[index], color(255,0,0)));
      amount += 10;
    }
  }
  
  public void paintDiagram(){
    for(Bar bar:charBar){
      bar.paintBar();
    }
  }
  
  public void removeChar(){
    charBar.clear();
  }
  
  
}
