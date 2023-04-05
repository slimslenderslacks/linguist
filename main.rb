require 'rugged'
require 'linguist'

repo = Rugged::Repository.new(ARGV[0])
project = Linguist::Repository.new(repo, repo.head.target_id)
puts project.languages      #=> { "Ruby" => 119387 }

