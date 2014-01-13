json.array!(@zombies) do |zombie|
  json.extract! zombie, :id, :name, :age
end
