module Config
  def site
    load_config('config.yml')['site']
  end

  def database
    load_config('config.yml')['database']
  end

  private
  def load_config(file_name)
    YAML.load_file(File.join(File.dirname(__FILE__), "../#{file_name}"))
  end
end
