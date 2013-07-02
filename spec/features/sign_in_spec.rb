require 'spec_helper'
require 'digest/md5'

describe 'logging into github', type: :feature do
  it 'kicks you out with a bad password' do
    visit 'http://github.com'
    click_on 'Sign in'
    # todo: improve on this so it doesn't rely on a css selector
    within '#login' do
      fill_in 'Username or Email', with: Digest::MD5.hexdigest(rand.to_s)[0,8]
      fill_in 'Password', with: 'notmypassword'
      click_on 'Sign in'
    end
    page.should have_content 'Incorrect username or password.'
  end

  it 'has a forgot password link' do
    visit 'http://github.com'
    click_on 'Sign in'
    page.should have_link '(forgot password)'
  end
end
