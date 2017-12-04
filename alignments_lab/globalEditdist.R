#editDistance function minimizes score
#c(1,-2,-5)-> scores
#seq1<-"GTCAGTCGTACGGGTTTCCAGAGCAGCT"
#seq2<-'GGTCATCTTACGGTTTCCCAGTGCAGGT'
label1<-'sequence1'
label2<-'sequence2'
match <- scores[1]
mismatch <- scores[2]
gap <- scores[3]
print(paste("the first sequence is",seq1))
print(paste('the second sequence is',seq2))
print(paste("match score is",match,"the mismatch score is",mismatch, "and the gap score is", gap))
n1<-nchar(seq1)+1
n2<-nchar(seq2)+1
a<-matrix(0,n1,n2)
d<-matrix('',n1,n2)
#print(d)
for(i in 1:n1-1){
  a[i+1,1]<-i*gap
}
#print(a)
for(j in 1:n2-1){
  a[1,j+1]<-j*gap
}
#print(a)
for(i in 2:n1){
  for(j in 2:n2){
    m<-mismatch
    if(substr(seq1,i-1,i-1)==substr(seq2,j-1,j-1)){
      m<-match}
 #   print(substr(seq1,i-1,i-1))
#   print(substr(seq2,j-1,j-1))
 #   print(m)
   a[i,j]<-max(a[i,j-1]+gap,a[i-1,j]+gap,a[i-1,j-1]+m)
    init<-a[i,j-1]+gap
    d[i,j]='L'
#    print(a)
 #   print (d)
    if (a[i-1,j]+gap>init){
      init<-a[i-1,j]+gap
      d[i,j]='U'}
#      print (d)
    if (a[i-1,j-1]+m>init){
      init<-a[i-1,j-1]+m
      d[i,j]<-'D'
#     print (d)
    }

  }
}


out<-a[n1,n2]
return(out)
#print(a)
#print(d)
print(paste("the alignment score is", out))
#print(out)


