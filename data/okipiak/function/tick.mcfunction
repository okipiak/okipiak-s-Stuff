#  -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- Cheese Cauldron Stuff -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

# Adds Entities to Scoreboards
execute as @e[tag=okipiak.CheeseCauldron] unless score @s okipiak.CheeseCauldronDestroy matches 0.. run scoreboard players set @s okipiak.CheeseCauldronDestroy 0

# Gives Shulkers Effects
effect give @e[type=minecraft:shulker,tag=okipiak.CheeseCauldron] minecraft:resistance infinite 255 true
effect give @e[type=minecraft:shulker,tag=okipiak.CheeseCauldron] minecraft:invisibility infinite 255 true

# Kills shulker and Item Display if no cauldron
execute as @e[tag=okipiak.CheeseCauldron] at @s unless block ~ ~ ~ cauldron run scoreboard players set @s okipiak.CheeseCauldronDestroy 1
execute as @e[tag=okipiak.CheeseCauldron,scores={okipiak.CheeseCauldronDestroy=1}] at @s run kill @e[type=item_display,distance=..1,limit=1]
        # Summons Cheese
        execute as @e[tag=okipiak.CheeseCauldron,scores={okipiak.CheeseCauldronDestroy=1}] at @s align xyz run loot spawn ~0.5 ~0.3 ~0.5 loot okipiak:gameplay/cheese_cauldron
execute as @e[tag=okipiak.CheeseCauldron,scores={okipiak.CheeseCauldronDestroy=1}] at @s run tp @s 0 -100 0
execute as @e[tag=okipiak.CheeseCauldron,scores={okipiak.CheeseCauldronDestroy=1}] at @s run kill @s
execute as @e[type=item_display,tag=okipiak.CheeseDisplay] at @s unless entity @e[type=minecraft:shulker,tag=okipiak.CheeseCauldron,distance=..1] run kill @s
# Shulker summon command /summon shulker ~ ~ ~ {NoGravity:1b,Silent:1b,Invulnerable:1b,NoAI:1b,Health:9999f,AttachFace:0b,Tags:["okipiak.CheeseCauldron"],active_effects:[{id:"minecraft:resistance",amplifier:255,duration:999999,show_particles:0b}],attributes:[{id:"minecraft:generic.scale",base:0.8}]}


#  -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- Milk Cauldron Stuff -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

# Adds Entities to Scoreboards
execute as @e[tag=okipiak.MilkCauldron] unless score @s okipiak.MilkReady matches 0.. run scoreboard players set @s okipiak.MilkReady 0
execute as @e[tag=okipiak.MilkCauldron] unless score @s okipiak.MilkTimer matches 0.. run scoreboard players set @s okipiak.MilkTimer 0
execute as @a unless score @s okipiak.MilkBucketUsed matches 0.. run scoreboard players set @s okipiak.MilkBucketUsed 0

execute as @e[tag=okipiak.MilkCauldron,scores={okipiak.MilkTimer=0}] at @s store result score @s okipiak.MilkTimer run random roll 12000..36000
execute as @e[tag=okipiak.MilkCauldron,scores={okipiak.MilkTimer=1}] at @s run function okipiak:milk_to_cheese
scoreboard players remove @e[scores={okipiak.MilkTimer=1..}] okipiak.MilkTimer 1

# Checks if Player is Using Milk Bucket
execute as @a[scores={okipiak.MilkBucketUsed=1}] as @s run scoreboard players set @s okipiak.MilkBucketUsed 0

# Kills Item Display if no cauldron
execute as @e[tag=okipiak.MilkCauldron] at @s unless block ~ ~ ~ cauldron run scoreboard players set @s okipiak.MilkCauldronDestroy 1
execute as @e[tag=okipiak.MilkCauldron,scores={okipiak.MilkCauldronDestroy=1}] at @s run kill @e[type=item_display,distance=..1,limit=1,tag=okipiak.MilkCauldron]
