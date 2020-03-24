abstract class Sort{
  
  protected int[] array;
  protected int index;
  protected boolean isArraySort;
  
  public Sort(int[] array, int index){
    this.array = array.clone();
    this.index = index;
    this.isArraySort = isSort();
  }
  
  protected boolean isSort(){
    for(int i = 0; i < array.length-1; i++){
      if(array[i] > array[i+1]){
        return false;
      }
    }
    return true;
  }
  
  public abstract void doSort();
  
  public int[] getArray(){
    return array;
  }
  
  public boolean itSorted(){
    return isArraySort;
  }
}

class SelectionSort extends Sort{
  
  public SelectionSort(int[] array){
    super(array,0);
  }
  
  public void doSort(){
    if(!isArraySort){
      int min_idx = index; 
      for (int j = index+1; j < array.length; j++) 
          if (array[j] < array[min_idx]) min_idx = j;
      int temp = array[min_idx]; 
      array[min_idx] = array[index];
      array[index]   = temp;
      index++;
      isArraySort = isSort();
    }
  }
}

class BubbleSort extends Sort {
  
  public BubbleSort(int[] array){
    super(array,0);
  }
  
  public void doSort(){
    if(!isArraySort){
      for (int j = 0; j < array.length-index-1; j++){ 
        if (array[j] > array[j+1]){ 
            int temp   = array[j]; 
            array[j]   = array[j+1]; 
            array[j+1] = temp; 
        } 
      }
      index++;
      isArraySort = isSort();
    }
  }
}

class InsertionSort extends Sort {
  
  public InsertionSort(int[] array){
    super(array,1);
  }
  
  public void doSort(){
    if(!isArraySort){
      int keySort = array[index]; 
      int j = index - 1; 

      /* Move elements of arr[0..i-1], that are 
         greater than key, to one position ahead 
         of their current position */
      while (j >= 0 && array[j] > keySort) { 
          array[j + 1] = array[j]; 
          j = j - 1; 
      } 
      array[j + 1] = keySort;
      index++;
      isArraySort = isSort();
    }
  }
}

class GnomeSort extends Sort {
  
  public GnomeSort(int[] array){
    super(array,0);
  }
  
  public void doSort(){
    if(!isArraySort){
      if (index == 0) index++; 
      if (array[index] >= array[index - 1]) 
          index++; 
      else { 
          int temp = 0; 
          temp = array[index]; 
          array[index] = array[index - 1];
          array[index - 1] = temp; 
          index--;
      }
      isArraySort = isSort();
    }
  }
}
