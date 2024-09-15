#Mark the ray as having found a block.

scoreboard players set #okipiak.hit okipiak.MilkBucketUsedRC 1

#Running custom commands since the block was found.

# Milk Cauldron to Cauldron



# Cauldron to Milk Cauldron

#execute align xyz positioned ~0.5 ~ ~0.5 unless entity @e[distance=..0.9,tag=okipiak.Cauldron] run item replace entity @s weapon.mainhand with minecraft:bucket
execute align xyz positioned ~0.5 ~ ~0.5 unless entity @e[distance=..0.9,tag=okipiak.Cauldron] run playsound minecraft:item.bucket.empty block @a ~ ~ ~ 1.0 1.0
execute align xyz positioned ~0.5 ~ ~0.5 unless entity @e[distance=..0.9,tag=okipiak.Cauldron] run summon item_display ~ ~0.5 ~ {item:{id:"minecraft:repeating_command_block",count:1,components:{"minecraft:custom_model_data":555608}},Tags:["okipiak.MilkCauldron","okipiak.Cauldron"]}