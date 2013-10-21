Veewee::Definition.declare({
  :cpu_count => '1',
  :memory_size=> '1024',
  :disk_size => '50140', :disk_format => 'VDI', :hostiocache => 'off',
  :os_type_id => 'Debian_64',
  :iso_file => "debian-7.2.0-amd64-i386-netinst.iso",
  :iso_src => "http://static.realloc.spb.ru/iso/debian-7.2.0-amd64-i386-netinst.iso",
  :iso_md5 => "62bfac4e593fdf88bf770977ab4589aa",
  :iso_download_timeout => "1000",
  :boot_wait => "10", :boot_cmd_sequence => [
    '<Esc>',
    'amd64-install ',
    'preseed/url=http://%IP%:%PORT%/preseed.cfg ',
    'debian-installer=en_US ',
    'auto ',
    'locale=en_US ',
    'kbd-chooser/method=us ',
    'keyboard-configuration/xkb-keymap=us ',
    'netcfg/get_hostname=%NAME% ',
    'netcfg/get_domain=dev.realloc.spb.ru ',
    'fb=false ',
    'debconf/frontend=noninteractive ',
    'console-setup/ask_detect=false ',
    'console-setup-at/keymap=us ',
    '<Enter>'
  ],
  :kickstart_port => "7122",
  :kickstart_timeout => "10000",
  :kickstart_file => "preseed.cfg",
  :ssh_login_timeout => "10000",
  :ssh_user => "vagrant",
  :ssh_password => "vagrant",
  :ssh_key => "",
  :ssh_host_port => "7222",
  :ssh_guest_port => "22",
  :sudo_cmd => "echo '%p'|sudo -S sh '%f'",
  :shutdown_cmd => "/sbin/shutdown -h -P now",
  :postinstall_files => [
    "base.sh",
    "vagrant.sh",
    "virtualbox.sh",
    "chef.sh",
    "cleanup-virtualbox.sh",
    "cleanup.sh",
    "zerodisk.sh"
  ],
  :postinstall_timeout => "10000"
})
