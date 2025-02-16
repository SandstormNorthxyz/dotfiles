{ pkgs, ... }:
{
  services = {
    tlp = {
      enable = false;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

        CPU_MIN_PERF_ON_AC = 0;
        CPU_MAX_PERF_ON_AC = 100;
        CPU_MIN_PERF_ON_BAT = 0;
        CPU_MAX_PERF_ON_BAT = 60;

        #Optional helps save long term battery health
        START_CHARGE_THRESH_BAT0 = 60; # 60 and bellow it starts to charge
        STOP_CHARGE_THRESH_BAT0 = 80; # 80 and above it stops charging
      };
    };
    upower = {
      enable = true;
      percentageLow = 10;
      percentageAction = 5;
      criticalPowerAction = "HybridSleep";
    };

    logind = {
      lidSwitch = "suspend";
      powerKey = "hybrid-sleep";
    };

  };
  powerManagement = {
    enable = true;
    powertop.enable = false;
    # scsiLinkPolicy = "min_power";
    powerDownCommands = ''
      echo "CAN I UNSUSPEND LOCK?"
      ${pkgs.swaylock-effects}/bin/swaylock
    '';
    cpuFreqGovernor = "ondemand";
  };
}
