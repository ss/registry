module Registry
  class Config

    # Permission check used by the Registry UI.
    #
    # call-seq:
    #   Registry.configure do |config|
    #     config.permission_check { current_user.admin? }
    #   end
    def permission_check(*args, &blk)
      if block_given?
        Registry::RegistryController.send(:define_method, :permission_check, &blk)
        Registry::RegistryController.prepend_before_filter(:permission_check)
      else
        Registry::RegistryController.filter_chain.delete_if { |ii| :permission_check == ii.method }
      end
    end

    # Layout used by the Registry UI.
    #
    # call-seq:
    #   Registry.configure do |config|
    #     config.layout = 'admin'
    #   end
    def layout=(value)
      Registry::RegistryController.send(:layout, value)
    end

    # Method used by Registry UI to obtain the current user id.
    #
    # call-seq:
    #   Registry.configure do |config|
    #     config.user_id { current_user.id }
    #   end
    def user_id(*args, &blk)
      if block_given?
        Registry::RegistryController.send(:define_method, :registry_user_id, &blk)
        Registry::RegistryController.send(:private, :registry_user_id)
      else
        Registry::RegistryController.send(:remove_method, :registry_user_id)
      end
    end

  end
end # module Registry
