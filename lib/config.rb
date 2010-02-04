module Config
  def site(key)
   get_conf('site')[key]
  end

  def support(key)
   get_conf('support')[key]
  end

  def database(key)
    get_conf('database')[key]
  end

  private
  def load_config(file_name)
    YAML.load_file(File.join(File.dirname(__FILE__), "../#{file_name}"))
  end

  def get_conf(section)
    load_config('config.yml')[section]
  end
end
