music_om = ObjectManager {
  Interest {
    type = "node",
    Constraint { "node.name", "=", "output.music" },
  }
}

metadata_om = ObjectManager {
  Interest {
    type = "metadata",
    Constraint { "metadata.name", "=", "default" },
  }
}

target_om = ObjectManager {
  Interest {
    type = "node",
    Constraint { "media.class", "=", "Audio/Sink" },
    Constraint {
      "node.name", "=", "alsa_output.pci-0000_2a_00.4.analog-stereo"
    }
  },
  Interest {
    type = "node",
    Constraint { "media.class", "=", "Audio/Sink" },
    Constraint {
      "node.name", "=", "alsa_output.usb-Logitech_Logitech_G430_Gaming_Headset-00.analog-stereo"
    }
  },
  Interest {
    type = "node",
    Constraint { "media.class", "=", "Audio/Sink" },
    Constraint {
      "node.name", "=", "alsa_output.usb-Creative_Technology_Ltd_Sound_BlasterX_G5_6B0061476AX-00.analog-stereo"
    }
  }
}

filter_om = ObjectManager {
  Interest {
    type = "node",
    Constraint { "media.class", "=", "Audio/Sink" }
  },
}

default_nodes = Plugin.find("default-nodes-api")
default_nodes:connect("changed", function (...)
  local id = default_nodes:call("get-default-node", "Audio/Sink")
  if id == Id.Invalid then
    return
  end
  local target = target_om:lookup {
      Constraint { "bound-id", "=", id, type = "gobject" }
  }
  if not target then
    return
  end
  local id = target["bound-id"]
  local filter = filter_om:lookup {
    Constraint {
      "x-filter.target", "=", target.properties["node.name"], type = "pw"
    }
  }
  if filter then
    id = filter["bound-id"]
  end
  local metadata = metadata_om:lookup()
  local music = music_om:lookup()
  if not music then
    print("music not found")
    return
  end
  metadata:set(music["bound-id"], "target.node", "Spa:Id", id)
end)

target_om:activate()
filter_om:activate()
music_om:activate()
metadata_om:activate()
