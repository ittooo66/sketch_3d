//grobal
int width=800;
int height=600;
int frameNo=0;//drawing frame
int maxmark=16;//max mark
int maxframe;
int data_X[][];
int data_Y[][];
int data_Z[][];
int markRGB[][];//R:0,G:1,B:2

//private
String filename="UeYano1.csv";

void setup() {

  //setup
  size(width, height, P3D);
  rot_w=0;
  rot_h=PI/2;

  //file I/O
  String file[] = loadStrings(filename);
  maxframe=file.length;
  data_X=new int[file.length][maxmark];//[frame][marknum]
  data_Y=new int[file.length][maxmark];//[frame][marknum]
  data_Z=new int[file.length][maxmark];//[frame][marknum]
  markRGB=new int[file.length][maxmark];//[frame][marknum]0:R,1:G,2:B
  for (int i=0;i<file.length;i++) {
    String tmp[] =split(file[i], ",");
    int maxmark=int(tmp[2])+int(tmp[3])+int(tmp[4]);
    for (int j=0;j<maxmark;j++) {
      data_X[i][j]=-int(tmp[5+j*3]);
      data_Y[i][j]=int(tmp[6+j*3]);
      data_Z[i][j]=int(tmp[7+j*3]);
      if (j<int(tmp[2]))markRGB[i][j]=0;
      else if (j<(int(tmp[3])+int(tmp[2])))markRGB[i][j]=1;
      else markRGB[i][j]=2;
    }
  }
}

