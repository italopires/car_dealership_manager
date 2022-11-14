require 'rails_helper'

RSpec.describe User do
  context 'enumerizeds' do
    it { is_expected.to enumerize(:kind).in(user: 1, admin: 2).with_predicates(true) }
  end
end