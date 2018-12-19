require 'spec_helper'

require_relative '../chapter_1/container'

RSpec.describe Container do
  describe '.identity' do
    subject(:thing) { Class.new }

    it 'returns whatever is passed' do
      expect(Container.identity(thing)).to eql thing
    end
  end

  describe '.compose' do

    let(:add_1) { Proc.new{|value| value + 1 } }

    context 'when composed with the identity' do
      let(:identity) { Container.method(:identity) }
      subject(:composed) { Container.compose(add_1, identity) }

      it 'adds 1 to the argument' do
        expect(composed.call(3)).to eql 4
      end
    end

    context 'when composed with add_1' do
      subject(:composed) { Container.compose(add_1, add_1) }

      it 'adds 2 to the argument' do
        expect(composed.call(3)).to eql 5
      end
    end

  end
end