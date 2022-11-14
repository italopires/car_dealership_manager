require 'rails_helper'

RSpec.describe CarPolicy do
  subject { described_class }
  let(:permission) { :admin }
  let!(:user) { create(:user, kind: permission )}

  permissions :index? do
    context 'when permission is admin' do
      it { is_expected.to permit user, Car }
    end

    context 'when permission is user' do
      let(:permission) { :user }

      it { is_expected.to permit user, Car }
    end
  end

  permissions :new?, :create?, :edit?, :update?, :destroy? do
    context 'when permission is admin' do
      it { is_expected.to permit user, Car }
    end

    context 'when permission is user' do
      let(:permission) { :user }

      it { is_expected.not_to permit user, Car }
    end
  end
end