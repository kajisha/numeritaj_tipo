class <%= class_name %> < NumeritajTipo::EnumBase
end

<% values.each do |arg| %>
class <%= "#{class_name}::#{arg.camelize}" %> < <%= class_name %>
  def initialize
    @value = :<%= arg %>
  end
end
<%- end -%>
