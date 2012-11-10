module ActiveModel
  class ForbiddenMethods < StandardError
  end

  module ForbiddenMethodsProtection
    extend ActiveSupport::Concern

    included do
      after_initialize :reject_instance_metods
    end

    def reject_instance_metods
      self.class.name.constantize.instance_methods(false).each do |method|
        next if method.to_s.start_with?('_')

        raise ActiveModel::ForbiddenMethods
      end
    end
  end
end