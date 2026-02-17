{ pkgs, ... }:

let
  custom_bg = toString ./sddm-background.png;
in
pkgs.sddm-astronaut.override {
  embeddedTheme = "japanese_aesthetic";
  themeConfig = {
    Background = custom_bg;
    HeaderTextColor = "#5c729d";
    DateTextColor = "#ffffff";
    TimeTextColor = "#ffffff";
    LoginFieldBackgroundColor = "#fbf1c7";
    PasswordFieldBackgroundColor = "#fbf1c7";
    LoginFieldTextColor = "#ffffff";
    PasswordFieldTextColor = "#ffffff";
    UserIconColor = "#ffffff";
    PasswordIconColor = "#ffffff";
    LoginButtonBackgroundColor = "#242731";
    SystemButtonsIconsColor = "#ffffff";
    SessionButtonTextColor = "#ffffff";
    VirtualKeyboardButtonTextColor = "#ffffff";
  };
}
