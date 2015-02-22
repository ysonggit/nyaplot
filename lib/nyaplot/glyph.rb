module Nyaplot
  module Glyph
    include Nyaplot::Base
    type :glyph
    class << self
      #@example
      # Nyaplot::Glyph.instantiate(:scatter)
      def instantiate(df, name, hash)
        glyph = Kernel
          .const_get("Nyaplot")
          .const_get("Glyph")
          .const_get(name.to_s.capitalize)

        glyph.new(hash).data(df)
      end
    end
  end

  module Glyph2D
    include Nyaplot::Glyph
  end

  class Scatter
    include Nyaplot::Glyph
    required_args :data, :x, :y, :position
    optional_args :color, :shape, :size, :stroke_color, :stroke_width

    def initialize(data, x, y)
      self.data(data); self.x(x); self.y(y)
    end

    def size_by(sym)
    end

    def shape_by(sym)
      scale = Nyaplot::DataFrameScale.new(df.uuid, sym)
      range = shape.nil? ? ['circle','triangle-up', 'diamond', 'square', 'triangle-down', 'cross'] : shape
      scale.range range
      shape scale
    end
  end

  class Line
    required_args :data, :x, :y, :position
    optional_args :color, :stroke_width

    def initialize(df, x, y)
    end

    def verify
    end
  end
end