#First import and merge the test and train data into a single file "alldata"
trainx<-read.table("./train/X_train.txt")  #read X_train into dataframe
trainy<-read.table("./train/Y_train.txt")  #read Y_train into dataframe
colnames(trainy)<-"Activity"  
testx<-read.table("./test/X_test.txt")
testy<-read.table("./test/Y_test.txt")
colnames(testy)<-"Activity"
subtest<-read.table("./test/subject_test.txt")
colnames(subtest)<-"Subject"
subtrain<-read.table("./train/subject_train.txt")
colnames(subtrain)<-"Subject"
act_names<-read.table("./activity_labels.txt")
feats<-read.table("./features.txt")
df<-cbind(rbind(subtrain,subtest),rbind(trainy,testy),rbind(trainx,testx)) #merge data into single data set
df<-mutate(df,Activity=act_names[df$Activity,"V2"]) #Convert the activity numbers into descriptive names using the activity labels
colnames(df)<-c("Subject","Activity",as.character(feats$V2)) #Use features vector to give descriptive column names
smalldf<-df %>%
  select(Subject,Activity,ends_with('mean()')|ends_with('std()')) #select only columns 
tidydf<-smalldf %>%
  group_by(Subject,Activity) %>%
  summarize_each(mean)

write.table(tidydf,file="./tidydata.txt",row.name=FALSE)
print(head(tidydf))

