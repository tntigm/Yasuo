

void setup(){
  HashMap<String,Ability> abs = new HashMap<String,Ability>();
  abs.put("Sprite",new Sprite("t.png"));
  
  GameObject o = new GameObject("test",abs);
  println(o.getAttrib("Sprite"));
  loadEngine("test");
  
}
