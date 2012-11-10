require 'spec_helper'

class Hansel
  include ActiveModel::ForbiddenMethodsProtection
end

class Mugatu
  include ActiveModel::ForbiddenMethodsProtection

  def so_hot_right_now
    "It's that damn Hansel! He's so hot right now!"
  end
end

describe ActiveModel::ForbiddenMethodsProtection do
  it 'does not throw execptions for classes without instance methods' do
    expect {
      Hansel.new
    }.to_not raise_error
  end

  it 'throws an exception for classes with instance methods' do
    expect {
      Mugatu.new
    }.to raise_error(ActiveModel::ForbiddenMethods)
  end
end
