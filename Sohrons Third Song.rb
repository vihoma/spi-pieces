# Welcome to Sonic Pi
# Sohrons Third Sonic Pi Piece
use_bpm 120

define :cymbal do
  sample :drum_cymbal_closed
  sleep 0.25
  sample :drum_cymbal_closed
  sleep 0.25
  sample :drum_cymbal_closed
  sleep 0.25
  sample :drum_cymbal_closed
  sleep 0.75
  sample :drum_cymbal_closed
  sleep 0.5
  sample :drum_cymbal_closed
  sleep 2
end

define :sheet_fill do
  sample :drum_splash_soft
  sleep 0.75
  sample :drum_splash_soft
  sleep 0.75
  sample :drum_cymbal_closed
  sleep 0.25
  sample :drum_cymbal_closed
  sleep 0.25
  sample :drum_cymbal_closed
end

define :bass_drum do
  sample :bd_boom
  sleep 2
  sample :bd_boom
  sleep 0.25
  sample :bd_boom
  sleep 0.5
  sample :bd_haus
  sleep 0.25
  sample :bd_haus
  sleep 1
end

define :melody do
  use_synth :tech_saws
  play :C2, pan: -1, sustain: 1
  sleep 1
  play :C2, pan: 1, sustain: 1
  sleep 1
  play :F2, pan: 1, sustain: 0.25
  sleep 0.25
  play :G2, sustain: 0.25
  sleep 0.5
  play :F2, sustain: 0.25
  sleep 0.25
  play :G2, sustain: 1
  sleep 1
end

define :drum_808 do
  cue :bd_808
  with_fx :bitcrusher do
    sample :bd_808, amp: 20, sustain: 0.25
    sleep 0.5
    sample :bd_808, amp: 20, sustain: 0.25
    sleep 0.5
    sample :bd_808, amp: 20, sustain: 0.25
    sleep 0.5
    sample :bd_808, amp: 20, sustain: 0.25
    sleep 1
    sample :bd_808, amp: 20, sustain: 0.25
    sleep 1
    sample :bd_808, amp: 10, sustain: 0.25
    sleep 0.5
  end
end

define :mid do
  use_synth :tech_saws
  play :C4, sustain: 0.5
  sleep 2
  play :C5, sustain: 2
  sleep 2
end

in_thread do
  sleep 4
  cue :sheet_fill
  sheet_fill
  5.times do
    cue :cymbal
    cymbal
  end
  3.times do
    cue :sheet_fill
    sheet_fill
  end
  5.times do
    cue :cymbal
    cymbal
  end
  3.times do
    cue :sheet_fill
    sheet_fill
  end
  5.times do
    cue :cymbal
    cymbal
  end
end

in_thread do
  sleep 12
  18.times do
    cue :bass_drum
    bass_drum
  end
end

in_thread do
  sleep 4
  4.times do
    cue :melody
    melody
  end
  5.times do
    cue :mid
    mid
  end
  5.times do
    cue :melody
    melody
  end
  2.times do
    cue :mid
    mid
  end
end

in_thread do
  6.times do
    cue :loop_breakbeat
    sample :loop_breakbeat, beat_stretch: 2
    sleep 2
  end
  5.times do
    drum_808
  end
  10.times do
    cue :loop_breakbeat
    sample :loop_breakbeat, beat_stretch: 2
    sleep 2
  end
  6.times do
    drum_808
  end
end