module Sinatra
  include Config
  module ViewHelpers
    def myhaml(template, options={})
       template = :"#{self.class.to_s.snake_case}/#{template}"
       haml template, options
    end

    def partial(template, options={})
      template = :"#{template}"
      haml template, options.merge!(:layout => false)
    end

    def mail_to(title, email=nil)
      email ||= title
      tag("a", :href => "mailto:#{email}") do
             title
      end
    end
    
    def _site_config
      Config.site
    end
  end
  helpers ViewHelpers
end 
