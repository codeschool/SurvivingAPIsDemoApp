json.array!(@zombies) do |zombie|
  json.extract! zombie, :id, :name, :age
  json.message I18n.t('warning_message', name: zombie.name)
end
