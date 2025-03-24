extends PanelContainer

@onready var tool_axe: Button = $MarginContainer/HBoxContainer/ToolAxe
@onready var tool_hoe: Button = $MarginContainer/HBoxContainer/ToolHoe
@onready var tool_watercan: Button = $MarginContainer/HBoxContainer/ToolWatercan
@onready var tool_wheat: Button = $MarginContainer/HBoxContainer/ToolWheat
@onready var tool_tomato: Button = $MarginContainer/HBoxContainer/ToolTomato

func _ready() -> void:
	ToolManager.enable_tool.connect(on_enable_tool_button)
		
	tool_hoe.disabled = true
	tool_hoe.focus_mode = Control.FOCUS_NONE
	
	tool_watercan.disabled = true
	tool_watercan.focus_mode = Control.FOCUS_NONE
	
	tool_wheat.disabled = true
	tool_wheat.focus_mode = Control.FOCUS_NONE
	
	tool_tomato.disabled = true
	tool_tomato.focus_mode = Control.FOCUS_NONE

func _on_tool_axe_pressed() -> void:
	ToolManager.select_tool(DataTypes.Tools.AxeWood)

func _on_tool_hoe_pressed() -> void:
	ToolManager.select_tool(DataTypes.Tools.TillGround) 

func _on_tool_watercan_pressed() -> void:
	ToolManager.select_tool(DataTypes.Tools.WaterCrops) 

func _on_tool_corn_pressed() -> void:
	ToolManager.select_tool(DataTypes.Tools.PlantWheat) 

func _on_tool_tomato_pressed() -> void:
	ToolManager.select_tool(DataTypes.Tools.PlantTomato) 
	
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("release_tool"):
		ToolManager.select_tool(DataTypes.Tools.None)
		tool_axe.release_focus()
		tool_hoe.release_focus()
		tool_watercan.release_focus()
		tool_wheat.release_focus()
		tool_tomato.release_focus()
		
func on_enable_tool_button(tool: DataTypes.Tools) -> void:
	if tool == DataTypes.Tools.TillGround:
		tool_hoe.disabled = false
		tool_hoe.focus_mode = Control.FOCUS_ALL
	elif tool == DataTypes.Tools.WaterCrops:
		tool_watercan.disabled = false
		tool_watercan.focus_mode = Control.FOCUS_ALL
	elif tool == DataTypes.Tools.PlantWheat:
		tool_wheat.disabled = false
		tool_wheat.focus_mode = Control.FOCUS_ALL
	elif tool == DataTypes.Tools.PlantTomato:
		tool_tomato.disabled = false
		tool_tomato.focus_mode = Control.FOCUS_ALL
	

	
