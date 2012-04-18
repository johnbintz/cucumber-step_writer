Formatter for automatically generating step files for Cucumber. It's how I roll.

If you have a step like this:

``` gherkin
Given I set something up
```

And you set up the formatter like this:

```
cucumber -f Cucumber::StepWriter --out features/step_definitions
```

Then `features/step_definitions/given/i_set_something_up.rb` will be generated.

TODO:

* If you want it to generate for different languages, I take pull requests.
* Otherwise, I'll just add whatever I need when I need it.

