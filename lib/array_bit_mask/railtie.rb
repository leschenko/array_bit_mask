module ArrayBitMask
  class Railtie < Rails::Railtie
    initializer 'array_bit_mask.model_additions' do
      ActiveSupport.on_load :active_record do
        include ArrayBitMask
      end
    end
  end
end