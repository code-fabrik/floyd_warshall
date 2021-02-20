require "floyd_warshall/version"

module FloydWarshall
  class Error < StandardError; end

  class Optimizer
    attr_accessor :matrix

    def initialize(matrix)
      @matrix = matrix
    end

    def run
      matrices = [matrix]
      nodes.each_with_index do |iter, k|
        matrices[k] = matrices[k-1].clone
        nodes.each_with_index do |from, i|
          nodes.each_with_index do |to, j|
            prev = matrices[k-1]
            dist = [prev.get(from, to), prev.get(from, iter) + prev.get(iter, to)].min
            matrices[k].set(from, to, dist)
          end
        end
      end
      return matrices.last
    end

    private

    def nodes
      matrix.nodes
    end
  end
end
