RSpec.describe Web::Controllers::Dashboard::Index do
  it 'exposes a dashboard' do
    subject.call({})
    expect(subject.dashboard).to be_a(Dashboard)
  end
end
