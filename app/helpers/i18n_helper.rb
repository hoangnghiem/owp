module I18nHelper

  # if key not found, lookup scope shared or root scope shared
  def translate(key, options={})
    if options.has_key?(:default)
      super(key, options)
    else
      key_path = scope_key_by_partial(key)
      key_tokens = key_path.split('.')

      fallback_scope_tokens = key_tokens.dup
      fallback_scope_tokens[-2] = 'shared'
      fallback_scope = fallback_scope_tokens.join('.').to_sym
      fallback_root = ['shared', key_tokens[-1]].join('.').to_sym
      options.merge!(default: [fallback_scope, fallback_root])
      super(key, options)
    end
  end

  alias :t :translate

end
