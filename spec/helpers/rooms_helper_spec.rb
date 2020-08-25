require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the RoomsHelper. For example:
#
# describe RoomsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe RoomsHelper, type: :helper do
  describe('#edit_test_attribute') do
    context('when a single word is provided') do
      it 'returns a downcased version of the word preceeded with edit-' do
        expect(helper.edit_test_attribute('Dude')).to eq 'edit-dude'
      end
    end

    context('when a phrase is provided') do
      it('returns a downcased version of the phrase preceeded with -edit with spaces replaced by hyphens') do
        expect(helper.edit_test_attribute('Where is My Cat')).to eq 'edit-where-is-my-cat'
      end
    end

    context('when there are special characters') do
      it('removes the special characters and returns any other words hyphenised and preceeded with edit-') do
        expect(helper.edit_test_attribute('hi @ mom')).to eq 'edit-hi-mom'
      end
    end
  end

  describe('#delete_test_attribute') do
    context('when a single word is provided') do
      it 'returns a downcased version of the word preceeded with delete-' do
        expect(helper.delete_test_attribute('Dude')).to eq 'delete-dude'
      end
    end

    context('when a phrase is provided') do
      it('returns a downcased version of the phrase preceeded with -delete with spaces replaced by hyphens') do
        expect(helper.delete_test_attribute('Where is My Cat')).to eq 'delete-where-is-my-cat'
      end
    end

    context('when there are special characters') do
      it('removes the special characters and returns any other words hyphenised and preceeded with delete-') do
        expect(helper.delete_test_attribute('hi @ mom')).to eq 'delete-hi-mom'
      end
    end
  end
end
