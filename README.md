Formatter for automatically generating step files for Cucumber. It's how I roll.

If you have a step like this:

``` gherkin
Given I set something up
```

And you set up the formatter like this:

```
cucumber -f Cucumber::StepWriter --out features/step_definitions
```

Then `features/step_definitions/given/i_set_something_up.rb` will be generated with
the content of the step stub.

If you want to fire an action after steps are generated, like open a directory with
the list of files so you can rearrange them, add a hook to Cucumber::StepWriter:

``` ruby
Cucumber::StepWriter.after_write do |dir|
  system %{open #{dir}}
end
```

Set up your sane defaults by using the generator:

``` bash
rails generator cucumber:step_writer
```

TODO:

* If you want it to generate for different languages, I take pull requests.
* Otherwise, I'll just add whatever I need when I need it.

