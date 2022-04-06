# Final-Project Milestone 2
 Feedback from M1:
 this is an awesome idea! i appreciate the super detailed milestone!! 

some questions/considerations: - how are you thinking of implementing the player inventory? will it be a separate UI? will there be a limit to how many items the player can hold? - from what i understand, the way you’re thinking of meeting the background requirement doesn’t actually do so! we’re looking for two backgrounds that appear on the screen at the same time, and both move. 

- what will the lava “spurting” movement be like? will it be randomized, or on a set time interval? 
also, where is the lava coming from? overall, i think your concept is really great! i would recommend making sure that it’s not too much to take on with the multiple quest regions (since they have pretty different mechanics). for m2, we want to focus on CORE gameplay mechanics. this is just a prototype and doesn’t have to be perfect or in its finished state yet, but it should satisfy the basic idea of what you want the game to be like. since you have many different regions, let’s aim to get the main environment mostly complete: 

- player should be able to navigate the environment (move left, right, etc.) 
- player should be able to enter the house 
- player should be able to navigate towards quest areas also, i would highly recommend starting on at least one quest region and getting as much done as you can! if you decide to start with the Fire Stone region: 
- player should be able to navigate this environment 
- player should automatically return to town if they get too close to certain areas 
- player should be able to collect firestone, and return to the main environment 

So, here's what I've done:
The player(pikachu atm), can move in all directions. 

Pikachu can enter the house by walking through the entrance. The room is messed up, so instead of making the exit be the door, I made it so that colliding with the vase in the top left corner will return the player to the outside.

Pikachu can go to one quest area so far. I didn't bother opening up all three quest areas. So, to enter the Lava room, you have to go down the bottom path. This is a little finicky right now, so to enter this room, I suggest that you move all the way to the bottom of the screen and then shift from left/right to find the exact exit spot.

The lava room is very simple right now. The firestone(red square) is in the top left corner, and the lavas move down only. I want to make them into a background that rotates at some point, but right now, this is a good baseline.

when the player touched the stone, they teleport to the outside area right now. Later, I will add some animation sequence of the player giving the stone to the eevee, but this is fine for right now.
After the stone is touched, it will permanently disappear from the room. To exit the room, simply travel to the top right, where the stone used to be. This will return you to the outside area.

If the player accidentally hits a lava blob, they are automatically teleported back to the main screen.

Thank you for your feedback on M1, and all your help during office hours! <3
