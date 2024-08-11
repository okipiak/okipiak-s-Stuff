#  -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- Cheese Cauldron Stuff -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

# Adds Entities to Scoreboards
execute as @e[tag=CheeseCauldron] unless score @s CheeseCauldronDestroy matches 0.. run scoreboard players set @s CheeseCauldronDestroy 0
execute as @e[tag=CheeseCauldron] unless score @s CheeseCauldronItemDisplayAdd matches 0.. run scoreboard players set @s CheeseCauldronItemDisplayAdd 0
execute as @a unless score @s MilkBucketUsed matches 0.. run scoreboard players set @s MilkBucketUsed 0

# Gives Shulkers Effects
effect give @e[type=minecraft:shulker,tag=CheeseCauldron] minecraft:resistance infinite 255 true
effect give @e[type=minecraft:shulker,tag=CheeseCauldron] minecraft:invisibility infinite 255 true

# Kills shulker and Item Display if no cauldron
execute as @e[tag=CheeseCauldron] at @s unless block ~ ~ ~ cauldron run scoreboard players set @s CheeseCauldronDestroy 1
execute as @e[tag=CheeseCauldron,scores={CheeseCauldronDestroy=1}] at @s run kill @e[type=item_display,distance=..1,limit=1]
        # Summons Cheese
        execute as @e[tag=CheeseCauldron,scores={CheeseCauldronDestroy=1}] at @s align xyz run loot spawn ~0.5 ~0.3 ~0.5 loot okipiak:gameplay/cheese_cauldron
execute as @e[tag=CheeseCauldron,scores={CheeseCauldronDestroy=1}] at @s run tp @s 0 -100 0
execute as @e[tag=CheeseCauldron,scores={CheeseCauldronDestroy=1}] at @s run kill @s

# Adds Item Display
execute as @e[tag=CheeseCauldron,scores={CheeseCauldronItemDisplayAdd=0}] at @s align xyz run summon item_display ~0.5 ~0.5 ~0.5 {item:{id:"minecraft:repeating_command_block",count:1,components:{"minecraft:custom_model_data":555605}},Tags:["CheeseDisplay"]}
execute as @e[tag=CheeseCauldron,scores={CheeseCauldronItemDisplayAdd=0}] run scoreboard players set @s CheeseCauldronItemDisplayAdd 1
execute as @e[type=item_display,tag=CheeseDisplay] at @s unless entity @e[type=minecraft:shulker,tag=CheeseCauldron,distance=..1] run kill @s

# Checks if Player is Using Milk Bucket
execute as @a[scores={MilkBucketUsed=1}] as @s run scoreboard players set @s MilkBucketUsed 0


# Shulker summon command /summon shulker ~ ~ ~ {NoGravity:1b,Silent:1b,Invulnerable:1b,NoAI:1b,Health:9999f,AttachFace:0b,Tags:["CheeseCauldron"],active_effects:[{id:"minecraft:resistance",amplifier:255,duration:999999,show_particles:0b}],attributes:[{id:"minecraft:generic.scale",base:0.8}]}