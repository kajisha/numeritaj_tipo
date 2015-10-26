class EnumGenerator < Rails::Generators::NamedBase
  desc 'generate a NumeritajTipo definition in app/enums'

  argument :name, type: :string, required: :true, banner: 'EnumName'
  argument :values, type: :array, default: :[], banner: 'value1 value2 value3'

  source_root File.expand_path '../enums/templates', __FILE__

  def copy_files
    template 'enum.rb', "app/enums/#{file_name}.rb"
  end
end
