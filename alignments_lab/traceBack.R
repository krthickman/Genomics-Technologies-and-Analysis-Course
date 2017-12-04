mat<-d
#label1<-'sequence1'
#label2<- 'sequence2'
#print(mat)
i<-n1
j<-n2
align1<-c('-')
align2<-c('-')
#print(align)
m<-n1+n2
#print(m)
p1<-1
p2<-1
align1[m]<-'-'
align2[m]<-'-'
#print(align1)
while (i>0 & j>0){
# print('i=')
#  print(i)
#  print('j=')
#  print(j)
  if (mat[i,j]=='D'){
#    print("diagonal")  
    align1[m]<-substr(seq1,n1-p1,n1-p1)
      align2[m]<-substr(seq2,n2-p2,n2-p2)
      m<-m-1
      p1<-p1+1
      p2<-p2+1
      i<-i-1
      j<-j-1
#      print(align1)
#     print(align2)
  }else if(mat[i,j]=='L'){
#   print("left")
     align1[m]<-'-'
    align2[m]<-substr(seq2,n2-p2,n2-p2)
    m<-m-1
    p2<-p2+1
    j<-j-1
#    print(align1)
#   print(align2)
  }else if(mat[i,j]=='U'){
#    print("up")
    align1[m]<-substr(seq1,n1-p1,n1-p1)
    align2[m]<-'-'
    m<-m-1
    p1<-p1+1
    i<-i-1
#   print(align1)
#    print(align2)
  }else{
    i<-i-1
    j<-j-1}
}
g<-m
while (p1<n1){
  align1[m]<-substr(seq1,n1-p1,n1-p1)
  align2[m]<-'-'
  p1<-p1+1
  m<-m-1
}
while (p2<n2){
  align2[g]<-substr(seq2,n2-p2,n2-p2)
  align1[g]<-'-'
  p2<-p2+1
  g<-g-1
}
#print("final")
#print(align1)
#print(align2)
align1<-align1[-1]
align2<-align2[-1]
i<-1
j<-1
while (i< length(align1)){
  if(is.na(align1[i])){
    align1<-align1[-i]
  }else{
    i<-i+1
  }
}
while (j< length(align2)){
  if(is.na(align2[j])){
    align2<-align2[-j]
  }else{
    j<-j+1
  }
}
#print(align1)
#print(align2)
finalalign1<-paste(align1,sep="",collapse='')
finalalign2<-paste(align2,sep='',collapse='')
print('the final aligned sequences are')
print(paste(label1,finalalign1))
print(paste(label2,finalalign2))
return(finalalign1)
return(finalalign2)
