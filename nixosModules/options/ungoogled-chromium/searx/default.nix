{
  config,
  lib,
  ...
}: let
  cfg = config.programs.chromium;
in {
  options.programs.chromium.searx = {
    enable = lib.mkEnableOption "SearXNG";
    domain = lib.mkOption {
      type = lib.types.str;
      default = "https://eu.priv.au";
    };
    hash = lib.mkOption {
      type = lib.types.str;
      default = "eJx1WEuv67gN_jXNxpig7RQYdJFVgW6nQGdvyBJj81oSffVI4vPrh_IjpuIzi2NEnyRKfH2kjlYJegoI8daDh6DsxSrfZ9XDDfzFklZ2-aVyIk1uspDg1hP1Fi7oeFk7BXrNtz9ChouDNJC5_e_3__9xieoOEVTQw-3vlzSAg1vEsv8SIGabYku-9fBsk-pu_1U2wsUQtjxJ9gHhRoqHVwr9Zd3WxjTzVRzpQV00-AShVRZ77_j3erwyD-U1mHY7d5X6M0OYW_RtwsQClpXo7-gxsVAdyNoVXHeVa-nVKjMLsqA36QOlEeZ4M3BXfP-Lwag6y6eB79GzAf_dq75tiXUNf_vnf5T3KjZFIj5AwNPYOAyBgsRYv4a_TUwU5GKvNHmj2hZTGYaEmn8Xs8cyjmPbbm7jYae80cpNbetyRF0QtFj-2vaBBigukO-rTTxuVolC8oKycxgr3x1ZpVTSUpf1CGm7YTd1lfBksBc20Vr_kh5iP03g2dkRxNl6mgLcIQC7chPLToqRwZb9hQVfsad5IAeQOHCG6WN41q2AlWo6B4sg9zFSjp9r6w5-oLuEDMAXR-Hb3AZiUgnjobCBByqf2HHiAsb0DQdRCUAkH6VEYKXQHPufOKJRSVWnssHLX0_fo2eNxdzJg2KuMorAn6DKdT7j1alJaAqOfuAEBtWBJU6LuTLsP17iWneLegwSCABNpHt6qgCNwcC5V7JwDYJ7QD-ikglwn2dhLD4GczzcweNEtO3uOflVt8cTGegg9PsckQmgjFBnZbizuTZ8smouCXvescw44sCU2xwTSkBlG9SLx98a9BMZI2NoUF1Q5bPdbVCcXmF1zQos52wDdKY7roCuz9Ke6JW4A3r-iZTj99h-gR8YBzpkMoEEFeam-DDK0N4n6N6wTj3zttTLMl08qrC11MUE17Drob7sHFCLk7l6KD0pvy1w-NKWshEL6GtAKdM9XWcl4Ce37fazEpFIZo4AH8SjOMCm3HEUqi0RD3Yp8zxLQuGJPaF6jDvXTVhqEESZ2lNJAXHMMr4u9z_UYHrbSo24-Rs8p-8xtYfjd9uq7GW1rsw9201_PpmD5K4FqHes0OnsFT6lQVAcNU3HbBVl8AZKqSQdhzuBMF2ECdWu81vICpRcbMpnu2wEx0eibqIeyKogvRILk06l6RDKJBpnSsRRO5bYeZNP0YBlqFwtFuimeapyKPvIKRwHWTDUQBXXLsAHXSq0s6MSR0LDBzogMX5iV9UU7q1eXLQDVplSSL8jGuMnWJ1YgJ-ZEnyuipSDPqMT6IWT_gI-jFzgUpMxzZ-rHzR_GL-g3BY6Tp_rKXieZO9BOWWnoa5gqNMX-boy_Prrby9ROLMBLwPoyytXpT79ABhrhEl3Qkvp2OfVo8TnsSjkbu7B7SQ0AYSUO8kMrtQw3j6W3uIJnZiaVd0SlPE5ZUJmUpISLZszMntI7EkvHMlzkjZx9uRnB1JbGEMdXyt0OmuFT-kZf0zX6Sntl4LSFQXER1_4Tch6EBqm7fzabPNU1g5sPy89yu523LhUVsjO2fk4i8vCo3LtApyjY4XPLeUCV8pzqTnqxhreQ05H8a4IceyvPe3kd2GWr3r0hSoXLZuiy7uxfuHjMwe2ZkZ0hQPcRyoU9o5SKsW5GfLeWEBiEvAsX3jzbgLJno47kWNDv1Xz45StjziZa8Mrw2zYN0zJWTmqKMs1ODc3JVVz6TvhNJWZyU8gF8D0rRBmeYF__bJ1AwfkFL9lDPlPuW98YJJlNpZT5l36FXd6sLdAe60ujXCEdKrTHNwAidtRUatNyelj2cSPNxL5MGHgjqxT4sLciGm-G3oDgoe4kLpS0YWoedrDhq9kULANhya_wOqehUuWHolZ6G7puYdbHHOXfcp7F1caCc_dz_pY_K7w5QlCjm-T8BsZDffGofbDTPmDzd7Ifh-O7FKkal8x-zhutBtmCR8tW0Y-QSgYj6MorETpXswkXgTPlMIVhYG79K_93Xc8lCebOQvjrRT-13UbXQeOMSZ34Kc_V95V3WoBqXb9z8Az8JP9NM1maDk19fhO9r84p1T1dXCSwe_8e4v-TmfpYWnAW34j8g1c8eSFOw6Outufy-WE9A==";
    };
  };

  config.programs.chromium = lib.mkIf cfg.searx.enable {
    defaultSearchProviderEnabled = true;
    defaultSearchProviderSearchURL = "${ cfg.searx.domain }/search"; # bug: Invalid search URL
    defaultSearchProviderSuggestURL = "${ cfg.searx.domain }/autocompleter";
    extraOpts = {
      DefaultSearchProviderSearchURLPostParams = "q={searchTerms}";
      DefaultSearchProviderSuggestURLPostParams = "q={searchTerms}";
      DefaultSearchProviderName = "SearXNG";
      NewTabPageLocation = cfg.searx.domain;
      RestoreOnStartup = 4;
      RestoreOnStartupURLs = [ "${ cfg.searx.domain }/preferences?preferences=${ cfg.searx.hash }" ];
    };
  };
}
