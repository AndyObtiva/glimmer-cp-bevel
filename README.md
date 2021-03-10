# Bevel 0.1.0
## [<img src="https://raw.githubusercontent.com/AndyObtiva/glimmer/master/images/glimmer-logo-hi-res.png" height=40 /> Glimmer Custom Shape](https://github.com/AndyObtiva/glimmer-dsl-swt/docs/reference/GLIMMER_COMMAND.md#custom-shape-gem)

[Glimmer DSL for SWT](https://github.com/AndyObtiva/glimmer-dsl-swt) Bevel Custom Shape.

`bevel` is the [Glimmer GUI DSL](https://github.com/AndyObtiva/glimmer-dsl-swt/blob/master/docs/reference/GLIMMER_GUI_DSL_SYNTAX.md#glimmer-gui-dsl-syntax) keyword provided by this [gem](https://rubygems.org/gems/glimmer-cp-bevel).

### Screenshot

Every square is a `bevel` custom shape instance with a varying base color.

![bevel screenshot](https://raw.githubusercontent.com/AndyObtiva/glimmer-dsl-swt/master/images/glimmer-example-image-shape-dsl.png)

### Actual Use

It is used in [Glimmer Tetris](https://github.com/AndyObtiva/glimmer-dsl-swt/blob/master/docs/reference/GLIMMER_SAMPLES.md#glimmer-tetris).

![Glimmer Tetris](https://raw.githubusercontent.com/AndyObtiva/glimmer-dsl-swt/master/images/glimmer-tetris.png)

## API

`bevel(options)`

Options (keyword args) are:
- `:base_color` (required): base background color to produce bevel effect for
- `:size` (required): size in pixels for width and height (resulting in bevel squares having that size)
- `:bevel_pixel_size` (optional): adjusts the bevel area
- `:x` (default: 0) (optional): starting location x coordinate within parent
- `:y` (default: 0) (optional): starting location y coordinate within parent

## Example

[Glimmer GUI DSL](https://github.com/AndyObtiva/glimmer-dsl-swt/blob/master/docs/reference/GLIMMER_GUI_DSL_SYNTAX.md#glimmer-gui-dsl-syntax) code snippet:

```ruby
require 'glimmer-cp-bevel'

include Glimmer

shell {
  text 'Glimmer Tetris Icon'
  label {
    text 'Check out the application icon!'
    font height: 20
  }
  icon_block_size = 64
  icon_bevel_size = icon_block_size.to_f / 25.to_f
  icon_bevel_pixel_size = 0.16*icon_block_size.to_f
  icon_size = 8
  icon_pixel_size = icon_block_size * icon_size
  image(icon_pixel_size, icon_pixel_size) {
    icon_size.times { |row|
      icon_size.times { |column|
        colored = row >= 1 && column.between?(1, 6)
        color = colored ? color(([:white] + [:cyan, :blue, :dark_yellow, :yellow, :green, :magenta, :red]).sample) : color(:white)
        x = column * icon_block_size
        y = row * icon_block_size
        bevel(x: x, y: y, base_color: color, size: icon_block_size)
      }
    }
  }
}.open
```

Produces this [Glimmer Tetris](https://github.com/AndyObtiva/glimmer-dsl-swt/blob/master/docs/reference/GLIMMER_SAMPLES.md#glimmer-tetris) icon [image](https://github.com/AndyObtiva/glimmer-dsl-swt/blob/master/docs/reference/GLIMMER_GUI_DSL_SYNTAX.md#image):

![Tetris Icon](https://raw.githubusercontent.com/AndyObtiva/glimmer-dsl-swt/master/images/glimmer-tetris-icon.png)

## Contributing to glimmer-cp-bevel

-   Check out the latest master to make sure the feature hasn't been
    implemented or the bug hasn't been fixed yet.
-   Check out the issue tracker to make sure someone already hasn't
    requested it and/or contributed it.
-   Fork the project.
-   Start a feature/bugfix branch.
-   Commit and push until you are happy with your contribution.
-   Make sure to add tests for it. This is important so I don't break it
    in a future version unintentionally.
-   Please try not to mess with the Rakefile, version, or history. If
    you want to have your own version, or is otherwise necessary, that
    is fine, but please isolate to its own commit so I can cherry-pick
    around it.

## License

[MIT](LICENSE.txt)

Copyright (c) 2021 - Andy Maleh.

--

[<img src="https://raw.githubusercontent.com/AndyObtiva/glimmer/master/images/glimmer-logo-hi-res.png" height=40 />](https://github.com/AndyObtiva/glimmer) Built for [Glimmer DSL for SWT](https://github.com/AndyObtiva/glimmer-dsl-swt) (JRuby Desktop Development GUI Framework).
