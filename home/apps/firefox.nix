{ ... }:
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

      DisableFormHistory = true;
      SearchEngines.Default = "DuckDuckGo";

      Bookmarks = [
        { Title = "Proton Mail"; URL = "https://mail.proton.me"; Placement = "menu"; }
        { Title = "ChatGPT"; URL = "https://chatgpt.com"; Placement = "menu"; }
        { Title = "YouTube"; URL = "https://www.youtube.com"; Placement = "menu"; }
        { Title = "Facebook"; URL = "https://www.facebook.com"; Placement = "menu"; }
        { Title = "Reddit"; URL = "https://www.reddit.com"; Placement = "menu"; }
      ];

      FirefoxHome = {
        Search = true;
        TopSites = false;
        SponsoredTopSites = false;
        SponsoredStories = false;
        Locked = true;
      };

      # Check about:policies after a rebuild to confirm Firefox accepted these.
      # Remove "Translations" if you want built-in page translation back.
      AIControls = {
        Default = { Value = "blocked"; Locked = true; };
        Translations = { Value = "blocked"; Locked = true; };
        PDFAltText = { Value = "blocked"; Locked = true; };
        SmartTabGroups = { Value = "blocked"; Locked = true; };
        LinkPreviewKeyPoints = { Value = "blocked"; Locked = true; };
        SidebarChatbot = { Value = "blocked"; Locked = true; };
        SmartWindow = { Value = "blocked"; Locked = true; };
        SpeechRecognition = { Value = "blocked"; Locked = true; };
      };

      ExtensionSettings = {
        # Bitwarden
        "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
          installation_mode = "force_installed";
        };
        # DuckDuckGo Privacy Essentials
        "jid1-ZAdIEUB7XOzOJw@jetpack" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/duckduckgo-for-firefox/latest.xpi";
          installation_mode = "force_installed";
        };
        # uBlock Origin
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
        };
      };
    };

    profiles.default = {
      settings = {
        "browser.toolbars.bookmarks.visibility" = "never";
        "media.ffmpeg.vaapi.enabled" = true; # hardware video decode (iHD)

        # New tab / address bar noise
        "browser.discovery.enabled" = false;
        "extensions.htmlaboutaddons.recommendations.enabled" = false;
        "extensions.getAddons.showPane" = false;
        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
        "browser.newtabpage.activity-stream.feeds.topsites" = false;
        "browser.newtabpage.activity-stream.showSearch" = true;
        "browser.urlbar.suggest.history" = false;
        "browser.urlbar.suggest.bookmark" = true;
        "browser.urlbar.suggest.openpage" = false;
        "browser.urlbar.suggest.recentsearches" = false;
        "browser.urlbar.suggest.searches" = false;
        "browser.urlbar.suggest.quickactions" = false;
        "browser.urlbar.showSearchTerms.enabled" = false;
        "browser.urlbar.showSearchSuggestionsFirst" = false;
        "browser.urlbar.suggest.quicksuggest.sponsored" = false;
        "browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
        "browser.urlbar.suggest.addons" = false;
        "browser.urlbar.suggest.pocket" = false;
        "browser.urlbar.suggest.topsites" = false;
        "browser.urlbar.suggest.trending" = false;
        "browser.urlbar.suggest.yelp" = false;

        # Telemetry / reporting
        "toolkit.telemetry.enabled" = false;
        "toolkit.telemetry.unified" = false;
        "toolkit.telemetry.archive.enabled" = false;
        "datareporting.healthreport.uploadEnabled" = false;
        "datareporting.usage.uploadEnabled" = false;
        "app.shield.optoutstudies.enabled" = false;
        "browser.crashReports.unsubmittedCheck.autoSubmit2" = false;
        "browser.crashReports.unsubmittedCheck.enabled" = false;
        "browser.tabs.crashReporting.sendReport" = false;

        # Passwords/autofill are handled by Bitwarden
        "signon.rememberSignons" = false;
        "extensions.formautofill.addresses.enabled" = false;
        "extensions.formautofill.creditCards.enabled" = false;

        # No accidental back/forward on touchpad swipe
        "browser.gesture.swipe.left" = "";
        "browser.gesture.swipe.right" = "";
      };
    };
  };
}
