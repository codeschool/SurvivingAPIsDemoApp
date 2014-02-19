json.extract! @zombie, :name, :age, :created_at, :updated_at
json.message I18n.t('warning_message', name: @zombie.name)
