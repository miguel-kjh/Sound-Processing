class Note {
  private int value;
  private String note;
  
  public Note(int value, String note){
    this.value = value;
    this.note = note;
  }
  
  public void play(){
    out.playNote(0.0, 0.9, new SineInstrument( Frequency.ofPitch(note).asHz() ) );  
  }
  
  public int getValue(){
    return value;
  }
  
}

class SineInstrument implements Instrument {
  private Oscil wave;
  private Line  ampEnv;
 
  public SineInstrument(float frequency){
    wave   = new Oscil( frequency, 0, Waves.SINE);
    ampEnv = new Line();
    ampEnv.patch(wave.amplitude);
  }
  
  public void noteOn( float duration ){
    ampEnv.activate(duration, 0.5f, 0);
    wave.patch(out);
  }
  
  public void noteOff(){
    wave.unpatch(out);
  }
}

class ListOfNotes{
  ArrayList<Note> listOfNotes;
  
  public ListOfNotes(){
    listOfNotes = new ArrayList();
  }
  
  public void add(Note note){
    listOfNotes.add(note);
  }
  
  public int size(){
    return listOfNotes.size();
  }
  
  public int getValue(int index){
    return listOfNotes.get(index).getValue();
  }
  
  public Note getNote(int index){
    return listOfNotes.get(index);
  }
  
  public void changeValue(int index,Note note){
    listOfNotes.set(index,note);
    note.play();
  }
  
  public Integer[] getValues(){
    Integer[] v = new Integer[listOfNotes.size()];
    for(int i = 0; i < v.length; i++){
      v[i] = listOfNotes.get(i).getValue();
    }
    return v;
  }
  
  public void shuflle(){
    Collections.shuffle(listOfNotes);
  }
  
  public void playNote(int index){
    listOfNotes.get(index).play();
  }
  
}
