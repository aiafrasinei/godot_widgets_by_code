extends Node2D

var font
var tex

# Called when the node enters the scene tree for the first time.
func _ready():
	font = load("res://fonts/OpenSans_Condensed-Regular.ttf")
	tex = load("res://icon.svg")
	
	var half = get_viewport().size.x/2
	
	var exit = Button.new()
	exit.set_position(Vector2(half, 0))
	exit.set_size(Vector2(110, 50))
	exit.text = "Exit"
	exit.connect("pressed", self._button_pressed)
	add_child(exit)
	
	var texture_button = TextureRect.new()
	texture_button.set_position(Vector2(half, 500))
	texture_button.set_size(Vector2(110, 50))
	texture_button.texture = tex
	add_child(texture_button)
	
	#first panel
	var panel1 = Panel.new()
	panel1.set_position(Vector2(20,80))
	panel1.set_size(Vector2(400,400))
	add_child(panel1)
		
	var label = Label.new()
	label.set_position(Vector2(10,10))
	label.set_size(Vector2(110, 50))
	label.set("theme_override_colors/font_color", Color(1, 1, 0))
	label.text = "Label"
	panel1.add_child(label)
	
	var link_button = LinkButton.new()
	link_button.set_position(Vector2(10, 50))
	link_button.set_size(Vector2(110,50))
	link_button.text = "godotengine.org"
	link_button.connect("pressed", self._open_link)
	panel1.add_child(link_button)
	
	var checkbox = CheckBox.new()
	checkbox.set_position(Vector2(10, 90))
	checkbox.set_size(Vector2(20, 20))
	checkbox.text = "checkbox"
	panel1.add_child(checkbox)
	
	var check_button = CheckButton.new()
	check_button.set_position(Vector2(10, 130))
	check_button.set_size(Vector2(10, 20))
	panel1.add_child(check_button)
	
	var colorpicker = ColorPickerButton.new()
	colorpicker.set_position(Vector2(10, 170))
	colorpicker.set_size(Vector2(120,20))
	panel1.add_child(colorpicker)
	
	var line_edit = LineEdit.new()
	line_edit.set_position(Vector2(10, 210))
	line_edit.set_size(Vector2(130, 20))
	panel1.add_child(line_edit)
	
	var sep = HSeparator.new()
	sep.set_position(Vector2(0, 250))
	sep.set_size(Vector2(panel1.size.y, 10))
	panel1.add_child(sep)
	
	var items_list = ItemList.new()
	items_list.set_position(Vector2(0, 280))
	items_list.set_size(Vector2(200, 100))
	items_list.add_item("opt")
	items_list.add_item("test")
	items_list.add_item("other")
	panel1.add_child(items_list)
	
	#second panel
	var panel2 = Panel.new()
	panel2.set_position(Vector2(get_viewport().size.x - 420, 80))
	panel2.set_size(Vector2(400,400))
	add_child(panel2)
	
	var tree = Tree.new()
	tree.set_position(Vector2(10, 10))
	tree.set_size(Vector2(200, 200))
	var root = tree.create_item()
	root.set_text(0, "root")
	var child1 = tree.create_item(root)
	child1.set_text(0, "child1")
	var child2 = tree.create_item(root)
	child2.set_text(0, "child2")
	var child3 = tree.create_item(root)
	child3.set_text(0, "child3")
	var childone = tree.create_item(child3)
	childone.set_text(0, "one")
	var childtwo = tree.create_item(child3)
	childtwo.set_text(0, "two")
	panel2.add_child(tree)
	
	var text_edit = TextEdit.new()
	text_edit.set_position(Vector2(10, 250))
	text_edit.set_size(Vector2(200, 140))
	text_edit.text = "insert some text"
	panel2.add_child(text_edit)
	
	var menu = MenuBar.new()
	menu.set_position(Vector2(0,0))
	menu.set_size(Vector2(200, 20))

	var popup1 = PopupMenu.new()
	popup1.name = "Main"
	popup1.set_position(Vector2(10, 10))
	popup1.add_item("New")
	popup1.add_submenu_item("Other", "Item1")
	popup1.add_item("Exit")
	popup1.connect("index_pressed", self._on_index_pressed)
	menu.add_child(popup1)
	
	var popup2 = PopupMenu.new()
	popup2.name = "Help"
	popup2.set_position(Vector2(10, 10))
	popup2.add_item("Wiki")
	popup2.add_item("Docs")
	popup2.add_item("Howtos")
	menu.add_child(popup2)

	add_child(menu)
	
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _button_pressed():
	get_tree().quit()
	pass

func _open_link():
	OS.shell_open("https://godotengine.org")
	pass
	
func _on_index_pressed(index):
	match index:
		2:
			get_tree().quit()
	pass
