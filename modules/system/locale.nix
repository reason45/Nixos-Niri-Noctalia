# Timezone and locale. Hardware clock in local time for Windows dual-boot.
{ ... }:
{
  time.timeZone = "Asia/Kathmandu";
  i18n.defaultLocale = "en_US.UTF-8";
  time.hardwareClockInLocalTime = true;
}
