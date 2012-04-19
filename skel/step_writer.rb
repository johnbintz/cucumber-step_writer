Cucumber::StepWriter.after_write do |dir|
  %w{open xdg-open}.each do |cmd|
    %x{which #{cmd}}

    if $?.exitstatus
      system %{#{cmd} #{dir}}
      break
    end
  end
end
