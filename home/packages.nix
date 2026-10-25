
{ pkgs, ... }:

{
  programs.firefox = {
    enable = true;

    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      DisableRemoteImprovements = true;
      OfferToSaveLogins = false;
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;

      FirefoxHome = {
        TopSites = false;
        SponsoredTopSites = false;
        SponsoredStories = false;
        Locked = true;
      };

      AIControls = {
      Default = {
       Value = "blocked";
       Locked = true;
      };

      Translations = {
      Value = "blocked";
      Locked = true;
      };

      PDFAltText = {
      Value = "blocked";
      Locked = true;
      };

      SmartTabGroups = {
      Value = "blocked";
      Locked = true;
      };

      LinkPreviewKeyPoints = {
      Value = "blocked";
      Locked = true;
      };

      SidebarChatbot = {
      Value = "blocked";
      Locked = true;
      };

      SmartWindow = {
      Value = "blocked";
      Locked = true;
      };

      SpeechRecognition = {
      Value = "blocked";
      Locked = true;
      };
      };

      ExtensionSettings = {
        "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
          installation_mode = "force_installed";
        };

        "jid1-ZAdIEUB7XOzOJw@jetpack" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/duckduckgo-for-firefox/latest.xpi";
          installation_mode = "force_installed";
        };

        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
        };
      };
    };

    profiles.default = {
      settings = {
        "browser.toolbars.bookmarks.visibility" = "never";

        "browser.discovery.enabled" = false;
        "extensions.htmlaboutaddons.recommendations.enabled" = false;
        "extensions.getAddons.showPane" = false;
        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
        "browser.newtabpage.activity-stream.feeds.topsites" = false;
        "browser.newtabpage.activity-stream.showSearch" = false;
        "browser.urlbar.suggest.quicksuggest.sponsored" = false;
        "browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
        "browser.urlbar.suggest.addons" = false;
        "browser.urlbar.suggest.pocket" = false;
        "browser.urlbar.suggest.topsites" = false;
        "browser.urlbar.suggest.trending" = false;
        "browser.urlbar.suggest.yelp" = false;

        "toolkit.telemetry.enabled" = false;
        "toolkit.telemetry.unified" = false;
        "toolkit.telemetry.archive.enabled" = false;
        "datareporting.healthreport.uploadEnabled" = false;
        "datareporting.usage.uploadEnabled" = false;
        "app.shield.optoutstudies.enabled" = false;

        "browser.crashReports.unsubmittedCheck.autoSubmit2" = false;
        "browser.crashReports.unsubmittedCheck.enabled" = false;
        "browser.tabs.crashReporting.sendReport" = false;

        "signon.rememberSignons" = false;
        "extensions.formautofill.addresses.enabled" = false;
        "extensions.formautofill.creditCards.enabled" = false;

        "browser.gesture.swipe.left" = "";
        "browser.gesture.swipe.right" = "";
      };
    };
  };

  home.packages = with pkgs; [
    git
    wl-clipboard
    btop
    ripgrep
    fd
    imv
    mpv
    papers
    mousepad
    bitwarden-desktop
    libreoffice
    file-roller
    gnome-calculator
  ];
}
