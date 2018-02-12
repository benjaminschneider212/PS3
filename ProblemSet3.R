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

door1<-new("door", x=1) #example of setting an object with class door and the door value of 1
door2<-new("door", x=2)
door3<-new("door", x=3)

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
