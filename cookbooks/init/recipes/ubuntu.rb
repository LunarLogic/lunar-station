bash 'enable "partner" repository' do
  code 'sed -i "/^# deb .*partner/ s/^# //" /etc/apt/sources.list && apt-get update >/dev/null'
end
