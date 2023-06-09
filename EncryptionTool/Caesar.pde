import java.util.Arrays;
import controlP5.*;

public class Caesar implements Cipher {
  
  Character[] alphabet={'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',' '};
  int rot;
  ControlP5 cp5;
  
  public Caesar(ControlP5 cp5){
    rot=13;
    this.cp5=cp5;
  }
  
  public Caesar(int x, ControlP5 cp5){
    rot=x;
    this.cp5=cp5;
  }
  
  public String encrypt(String s, ControlP5 cp5){
    String answer="";
    int[] x=stringToNum(s);
    for(int i=0;i<x.length;i++){
      System.out.println("b4: "+x[i]);
      if(x[i]!=alphabet.length-1){
        x[i]+=rot;
        if(x[i]>=alphabet.length-1){
          x[i]+=1;
          x[i]=x[i]%alphabet.length;
        }
      }
      System.out.println("after: "+x[i]);
      answer+=alphabet[x[i]];
    }
    return answer;
  }
  
  public String decrypt(String s, ControlP5 cp5){
    String answer="";
    int[] x=stringToNum(s);
    for(int i=0;i<x.length;i++){
      System.out.println("b4: "+x[i]);
      if(x[i]!=alphabet.length-1){
        x[i]-=rot;
        if(x[i]<0){
          x[i]=alphabet.length+x[i]-1;
        }
      }
      System.out.println("after: "+x[i]);
      answer+=alphabet[x[i]];
    }
    return answer;
  }
  
  int[] stringToNum(String s) {
    int[] x=new int[s.length()];
    for (int i=0; i<x.length; i++) {
      int smt=s.charAt(i);
      if(smt<97||smt>122){
        smt=alphabet.length-1;
      }else{
        smt-=97;
      }
      x[i]=smt;
    }
    return x;
  }

  String numToString(int[] x) {
    String s="";
    for (int i=0; i<x.length; i++) {
      s+=alphabet[x[i]];
    }
    return s;
  }
  
  public String toString() {
    return "Caesar (rot"+" "+rot+")";
  }
  
}
