class_name GridGraph
extends RefCounted

var cols: int
var rows: int
var walls: Dictionary


func _init(_cols: int, _rows: int, _walls: Dictionary):
	cols = _cols
	rows = _rows
	walls = _walls

# Retorna todos os vizinhos caminháveis (Norte, Leste, Sul, Oeste)
func get_neighbors(cell: Vector2i) -> Array[Vector2i]:
	var neighbors: Array[Vector2i] = []
	# Direções ortogonais (sem diagonal por enquanto, para simplificar)
	var directions = [Vector2i.UP, Vector2i.RIGHT, Vector2i.DOWN, Vector2i.LEFT]

	for dir in directions:
		var next_cell = cell + dir
		if in_bounds(next_cell) and not walls.has(next_cell):
			neighbors.append(next_cell)
			
	return neighbors

# Verifica se a célula está dentro dos limites do mapa
func in_bounds(cell: Vector2i) -> bool:
	return cell.x >= 0 and cell.x < cols and cell.y >= 0 and cell.y < rows
