#Setting up the raycasting data.

tag @s add okipiak.Cauldron
scoreboard players set #okipiak.hit okipiak.MilkBucketUsedRC 0
scoreboard players set #okipiak.distance okipiak.MilkBucketUsedRC 0

#Activating the raycast. This function will call itself until it is done.

function okipiak:raycasting/ray

#Raycasting finished, removing tag from the raycaster.

tag @s remove okipiak.Cauldron