############################
###### Problem Set 3 #######
############################
#### Benjamin Schneider ####
############################

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
    print("Congratulations! You chose the correct door")}
  if(!x==door){ #If the doors do not match, success will not be posted
    ("Sorry, you did not pick the correct door.")}
}
#below are some examples of this game, they can be run multiple times. Some will return a congratulations, some will say sorry.
PlayGame(door1)
PlayGame(door2)
PlayGame(door3)

#Problem 3



#Problem 4

