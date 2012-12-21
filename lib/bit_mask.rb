require "bit_mask/version"
require "bit_mask/railtie" if defined? Rails

module BitMask
  def self.included(base)
    base.send(:extend, ClassMethods)
  end

  module ClassMethods
    def as_bit_mask(attr, options={})
      return 0 unless options[:source]

      options.reverse_merge!(:column => "#{attr}_mask")

      define_method "#{attr}=" do |val|
        source = bit_mask_source_for(options[:source])
        values = val.map(&:to_sym) & source
        res = self.send("#{options[:column]}=", values.map { |a| 2**source.index(a) }.sum)
        instance_variable_set("@#{attr}", values)
      end

      define_method attr do
        instance_variable_get("@#{attr}") || begin
          source = bit_mask_source_for(options[:source])
          res = source.reject { |r| ((self.send(options[:column]) || 0) & 2**source.index(r)).zero? }
          instance_variable_set("@#{attr}", res)
        end
      end
    end
  end

  def bit_mask_source_for(source)
    source.is_a?(Array) ? source : send(source)
  end
end
