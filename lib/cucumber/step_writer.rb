require 'cucumber/formatter/io'
require 'cucumber/formatter/ansicolor'

module Cucumber
  class StepWriter
    include Cucumber::Formatter::Io
    include Cucumber::Formatter::ANSIColor

    class << self
      def after_write(&block)
        if block
          @after_write = block
        else
          @after_write
        end
      end
    end

    def initialize(step_mother, path_or_io, options)
      @step_mother, @io = step_mother, ensure_dir(path_or_io, 'step writer')
    end

    def after_features(features)
      undefined = @step_mother.steps(:undefined)
      return if undefined.empty?

      undefined.each do |step|
        step_name = Cucumber::Undefined === step.exception ? step.exception.step_name : step.name
        step_multiline_class = step.multiline_arg ? step.multiline_arg.class : nil

        path = Pathname(@io).join(step.actual_keyword.downcase.strip, step_name.downcase.gsub(%r{[^\w]+}, '_').gsub(%r{^_|_$}, '') + '.rb')

        if !path.file?
          puts yellow("Writing new step to #{path}.")

          path.parent.mkpath
          path.open('wb') { |fh| fh.print @step_mother.snippet_text(step.actual_keyword, step_name, step_multiline_class) }
        end
      end

      after_write.call(@io) if after_write
    end

    def after_write
      self.class.after_write
    end
  end
end

