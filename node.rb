class Node
  attr_accessor :nombre,:costo,:final,:hijo,:esVisitado
  def initialize(nombre, final, costo)
    @nombre=nombre
    @final=final
    @costo=costo
    @hijo=[]
    @esVisitado=false
  end

  def visitado
    @esVisitado=true
  end

  def esVisitado?
    @esVisitado
  end
end

def museo_britanico
  # Creamos los nodos del grafo de ejemplo
  root_node = Node.new("A", false, 0)
  nodoB = Node.new("B", false, 3)
  nodoX = Node.new("X", false, 1)
  nodoD = Node.new("D", false, 2)
  nodoG = Node.new("G", false, 2)
  nodoE = Node.new("E", false, 5)
  nodoH = Node.new("H", false, 4)
  nodoY = Node.new("Y", false, 2)
  nodoS = Node.new("S", false, 2)
  nodoQ = Node.new("Q", false, 2)
  nodoF = Node.new("F", false, 2)
  nodoI = Node.new("I", false, 4)
  nodoC = Node.new("C", false, 4)
  nodoU = Node.new("U", false, 2)
  nodoK = Node.new("K", false, 1)
  nodoL = Node.new("L", false, 2)
  nodoZ = Node.new("Z", false, 3)
  nodoE2 = Node.new("E", false, 4)
  nodoV = Node.new("V", false, 3)
  nodoI2 = Node.new("I", false, 2)
  nodoQ2 = Node.new("Q", false, 2)
  nodoF2 = Node.new("F", false, 4)
  nodoS2 = Node.new("S", false, 1)
  nodoM1 = Node.new("M", true, 4)
  nodoM2 = Node.new("M", true, 1)
  nodoM3 = Node.new("M", true, 5)
  nodoM4 = Node.new("M", true, 1)
  nodoM5 = Node.new("M", true, 4)
  nodoM6 = Node.new("M", true, 3)

  # Establecemos las relaciones entre los nodos
  root_node.hijo = [nodoB, nodoC]
  nodoB.hijo = [nodoX, nodoY]
  nodoX.hijo = [nodoD, nodoE]
  nodoD.hijo = [nodoG, nodoH]
  nodoY.hijo = [nodoS, nodoI]
  nodoS.hijo = [nodoQ, nodoM1]
  nodoQ.hijo = [nodoF, nodoM2]
  nodoC.hijo = [nodoU, nodoV]
  nodoU.hijo = [nodoK, nodoE2]
  nodoK.hijo = [nodoL, nodoM3]
  nodoL.hijo = [nodoM4, nodoZ]
  nodoV.hijo = [nodoI2, nodoS2]
  nodoI2.hijo = [nodoQ2, nodoM5]
  nodoQ2.hijo = [nodoF2, nodoM6]
  
  

  # Función recursiva para encontrar todas las rutas hacia el nodo meta
  def find_paths(node, current_path, paths)
    current_path << node

    if node.final
      paths << current_path.dup
    else
      node.hijo.each do |child|
        find_paths(child, current_path, paths) unless child.esVisitado?
      end
    end

    current_path.pop
    node.visitado
  end

  paths = []
  find_paths(root_node, [], paths)

  num_paths = paths.size
  cost_opt = Float::INFINITY
  camopt = nil

  paths.each do |path|
    costo = path.sum(&:costo)

    if costo < cost_opt
      cost_opt = costo
      camopt = path
    end
  end

  if num_paths == 0
    puts "No existen caminos"
  else
    camino_optimo = camopt.map(&:nombre).join(" -> ")
    puts "Camino Óptimo: #{camino_optimo}"
    puts "Costo Óptimo: #{cost_opt}"
  end
end

# Llamamos a la función museo_britanico para ejecutar el algoritmo
museo_britanico