# Check if Player is Using Milk
execute as @s run scoreboard players add @s okipiak.MilkBucketUsed 1
advancement revoke @s only okipiak:milk_used
execute as @s at @s anchored eyes positioned ^ ^ ^ anchored feet run function okipiak:raycasting/start_ray