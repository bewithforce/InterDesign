class ActiveRecord::ConnectionAdapters::TableDefinition

  def price(*args)
    options = args.extract_options!
    options.reverse_merge!({ precision: 8, scale: 2 })
    column_names = args
    type = :decimal
    column_names.each { |name| column(name, type, options) }
  end

end
