module LiquidCrystal
  class Tag
    getter nodelist : Array(String | Tag | Variable)
    getter tag_name : String
    getter line_number : Int32
    getter :parse_context

    alias_method :options, :parse_context
    #include ParserSwitching

    def self.parse(tag_name, markup, tokenizer, parse_context)
        tag = new(tag_name, markup, parse_context)
        tag.parse(tokenizer)
        tag
      end

      def self.disable_tags(*tag_names)
        @disabled_tags ||= [] of Tag
        @disabled_tags.concat(tag_names)
        prepend(Disabler)
      end

    def initialize(@tag_name, @markup, @parse_context)
      @line_number   = parse_context.line_number
    end

    def parse(_tokens)
    end

    def raw
      "#{@tag_name} #{@markup}"
    end

    def name
      self.class.name.downcase
    end

    def render(_context)
      ""
    end

    # For backwards compatibility with custom tags. In a future release, the semantics
    # of the `render_to_output_buffer` method will become the default and the `render`
    # method will be removed.
    def render_to_output_buffer(context, output)
      output << render(context)
      output
    end

    def blank?
      false
    end

    private def parse_expression(markup)
      parse_context.parse_expression(markup)
    end
  end
end
