# encoding: utf-8
require File.expand_path(File.join(File.dirname(__FILE__), *%w[.. .. validator]))

module ValidatiousOnRails
  module Validatious
    module Numericality
      class EqualToValidator < ClientSideValidator

        def initialize(validation, options = {})
          name = 'numericality-equal-to'
          super name, options
          self.params = ['count']
          self.message = self.class.generate_message(validation, :key => :equal_to)
          self.accept_empty = validation.options[:allow_nil]
          self.fn = %{
            value = +value;
            return value == params[0];
          }
          self.fn.freeze
        end

      end
    end
  end
end