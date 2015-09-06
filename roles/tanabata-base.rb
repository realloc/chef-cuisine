name 'tanabata-base'
description 'Basic chef role for Tanabata Project boxes'
run_list(
  'recipe[timezone]',
  'recipe[ntp]'
)
override_attributes(
  'ntp' => {
    'sync_clock' => true,
    'sync_hw_clock' => true,
    'servers' => ['0.ru.pool.ntp.org', '1.ru.pool.ntp.org', '2.ru.pool.ntp.org', '3.ru.pool.ntp.org']
  },
  'tz' => 'Etc/UTC'
)
