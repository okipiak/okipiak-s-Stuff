#Run a function if a block was successfully detected.

execute if block ~ ~ ~ #okipiak:raycasting/blocks run function okipiak:raycasting/hit_block
scoreboard players add #okipiak.distance okipiak.MilkBucketUsedRC 1

#Advance forward and run the ray again if no entity and/or block was found.

execute if block ~ ~ ~ #okipiak:raycasting/air if score #okipiak.hit okipiak.MilkBucketUsedRC matches 0 if score #okipiak.distance okipiak.MilkBucketUsedRC matches ..42 positioned ^ ^ ^0.1 run function okipiak:raycasting/ray