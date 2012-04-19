module Cucumber
  class StepWriterRailtie < Rails::Railtie
    generators do
      load File.expand_path('../generators.rb', __FILE__)
    end
  end
end

