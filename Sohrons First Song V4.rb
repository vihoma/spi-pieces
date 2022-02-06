# Sohron's first song
cue :intro
sample :ambi_drone, pan: rrand(1, -1)
sleep 0.25
sample :ambi_drone, pan: rrand(1, -1)
use_synth :dsaw
play :C3, amp: 0.3, release: 1, attack: 0.5, sustain: 1, decay: 1, pan: -0.5
sleep 2
play :E3, amp: 0.3, attack: 0.5, attack_level: 1, decay: 1, sustain_level: 0.4, sustain: 2, release: 0.5, pan: 0
sleep 2
play :E3, amp: 0.7, attack: 0.5, attack_level: 1, decay: 1, sustain_level: 0.4, sustain: 2, release: 0.5, pan: 1
sleep 0.5

define :mainloop do
  sample :bd_boom
  use_synth :dsaw
  play :C4
  play :E4
  sleep 0.5
  sample :bd_boom
  play :G4
  play :C4
  sleep 0.5
  sample :bd_boom
  play :A4
  play :E5
  sample :bd_fat
  sleep 0.25
  sample :bd_fat
end

define :chbass do
  use_synth :chipbass
  play :E5
  sleep 0.25
  play :A5
  sleep 0.25
  use_synth :chipbass
  play :C5
  sleep 0.5
  use_synth :chipbass
  play :E5
  use_synth :chipbass
  play :C5
  sleep 0.25
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
  sleep 0.25
end

in_thread do
  3.times do
    cue :start
    start_ixi
  end
end

in_thread do
  17.times do
    cue :main
    mainloop
  end
end

in_thread do
  12.times do
    sync :main
    chbass
  end
  5.times do
    sync :main
    sample :bd_boom, sustain: 2
    sleep 0.25
  end
end

in_thread do
  16.times do
    sleep 1.25
  end
  adrone
end
