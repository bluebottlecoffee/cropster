##
# "Borrowed from activesupport/lib/active_support/core_ext/hash/keys.rb
#
# Added to convert all the keys in a Hash from a string to a :symbol. Just for
# personal preference more than anything
#
class Hash
  def symbolize_keys!
    transform_keys! { |key| key.to_sym rescue key }
  end

  def transform_keys!
    return enum_for(:transform_keys!) { size } unless block_given?
    keys.each do |key|
      self[yield(key)] = delete(key)
    end
    self
  end

  def deep_symbolize_keys!
    deep_transform_keys! { |key| key.to_sym rescue key }
  end

  def deep_transform_keys!(&block)
    _deep_transform_keys_in_object!(self, &block)
  end
  def _deep_transform_keys_in_object!(object, &block)
    case object
    when Hash
      object.keys.each do |key|
        value = object.delete(key)
        object[yield(key)] = _deep_transform_keys_in_object!(value, &block)
      end
      object
    when Array
      object.map! {|e| _deep_transform_keys_in_object!(e, &block)}
    else
      object
    end
  end
end
