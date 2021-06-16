class Ability{
  Ability(){
  }
}

class Transform{
  public float x,y,z;
  Transform(){
    x=0;
    y=0;
    z=0;
  }
  Transform(float x,float y){
    this.x=x;
    this.y=y;
    z=0;
  }
  Transform(float x,float y,float z){
    this.x=x;
    this.y=y;
    this.z=z;
  }
}


class GameObject{
  public String id;
  public HashMap<String,Ability> abilities;
  public Transform position;
  
  GameObject(String id){
    this.id = id;
  }
  GameObject(String id, HashMap<String,Ability> ab){
    this.id=id;
    this.abilities=ab;
  }
  HashMap<String,Ability> getAttribs(){
    return abilities;
  }
  Ability getAttrib(String type){
    return abilities.get(type);
  }
    
}

class Sprite extends Ability{
  PImage sprite;
  Sprite(String url){
    sprite=loadImage(url);
  }
}





class Scene{
  HashMap<String,GameObject> objs = new HashMap<String,GameObject>();
  String name;
  int id;
  Scene(String n,int id){
    this.name=n;
    this.id = id;
  }
  Scene(String n,int id,HashMap<String,GameObject> o){
    this.name=n;
    this.id = id;
    this.objs = o;
  }
  
  void addObject(GameObject gm){
    objs.put(gm.id,gm);
  }
  
  
  
}

ArrayList<Scene> loadMeta(String name){
  XML xml = loadXML(name);
  ArrayList<Scene> l = new ArrayList<Scene>();
  for(XML x:xml.getChildren("scene")){
    Scene s = new Scene(x.getString("name"),x.getInt("id"));
    for(XML x2:x.getChildren("object")){
      s.addObject(new GameObject(x2.getString("name")));
    }
    
  }
  return l;
}

ArrayList<Scene> scenes;

  void loadEngine(String name){
   scenes = loadMeta("test.meta");
    
   
    
  }

interface Events{
 void onUpdate();
 void onStart();
 void onCollide();
  
}
