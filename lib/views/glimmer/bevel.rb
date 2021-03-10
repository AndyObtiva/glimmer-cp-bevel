module Glimmer
  class Bevel
    include Glimmer::UI::CustomShape

    BEVEL_CONSTANT = 20
  
    options :base_color, :size, :bevel_pixel_size
    option :x, default: 0
    option :y, default: 0
    
    before_body {
      self.bevel_pixel_size = 0.16*size.to_f if bevel_pixel_size.nil?
    }
    
    body {
      rectangle(x, y, size, size) {
        background bind(self, :base_color)
        polygon(0, 0, size, 0, size - bevel_pixel_size, bevel_pixel_size, bevel_pixel_size, bevel_pixel_size) {
          background bind(self, :base_color) { |color_value|
            unless color_value.nil?
              color = color(color_value)
              rgb(color.red + 4*BEVEL_CONSTANT, color.green + 4*BEVEL_CONSTANT, color.blue + 4*BEVEL_CONSTANT)
            end
          }
        }
        polygon(size, 0, size - bevel_pixel_size, bevel_pixel_size, size - bevel_pixel_size, size - bevel_pixel_size, size, size) {
          background bind(self, :base_color) { |color_value|
            unless color_value.nil?
              color = color(color_value)
              rgb(color.red - BEVEL_CONSTANT, color.green - BEVEL_CONSTANT, color.blue - BEVEL_CONSTANT)
            end
          }
        }
        polygon(size, size, 0, size, bevel_pixel_size, size - bevel_pixel_size, size - bevel_pixel_size, size - bevel_pixel_size) {
          background bind(self, :base_color) { |color_value|
            unless color_value.nil?
              color = color(color_value)
              rgb(color.red - 2*BEVEL_CONSTANT, color.green - 2*BEVEL_CONSTANT, color.blue - 2*BEVEL_CONSTANT)
            end
          }
        }
        polygon(0, 0, 0, size, bevel_pixel_size, size - bevel_pixel_size, bevel_pixel_size, bevel_pixel_size) {
          background bind(self, :base_color) { |color_value|
            unless color_value.nil?
              color = color(color_value)
              rgb(color.red - BEVEL_CONSTANT, color.green - BEVEL_CONSTANT, color.blue - BEVEL_CONSTANT)
            end
          }
        }
        rectangle(0, 0, size, size) {
          foreground bind(self, :base_color) { |color_value|
            # use gray instead of white for the :white color border
            color_value == :white ? :gray : color_value
          }
        }
      }
    }

  end
end
