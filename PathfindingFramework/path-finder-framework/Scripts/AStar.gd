class_name AStar
extends SearchAlgorithm

var pq: PriorityQueue = PriorityQueue.new()

# Função Heurística
func heuristic(a: Vector2i, b: Vector2i) -> float:
	# TODO 1: Implementar a Distância Manhattan (igual ao da Busca Gulosa)
	return 0.0

func solve(start: Vector2i, goal: Vector2i, tree: SceneTree = null, redraw_callback: Callable = Callable()) -> Array[Vector2i]:
	frontier.clear()
	visited.clear()
	closed_set.clear() # Limpa os nós já processados
	pq = PriorityQueue.new()
	cancelled = false
	
	var start_node = SearchNode.new(start, null, 0.0)
	# TODO 2: O nó inicial também precisa ter o h_cost calculado!
	
	_add_to_frontier(start_node)
	visited[start] = start_node
	
	while not pq.is_empty():
		if cancelled:
			return []
			
		var current_node = _get_from_frontier()
		
		# Marca o nó como totalmente avaliado (para pintar de azul!)
		closed_set[current_node.cell] = true 
		
		if current_node.cell == goal:
			return _reconstruct_path(current_node)
			
		for neighbor in graph.get_neighbors(current_node.cell):
			
			# TODO 3: Qual é o custo para dar este passo? E qual o novo Custo Acumulado (G)?
			# Dica: Igual ao do Dijkstra!
			var step_cost = 0.0
			var new_g_cost = 0.0
			
			# TODO 4: Qual a condição para o A* explorar este vizinho?
			# Dica: Ou ele é inédito, ou achamos um caminho MAIS BARATO para ele (Igual ao Dijkstra).
			var deve_explorar = false 
			
			if deve_explorar:
				var new_node = SearchNode.new(neighbor, current_node, new_g_cost)
				
				# TODO 5: Calcule a estimativa (h_cost) deste novo nó para o alvo!
				
				visited[neighbor] = new_node
				_add_to_frontier(new_node)
				
		if tree != null and redraw_callback.is_valid():
			redraw_callback.call() 
			await tree.create_timer(0.01).timeout 
				
	return []

func _add_to_frontier(node: SearchNode):
	# TODO 6: Qual atributo define a prioridade no A*? 
	# Dica: O A* soma G + H. O 'SearchNode' já tem uma função pronta que retorna essa soma!
	# pq.put(node, ?????)
	pass

func _get_from_frontier() -> SearchNode:
	return pq.get_item()