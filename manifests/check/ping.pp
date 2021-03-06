define nagios::check::ping (
  $ensure              = $::nagios_check_ping_ensure,
  $args                = $::nagios_check_ping_args,
  $servicegroups       = $::nagios_check_ping_servicegroups,
  $check_period        = $::nagios_check_ping_check_period,
  $max_check_attempts  = $::nagios_check_ping_max_check_attempts,
  $notification_period = $::nagios_check_ping_notification_period,
  $use                 = $::nagios_check_ping_use,
) {

  $final_args = $args ? {
    undef   => '-w 2000,50% -c 5000,100% -p 5',
    default => $args,
  }

  nagios::service { "check_ping_${title}":
    ensure              => $ensure,
    check_command       => "check_ping!${final_args}",
    service_description => 'ping',
    servicegroups       => $servicegroups,
    check_period        => $check_period,
    max_check_attempts  => $max_check_attempts,
    notification_period => $notification_period,
    use                 => $use,
  }

}
