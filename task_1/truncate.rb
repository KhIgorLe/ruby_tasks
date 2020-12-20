module Truncate
  def truncate(*attr_names, length:)
    attr_names.each do |attr_name|
      var_name = "@#{attr_name}".to_sym

      define_method("#{attr_name}=".to_sym) do |value|
        value = value.strip
        value = "#{value.slice(0, length)}..." if value.size > length
        instance_variable_set(var_name, value)
      end
    end
  end
end
