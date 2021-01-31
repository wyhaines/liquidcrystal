require "./liquidcrystal/*"

module Liquidcrystal
  FilterSeparator            = /\|/
  ArgumentSeparator          = ','
  FilterArgumentSeparator    = ':'
  VariableAttributeSeparator = '.'
  WhitespaceControl          = '-'
  TagStart                   = /\{\%/
  TagEnd                     = /\%\}/
  VariableSignature          = /\(?[\w\-\.\[\]]\)?/
  VariableSegment            = /[\w\-]/
  VariableStart              = /\{\{/
  VariableEnd                = /\}\}/
  VariableIncompleteEnd      = /\}\}?/
  QuotedString               = /"[^"]*"|'[^']*'/
  QuotedFragment             = /#{QuotedString}|(?:[^\s,\|'"]|#{QuotedString})+/
  TagAttributes              = /(\w+)\s*\:\s*(#{QuotedFragment})/
  AnyStartingTag             = /#{TagStart}|#{VariableStart}/
  PartialTemplateParser      = /#{TagStart}.*?#{TagEnd}|#{VariableStart}.*?#{VariableIncompleteEnd}/m
  TemplateParser             = /(#{PartialTemplateParser}|#{AnyStartingTag})/m
  VariableParser             = /\[[^\]]+\]|#{VariableSegment}+\??/

  RAISE_EXCEPTION_LAMBDA = ->(_e) { raise }

  # singleton_class.send(:attr_accessor, :cache_classes)
  # self.cache_classes = true
end
