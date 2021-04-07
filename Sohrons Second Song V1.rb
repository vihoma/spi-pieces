# Sohron's second song
in_thread do
  cue :intro
  sample :ambi_drone, pan: rrand(1, -1)
  sleep 0.25
  sample :ambi_drone, pan: rrand(1, -1)
  use_synth :dsaw
  play :C3, amp: 0.3, release: 1, attack: 0.5, sustain: 1, decay: 1, pan: -0.5
  sleep 1
  play :E3, amp: 0.3, attack: 0.5, attack_level: 1, decay: 1, sustain_level: 0.4, sustain: 2, release: 0.5, pan: 0
  sleep 1
  play :E3, amp: 0.7, attack: 0.5, attack_level: 1, decay: 1, sustain_level: 0.4, sustain: 2, release: 0.5, pan: 1
  sleep 0.25
end

define :mainloop do
  sample :bd_haus
  use_synth :dark_ambience
  play :C4, amp: 0.2, pan: -1
  play :E4, amp: 0.2, pan: -1
  sleep 0.5
  sample :bd_haus
  play :G4, amp: 0.2, pan: 1
  play :C4, amp: 0.2, pan: 1
  sleep 0.5
  sample :bd_haus
  play :A4, amp: 0.2
  play :E5, amp: 0.2
  sample :bd_haus
  sleep 0.25
  sample :bd_haus
end

define :chbass do
  use_synth :chipbass
  play :E5
  sleep 0.25
  play :A5
  sleep 0.25
  play :C5
  sleep 0.5
  play :E5
  play :C5
  sleep 0.25
end

define :b_dnb do
  sleep 0.5
  sample :bass_dnb_f
  sleep 0.25
  sample :bass_dnb_f
  sleep 0.5
end

define :d_hk do
  sleep 0.5
  sample :drum_heavy_kick
  sleep 0.25
  sample :drum_heavy_kick
  sleep 0.5
end

define :midgard do
  sample :elec_hi_snare
  sleep 0.25
  sample :elec_hi_snare
  sleep 0.5
  sample :elec_hi_snare
  sleep 0.5
end

define :adrone do
  sample :ambi_drone
  sleep 0.25
  use_synth :dsaw
  play :E3, amp: 0.3, release: 1, attack: 0.5, sustain: 1, decay: 1, pan: rrand(1, -1)
  sleep 0.5
  play :C3, amp: 0.3, attack: 0.5, attack_level: 1, decay: 1, sustain_level: 0.4, sustain: 2, release: 0.5, pan: rrand(1, -1)
  sleep 0.5
  play :C3, amp: 0.7, attack: 0.5, attack_level: 1, decay: 1, sustain_level: 0.4, sustain: 2, release: 0.5, pan: rrand(1, -1)
end

define :start_ixi do
  with_fx :ixi_techno do
    play 50, pan: rrand(-1, 1)
  end
  sleep 1.25
end

in_thread do
  3.times do
    cue :start
    start_ixi
  end
end

in_thread do
  34.times do
    cue :main
    mainloop
  end
end

in_thread do
  sync :main
  4.times do
    sleep 1.25
  end
  24.times do
    cue :d_hk
    d_hk
  end
end

in_thread do
  sync :main
  5.times do
    sleep 1.25
  end
  20.times do
    cue :mid
    midgard
  end
end

in_thread do
  sync :main
  29.times do
    chbass
  end
  5.times do
    cue :boom
    sample :bd_boom
    sleep 0.25
  end
end

in_thread do
  sync :main
  36.times do
    10.times do
      sample :elec_hi_snare, amp: 0.25
      sleep 0.125
    end
  end
end

in_thread do
  sync :main
  33.times do
    sleep 1.25
  end
  3.times do
    cue :drone
    adrone
    sleep 0.25
  end
end
