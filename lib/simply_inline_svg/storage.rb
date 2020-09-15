module SimplyInlineSvg
  class Storage
    class << self

      attr_accessor :data

      def register_directory(directory)
        fpaths = Dir["#{directory}/**/*.svg"]
        while fpaths.length > 0
          fpath = fpaths.shift
          register_svg(File.basename(fpath), fpath)
        end
        self.data
      end

      def register_svg(fname, fpath)
        svg = Svg.new(File.read(fpath))
        self.data.merge!({ fname => svg })
      end

      def find!(name)
        raise SvgNotFound if self.data[name].nil?
        self.data[name]
      end

      def find(name)
        self.data[name]
      end

    end
  end
end

SimplyInlineSvg::Storage.data = {}
