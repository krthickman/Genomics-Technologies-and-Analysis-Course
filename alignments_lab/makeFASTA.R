#hack to make a fasta file from string
write(">seq 1",file="align.fasta")
write(finalalign1,file='align.fasta', append=TRUE)
write('>seq2',file='align.fasta', append=TRUE)
write(finalalign2,file='align.fasta', append=TRUE)