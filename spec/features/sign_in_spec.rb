require 'spec_helper'

describe 'signing in', type: :feature do
  it 'kicks you out with a bad password', driver: :poltergeist do
    visit 'http://learn.livemocha.com'
    fill_in 'Email address', with: 'sxu@rosettastone.com'
    fill_in 'Password', with: 'badpassssssss'
    click_on 'Sign in'
    page.should have_content 'Incorrect password'
  end

  it 'lets you in with a good password' do
    visit 'http://learn.livemocha.com'
    fill_in 'Email address', with: 'sxu@rosettastone.com'
    fill_in 'Password', with: 'password'
    click_on 'Sign in'
    page.should have_content 'Start Page'
  end
end
