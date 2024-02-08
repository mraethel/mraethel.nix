{
  services.pipewire.extraConfig.pipewire = {
    pipewire = {
      "context.properties" = {
        "default.clock.quantum" = 128;
      };
    };
#   roc-source = {
#     "context.modules" = [{
#       name = "libpipewire-module-roc-source";
#       args = {
#         "local.ip" = "0.0.0.0";
#         "resampler.profile" = "medium";
#         "fec.code" = "rs8m";
#         "sess.latency.msec" = 100;
#         "local.source.port" = 10001;
#         "local.repair.port" = 10002;
#         "source.name" = "ROC Source";
#         "source.props" = {
#           "node.name" = "roc-source";
#         };
#       };
#     }];
#   };
#   roc-sink = {
#     "context.modules" = [{
#       name = "libpipewire-module-roc-sink";
#       args = {
#         "fec.code" = "rs8m";
#         "remote.ip" = "192.168.0.100";
#         "remote.source.port" = 10001;
#         "remote.repair.port" = 10002;
#         "sink.name" = "ROC Sink";
#         "sink.props" = {
#           "node.name" = "roc-sink";
#         };
#       };
#     }];
#   };
  };
}
