abstract class Sort{
  
  protected ListOfNotes notes;
  protected int index;
  protected boolean isArraySort;
  
  public Sort(ListOfNotes notes, int index){
    this.notes = notes;
    this.index = index;
    this.isArraySort = isSort();
  }
  
  protected boolean isSort(){
    for(int i = 0; i < notes.size()-1; i++){
      if(notes.getValue(i) > notes.getValue(i+1)){
        return false;
      }
    }
    return true;
  }
  
  public abstract void doSort();
  
  public int[] getArray(){
    return notes.getValues();
  }
  
  public boolean itSorted(){
    return isArraySort;
  }
  
  public void shuflle(){
    notes.shuflle();
    this.isArraySort = isSort();
  }
}

class SelectionSort extends Sort{
  
  public SelectionSort(ListOfNotes notes){
    super(notes,0);
  }
  
  public void doSort(){
    if(!isArraySort){
      int min_idx = index; 
      for (int j = index+1; j < notes.size(); j++) 
          if (notes.getValue(j) < notes.getValue(min_idx)) min_idx = j;
      Note temp = notes.getNote(min_idx); 
      notes.changeValue(min_idx,notes.getNote(index));
      notes.changeValue(index,temp);
      index++;
      isArraySort = isSort();
    } else {
      int randomIndex = int(random(0,notes.size()));
      notes.getNote(randomIndex).play();
    }
  }
}

class BubbleSort extends Sort {
  
  public BubbleSort(ListOfNotes notes){
    super(notes,0);
  }
  
  public void doSort(){
    if(!isArraySort){
      for (int j = 0; j < notes.size()-index-1; j++){ 
        if (notes.getValue(j) > notes.getValue(j+1)){ 
            Note temp = notes.getNote(j); 
            notes.changeValue(j,notes.getNote(j+1));
            notes.changeValue(j+1,temp);
        } 
      }
      index++;
      isArraySort = isSort();
    } else {
      int randomIndex = int(random(0,notes.size()));
      notes.getNote(randomIndex).play();
    }
  }
}

class InsertionSort extends Sort {
  
  public InsertionSort(ListOfNotes notes){
    super(notes,1);
  }
  
  public void doSort(){
    if(!isArraySort){
      Note keySort = notes.getNote(index); 
      int j = index - 1;

      while (j >= 0 && notes.getValue(j) > keySort.getValue()) { 
          notes.changeValue(j+1,notes.getNote(j));
          j = j - 1;
      } 
      notes.changeValue(j+1,keySort);
      index++;
      isArraySort = isSort();
    } else {
      int randomIndex = int(random(0,notes.size()));
      notes.getNote(randomIndex).play();
    }
  }
}

class GnomeSort extends Sort {
  
  public GnomeSort(ListOfNotes notes){
    super(notes,0);
  }
  
  public void doSort(){
    if(!isArraySort){
      if (index == 0) index++; 
      if (notes.getValue(index) >= notes.getValue(index - 1)) 
          index++; 
      else { 
          Note temp = notes.getNote(index); 
          notes.changeValue(index,notes.getNote(index - 1));
          notes.changeValue(index - 1,temp);
          index--;
      }
      isArraySort = isSort();
    } else {
      int randomIndex = int(random(0,notes.size()));
      notes.getNote(randomIndex).play();
    }
  }
}
