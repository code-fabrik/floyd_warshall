# FloydWarshall

Implements the Floyd-Warshall algorithm to find the shortest paths between all pairs of nodes.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'floyd_warshall'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install floyd_warshall

## Usage

### Create a graph and the adjacency matrix

```ruby
nodes = ['A', 'B', 'C', 'D', 'E']

graph = WeightedGraph::PositiveWeightedGraph.new
graph.add_undirected_edge('A', 'B', 2)
graph.add_undirected_edge('B', 'C', 2)
graph.add_undirected_edge('C', 'D', 2)
graph.add_undirected_edge('A', 'D', 10)
graph.add_undirected_edge('B', 'E', 1)

matrix = AdjacencyMatrix::Matrix.new(nodes, graph)
```

### Create the optimizer

```ruby
optimizer = FloydWarshall::Optimizer.new(matrix)
```

### Running

The `run` method returns an `AdjacencyMatrix::Matrix` object which allows you to access individual edge values. See the `adjacency_matrix` gem for more info.

```ruby
result = optimizer.run

result.get('A', 'D')
#=> 4
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/code-fabrik/floyd_warshall. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/code-fabrik/floyd_warshall/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the FloydWarshall project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/code-fabrik/floyd_warshall/blob/master/CODE_OF_CONDUCT.md).
