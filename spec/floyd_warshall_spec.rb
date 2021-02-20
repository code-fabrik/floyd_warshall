require 'adjacency_matrix'

RSpec.describe FloydWarshall do
  before(:each) do
    nodes = ['A', 'B', 'C', 'D', 'E']

    graph = WeightedGraph::PositiveWeightedGraph.new
    graph.add_undirected_edge('A', 'B', 2)
    graph.add_undirected_edge('B', 'C', 2)
    graph.add_undirected_edge('C', 'D', 2)
    graph.add_undirected_edge('A', 'D', 10)
    graph.add_undirected_edge('B', 'E', 1)

    matrix = AdjacencyMatrix::Matrix.new(nodes, graph)

    @optimizer = FloydWarshall::Optimizer.new(matrix)
  end

  it "has a version number" do
    expect(FloydWarshall::VERSION).not_to be nil
  end

  context '#run' do
    it 'optimizes matrix' do
      result = @optimizer.run

      nodes = ['A', 'B', 'C', 'D', 'E']

      graph = WeightedGraph::PositiveWeightedGraph.new
      graph.add_undirected_edge('A', 'A', 0)
      graph.add_undirected_edge('A', 'B', 2)
      graph.add_undirected_edge('A', 'C', 4)
      graph.add_undirected_edge('A', 'D', 6)
      graph.add_undirected_edge('A', 'E', 3)
      graph.add_undirected_edge('B', 'A', 2)
      graph.add_undirected_edge('B', 'B', 0)
      graph.add_undirected_edge('B', 'C', 2)
      graph.add_undirected_edge('B', 'D', 4)
      graph.add_undirected_edge('B', 'E', 1)
      graph.add_undirected_edge('C', 'A', 4)
      graph.add_undirected_edge('C', 'B', 2)
      graph.add_undirected_edge('C', 'C', 0)
      graph.add_undirected_edge('C', 'D', 2)
      graph.add_undirected_edge('C', 'E', 3)
      graph.add_undirected_edge('D', 'A', 6)
      graph.add_undirected_edge('D', 'B', 4)
      graph.add_undirected_edge('D', 'C', 2)
      graph.add_undirected_edge('D', 'D', 0)
      graph.add_undirected_edge('D', 'E', 5)
      graph.add_undirected_edge('E', 'A', 3)
      graph.add_undirected_edge('E', 'B', 1)
      graph.add_undirected_edge('E', 'C', 3)
      graph.add_undirected_edge('E', 'D', 5)
      graph.add_undirected_edge('E', 'E', 0)

      expectation = AdjacencyMatrix::Matrix.new(nodes, graph)

      expect(result).to eq(expectation)
    end
  end
end
