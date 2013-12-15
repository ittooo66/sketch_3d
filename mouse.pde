//global
float rot_w;
float rot_h;
float scale=1;
//private
int mouse_w_begin;
int mouse_h_begin;
float rot_w_begin;
float rot_h_begin;

void mousePressed(){
   if(mouseButton == LEFT) {
     mouse_w_begin=mouseX;
     mouse_h_begin=mouseY;
     rot_w_begin=rot_w;
     rot_h_begin=rot_h;
   } else if(mouseButton == RIGHT) {
     rot_w=0;
     rot_h=PI/2;
     scale=1;
   }
}

void mouseDragged(){ 
  if(mouseButton == LEFT){
    rot_w=rot_w_begin-(mouse_w_begin-mouseX)*0.01; 
    rot_h=rot_h_begin+(mouse_h_begin-mouseY)*0.01; 
  }
}

void mouseWheel(MouseEvent event) {
  float e = event.getAmount();
  scale=scale-10*e;
}
