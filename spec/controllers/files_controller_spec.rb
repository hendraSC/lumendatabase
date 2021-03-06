require 'rails_helper'

describe FilesController do
  describe 'GET #show' do
    let(:upload) { create(:file_upload) }
    it 'returns not found without valid params' do
      get 'show', params: { id: upload.id, file_path: %w[a b c] }
      expect(response).not_to be_successful
    end

    it 'returns http success' do
      allow(File).to receive(:file?).and_return(true)
      allow(File).to receive(:read).and_return('Content!')
      expect(response).to be_successful
    end
  end
end
