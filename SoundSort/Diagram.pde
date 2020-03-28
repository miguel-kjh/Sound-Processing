class Diagram {
  private ArrayList<Bar> charBar;
  
  public Diagram(){
    this.charBar    = new ArrayList(); 
    
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
