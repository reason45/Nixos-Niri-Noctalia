
# System-wide basics only. Apps you use yourself belong in ../home/packages.nix.
{ pkgs, ... }:

{
  programs.firefox = {
    enable = true;

    # Force-install browser extensions.
    policies = {
      ExtensionSettings = {
        "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
          installation_mode = "force_installed";
          install_url =
            "https://addons.mozilla.org/firefox/downloads/latest/{446900e4-71c2-419f-a6a7-df9c091e268b}/latest.xpi";
        };

        "jid1-ZAdIEUB7XOzOJw@jetpack" = {
          installation_mode = "force_installed";
          install_url =
            "https://addons.mozilla.org/firefox/downloads/latest/jid1-ZAdIEUB7XOzOJw@jetpack/latest.xpi";
        };

        "uBlock0@raymondhill.net" = {
          installation_mode = "force_installed";
          install_url =
            "https://addons.mozilla.org/firefox/downloads/latest/uBlock0@raymondhill.net/latest.xpi";
        };
      };

      # Privacy and data collection
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      DisableRemoteImprovements = true;
      DisableFirefoxAccounts = false;

      # Disable crash report submission.
      DisableCrashReporter = true;
      CrashReports = {
        SubmitCrashReport = false;
      };

      # Do not offer to save passwords.
      OfferToSaveLogins = false;

      # Disable Firefox address and payment autofill.
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;

      # Remove Firefox Home shortcuts.
      FirefoxHome = {
        TopSites = false;
        SponsoredTopSites = false;
        Locked = true;
      };

      # Keep the global "Block AI enhancements" switch OFF.
      AIControls = {
        Default = {
          Value = "available";
          Locked = true;
        };
      };
    };

    # Lock selected about:config preferences.
    preferences = {
      # Disable swipe gestures for back/forward navigation.
      "browser.gesture.swipe.left" = "";
      "browser.gesture.swipe.right" = "";

      # Never show the bookmarks toolbar.
      "browser.toolbars.bookmarks.visibility" = "never";

      # Disable personalized extension recommendations.
      "browser.discovery.enabled" = false;

      # Disable extension recommendation areas.
      "extensions.htmlaboutaddons.recommendations.enabled" = false;
      "extensions.getAddons.showPane" = false;
    };

    preferencesStatus = "locked";
  };

  environment.systemPackages = with pkgs; [
    git
  ];
}
