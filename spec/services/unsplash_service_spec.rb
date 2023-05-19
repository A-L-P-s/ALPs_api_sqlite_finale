require 'rails_helper'

RSpec.describe UnsplashService, :vcr do
  describe "instance methods" do
    context "#fetch_api" do
      it 'returns a json object' do
        response = UnsplashService.new.fetch_api
        keys = %i[
          id
          slug
          created_at
          updated_at
          promoted_at
          width
          height
          color
          blur_hash
          description
          alt_description
          urls
          links
          likes
          liked_by_user
          current_user_collections
          sponsorship
          topic_submissions
          user
          exif
          location
          views
          downloads
        ]

        expect(response).to be_a(Array)
        expect(response[0].keys).to eq(keys)
      end
    end
  end
end
