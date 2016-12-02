# blues_shuffle.rb
# My 1st attempt at the blues shuffle progression
# revisions 1/12/2016 11:33AM
#   -remove global loop counter
#   -add alias to assign progression
#   -add some fx to the main loop
#
# Bruce Wernick
# 1 December 2016

# Scale notes and intervals ------------------------
# Intervals    0  1  2  3  4  5  6  7  8  9 10 11 12
# Major        1  .  2  .  3  4  .  5  .  6  .  7  1
# Min Pent     1  .  . b3  .  4  .  5  .  . b7  .  1
# 1,4,5        o  .  .  .  .  o  .  o  .  .  .  .  .
# 1,5,6,b7     o  .  .  .  .  .  .  o  .  o  o  .  .
# --------------------------------------------------

def beat1(r, n)
  # shuffle beat
  t1,t2,a1,a2 = 0.45,0.25,0.4,0.5
  play r,amp: a1; play r+n; sleep t1
  play r,amp: a2; play r+n; sleep t2
end

def shuf1(n)
  # 1 bar: root with 5, 6 and b7
  beat1(n, 7)
  beat1(n, 9)
  beat1(n, 10)
  beat1(n, 9)
end

def shuf2(n)
  # 1 bar: root with 5, 6 and b7
  beat1(n, 7)
  beat1(n, 9)
  beat1(n, 10)
  beat1(n, 10)
end

def shuf3(n)
  # 1 bar: root with 5 and b7
  beat1(n, 7)
  beat1(n, 10)
  beat1(n, 7)
  beat1(n, 10)
end

def blues8(r, v)
  # 8 bar blues progression
  # 1 1 4 1
  # 5 4 1 5
  #
  r1 = r   # root
  r4 = r+5 # fourth
  r5 = r+7 # fifth
  puts "*"*32
  shuf1(r1); shuf1(r1); shuf1(r4); shuf1(r1);
  shuf1(r5); shuf1(r4); shuf1(r1)
  # alternate last bar between shuf3 and shuf4
  if v % 2
    shuf2(r5)
  else
    shuf3(r5)
  end
end

def blues12_trad(r, *v)
  # 12 bar blues progression
  # 1 1 1 1
  # 4 4 1 1
  # 5 4 1 1
  r1 = r   # root
  r4 = r+5 # fourth
  r5 = r+7 # fifth
  puts "*"*32
  shuf1(r1); shuf1(r1); shuf1(r1); shuf1(r1);
  shuf1(r4); shuf1(r4); shuf1(r1); shuf1(r1);
  shuf1(r5); shuf1(r4); shuf1(r1); shuf1(r1);
end

def blues12(r, *v)
  # 12 bar blues progression
  # 1 1 4 4
  # 1 1 5 4
  # 1 5 4 5
  r1 = r   # root
  r4 = r+5 # fourth
  r5 = r+7 # fifth
  puts "*"*32
  shuf1(r1); shuf1(r1); shuf1(r4); shuf1(r4);
  shuf1(r1); shuf1(r1); shuf1(r5); shuf1(r4);
  shuf1(r1); shuf1(r5); shuf1(r4); shuf1(r5);
end

def blues12_quick(r, *v)
  # so called quick change progression
  # 1 4 1 1
  # 4 4 1 1
  # 5 4 1 1
  r1 = r   # root
  r4 = r+5 # fourth
  r5 = r+7 # fifth
  puts "*"*32
  shuf1(r1); shuf1(r4); shuf1(r1); shuf1(r1);
  shuf1(r4); shuf1(r4); shuf1(r1); shuf1(r1);
  shuf1(r5); shuf1(r4); shuf1(r1); shuf1(r1);
end


# --------------------------------------------------
# set alias p to progression you want to play.
alias p blues8 # blues8, blues12_trad, blues12, blues12_quick

use_synth :pluck
r = :G2 # root note
v = 0 # loop counter
with_fx :reverb, room: 1 do
  live_loop :moblues do
    p(r, v)
    v+=1
  end
end

