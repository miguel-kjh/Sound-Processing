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
  
  public void buildCharBar(int[] array){
    int amount = 30;
    for(int index = 0; index < array.length; index++){
      charBar.add(new Bar(x1+amount,y2-array[index],array[index]-30, color(255,0,0)));
      amount += 30;
    }
  }
  
  public void paintDiagram(){
    paintLine(x1,y1,x1+widthLines,y1);
    for(Bar bar:charBar){
      bar.paintBar();
    }
    paintLine(x2,y2,x2,y2-widthLines);
  }
  
  private void paintLine(float ax,float ay,float bx, float by){
    int sw = 5;
    noFill();
    strokeWeight(sw);
    fill(0);
    line(ax,ay,bx,by);
    
  }
  
  public void removeChar(){
    charBar.clear();
  }
  
  
}
