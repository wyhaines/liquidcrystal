module LiquidCrystal
  class Error < Exception
    property :line_number
    property :template_name
    property :markup_context

    def to_s(with_prefix = true)
      str = +""
      str << message_prefix if with_prefix
      str << super()

      if markup_context
        str << " "
        str << markup_context
      end

      str
    end

    private def message_prefix
      str = +""
      str << if is_a?(SyntaxError)
        "Liquid syntax error"
      else
        "Liquid error"
      end

      if line_number
        str << " ("
        str << template_name << " " if template_name
        str << "line " << line_number.to_s << ")"
      end

      str << ": "
      str
    end
  end

  class ArgumentError < LiquidCrystal::Error; end
  class ContextError < LiquidCrystal::Error; end
  class FileSystemError < LiquidCrystal::Error; end
  class StandardError < LiquidCrystal::Error; end
  class SyntaxError < LiquidCrystal::Error; end
  class StackLevelError < LiquidCrystal::Error; end
  class MemoryError < LiquidCrystal::Error; end
  class ZeroDivisionError < LiquidCrystal::Error; end
  class FloatDomainError < LiquidCrystal::Error; end
  class UndefinedVariable < LiquidCrystal::Error; end
  class UndefinedDropMethod < LiquidCrystal::Error; end
  class UndefinedFilter < LiquidCrystal::Error; end
  class MethodOverrideError < LiquidCrystal::Error; end
  class DisabledError < LiquidCrystal::Error; end
  class InternalError < LiquidCrystal::Error; end
end
