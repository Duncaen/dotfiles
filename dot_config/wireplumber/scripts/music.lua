local putils = require ("policy-utils")
log = Log.open_topic ("s-linking")

SimpleEventHook {
  name = "linking/sample-find-user-target",
  after = "linking/find-best-target",
  before = "linking/prepare-link",
  interests = {
    EventInterest {
      Constraint { "event.type", "=", "select-target" },
      Constraint { "node.name", "=", "output.music" }
    },
  },
  execute = function (event)
    local source, om, si, si_props, si_flags, target =
        putils:unwrap_find_target_event (event)

    -- bypass the hook if there is no target
    if not target then
      return
    end

    log:info (si, string.format ("handling item: %s (%s)",
        tostring (si_props ["node.name"]), tostring (si_props ["node.id"])))

    local filters = {
      ["alsa_output.usb-Creative_Technology_Ltd_Sound_BlasterX_G5_6B0061476AX-00.analog-stereo"]  = "input.harman.hd560s",
      ["alsa_output.usb-Creative_Technology_Ltd_Sound_BlasterX_G5_6B0061476A1-00.analog-stereo"]  = "input.harman.hd560s",
      ["alsa_output.usb-Logitech_Logitech_G430_Gaming_Headset-00.analog-stereo"]    = "input.harman.k371",
      ["alsa_output.pci-0000_2a_00.4.analog-stereo"] = "input.harman.sundara",
      ["alsa_output.pci-0000_2a_00.4.analog-stereo.2"] = "input.harman.sundara",
    }
    local filter_name = filters [target.properties ["node.name"]]
    if not filter_name then
      return
    end

    local filter = om:lookup {
      type = "SiLinkable",
      Constraint { "node.name", "=", filter_name },
    }
    if not filter then
      log:debug (string.format ("... filter '%s' not found", filter_name))
      return
    end
    if not putils.canLink (si_props, filter) then
      log:debug (string.format ("... cannot link filter '%s'", filter_name))
      return
    end

    local passthrough_compatible, can_passthrough =
        putils.checkPassthroughCompatibility (si, filter)
    if not passthrough_compatible then
      log:debug (string.format ("... filter '%s' passthrough not compatible", filter_name))
      return
    end

    log:info (si,
      string.format ("... filter target picked: %s (%s), can_passthrough:%s",
        tostring (filter.properties ["node.name"]),
        tostring (filter.properties ["node.id"]),
        tostring (can_passthrough)))

    -- keep si_flags.has_node_defined_target from previous hooks so follow default works
    si_flags.can_passthrough = can_passthrough
    event:set_data ("target", filter)
  end
}:register ()
