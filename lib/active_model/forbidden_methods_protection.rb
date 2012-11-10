module ActiveModel
  class ForbiddenMethods < StandardError
  end

  module ForbiddenMethodsProtection
    def self.included(base)
      base.extend ClassMethods
      base.overwrite_initialize(base)

      base.instance_eval do
        def method_added(name)
          return if name != :initialize
          overwrite_initialize(base)
        end
      end
    end

    module ClassMethods
      def overwrite_initialize(base)
        class_eval do
          unless method_defined?(:custom_initialize)
            define_method(:custom_initialize) do
              unless base.instance_methods(false).size == 1
                raise ActiveModel::ForbiddenMethods
              end

              original_initialize
            end
          end

          if instance_method(:initialize) != instance_method(:custom_initialize)
            alias_method :original_initialize, :initialize
            alias_method :initialize, :custom_initialize
          end
        end
      end
    end
  end
end