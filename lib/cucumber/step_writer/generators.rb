module Cucumber
  class StepWriterGenerator < Rails::Generators::Base
    source_root File.expand_path('../../../../skel', __FILE__)

    desc "Create a step writer that opens your step definitiosn folder once steps are generated"
    def generate_step_writer_after_hook
      copy_file 'step_writer.rb', 'features/support/step_writer.rb'
      insert_into_file 'config/cucumber.yml',
                       "# inserted by cucumber-step_writer\nstd_opts << ' -f Cucumber::StepWriter --out features/step_definitions'\n",
                       :after => %r{std_opts = "--format[^\n]*\n}
    end
  end
end
