############################
###### Problem Set 3 #######
####### +Activity 5 ########
############################
#### Benjamin Schneider ####
############################

#Activity 5 from Class

#1 Students
sortinghat<-function(name){
  name="character"
  courage<-sample(1:100,1)
  ambition<-sample(1:100,1)
  intelligence<-sample(1:100,1)
  effort<-sample(1:100,1)
  attri<-c(courage, ambition, intelligence, effort)
  mystudent<- as.list(attri)
  class(mystudent) <- "student" #assign the class
  return(mystudent)
}
blah<-sortinghat("Ben")
blah<-c(blah[[1]],blah[[2]],blah[[3]],blah[[4]]) #Transfering the data into a vector

#2 Sorter

bler<-diag(1,4)#create an identity matrix for input

sort.student<-function(x, decreasing = FALSE, ...){ #this is to set up the method
  UseMethod("sort", x, y)
}

sort.student<-function(x,y){ #great so this is our requested input function!
  sorter<-x%*%y
  if(sorter[[1]]==max(sorter)){
    return("GRYFFINDOR")}
  if(sorter[[2]]==max(sorter)){
    return("SLYTHERIN")}
  if(sorter[[3]]==max(sorter)){
    return("RAVENCLAW")}
  if(sorter[[4]]==max(sorter)){
    return("HUFFLEPUFF")}
  else{return("you done messed up")}
}

sort.student(blah,bler) #Success

#3
class(blah)<-"student"
sort.student<-function(x,y){ #now going to assign a new class depending on which they were selected into
  sorter<-x%*%y
  student<-x
  class(student)<-"student"
  if(sorter[[1]]==max(sorter)){
    class(student)<-"Gryffindor"}
  if(sorter[[2]]==max(sorter)){
    class(student)<-"Slytherin"}
  if(sorter[[3]]==max(sorter)){
    class(student)<-"Ravenclaw"}
  if(sorter[[4]]==max(sorter)){
    class(student)<-"Hufflepuff"}
  return(student)
}

Ben<-sort.student(blah,bler) #awesome

#4
curfew<-function(x){#create function
  return(x)
}

curfew.student<-function(x){ #this is to set up the method
  UseMethod("sort", x)
}

#do this to create the new environments
Gryffindor_Tower<-new.env()
Black_Lake<-new.env()
Ravenclaw_Tower<-new.env()
Basement<-new.env()

curfew.student<-function(x){ #this way should be environment assignment, but I can't see it
  if(class(x)=="Gryffindor"){
    Gryffindor_Tower<-x}
  if(class(x)=="Slytherin"){
    Black_Lake<-x}
  if(class(x)=="Ravenclaw"){
    Ravenclaw_Tower<-x}
  if(class(x)=="Hufflepuff"){
    Basement<-x}
  return(x)
}

curfew.student<-function(x){ #This way it shows up as a class
  if(class(x)=="Gryffindor"){
    class(x)<-"Gryffindor_Tower"}
  if(class(x)=="Slytherin"){
    class(x)<-"Black_Lake"}
  if(class(x)=="Ravenclaw"){
    class(x)<-"Ravenclaw_Tower"}
  if(class(x)=="Hufflepuff"){
    class(x)<-"Basement"}
  return(x)
}

ben<- curfew.student(Ben)
ben #Success, new environment

###Problem Set 3 Beginning

#Problem 1

door1<-1
door2<-2
door3<-3
class(door1)<- "door"
class(door2)<- "door"
class(door3)<- "door"
#creation of our door variables with class door

#Problem 2

PlayGame<-function(x){
  door<-sample(1:3 ,1) #this draws a random value 1 through 3 that will be compared to the door.
  if(x==door){ #If the doors match, success will be posted
    return("Congratulations! You chose the correct door")}
  else{ #If the doors do not match, success will not be posted
    return("Sorry, you did not pick the correct door.")}
}
#below are some examples of this game, they can be run multiple times. Some will return a congratulations, some will say sorry.
PlayGame(door1)
PlayGame(door2)
PlayGame(door3)

#Problem 3

PlayGame.door<-function(x){ #this is to set up the method
  UseMethod("PlayGame", x)
}

PlayGame.door<-function(x){ #this dictates the method
  door<-sample(1:3 ,1) #this draws a random value 1 through 3 that will be compared to the door.
  if(x==door){ #If the doors match, success will be posted
    return("Congratulations! You chose the correct door")}
  else{ #If the doors do not match, success will not be posted
    return("Sorry, you did not pick the correct door.")}
}
#these are some examples
PlayGame.door(door1) 
PlayGame.door(door2)
PlayGame.door(door3) 
#Great! Now this is set up in the class 3 system

#Problem 4

setClass(Class="door", #this is the creation of the s4 class door with a numeric value for the door
         representation=representation(
           x= "numeric"),
         prototype=prototype(
           x=c()
         )
)

setValidity("door", function(object){
  x<-object@x
  test1<-all(x==object@x)#to make sure the variables exist correctly
  if(!test1){return("You need to fix something")}
})

door1<-new("door", x=1) #example of setting an object with class door and the door value of 1
door2<-new("door", x=2)
door3<-new("door", x=3)
doorbanana<-new("door", x="banana") #example of something that will throw the validity function

setGeneric("PlayGame",
           function(object="door"){
             standardGeneric("PlayGame")
           })

setMethod("PlayGame", "door",
          function(object){
            door<-sample(1:3 ,1)
            if(object@x==door){#except now we call on values defined by our created object
              return("Congratulations! You chose the correct door")}
            else { return("Sorry, you did not pick the correct door.")} 
          })

PlayGame(door1)
PlayGame(door2)
PlayGame(door3)
