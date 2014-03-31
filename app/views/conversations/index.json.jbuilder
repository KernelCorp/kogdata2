json.array!(@conversations) do |conversation|
  json.extract! conversation, :id, :theme
end
