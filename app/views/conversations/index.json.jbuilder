json.array!(@conversations) do |conversation|
  json.extract! conversation, :theme, :id
end
