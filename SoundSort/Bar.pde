class Bar {
  
  private float x,y;
  private int value;
  private color colorBar;
  
  private final  int widthBar = 10;
  
  public Bar(float x, float y, int value, color colorBar){
    this.colorBar = colorBar;
    this.value    = value;
    this.x        = x;
    this.y        = y;
  }
  
  public void paintBar(){
    noFill();
    fill(colorBar);
    rect(x,y,widthBar,value);
  }
  
}
