require 'colorize'

DIATONIC_MAJOR = ['I', 'ii', 'iii', 'IV', 'V', 'vi', 'viiº']

DIATONIC_MINOR = ['i', 'iiº', 'III', 'iv', 'v', 'VI', 'VII']

COLORS = [
 :red,
 :light_red,
 :green,
 :light_green,
 :yellow,
 :light_yellow,
 :blue,
 :light_blue,
 :magenta,
 :light_magenta,
 :cyan,
 :light_cyan,
 :white,
 :light_white,
 :default]

class Generator

  def initialize
    puts 'tempo in bpm?'
    tempo = gets.chomp
    puts 'maj or min?'
    input = gets.chomp
    if input == 'maj'
      puts 'How many chords?'
      progression = RandomMajorProgression.new(gets.chomp.to_i, tempo)
      progression.generate
      progression.to_s
    elsif input == 'min'
      puts 'How many chords?'
      progression = RandomMinorProgression.new(gets.chomp.to_i, tempo)
      progression.generate
      progression.to_s
    end
  end
end


class RandomMajorProgression

  def initialize(number, tempo)
    @triads = DIATONIC_MAJOR
    @number = number
    @tempo = tempo.to_i
  end

  def generate
    @progression = []
    @number.times do
      @progression << @triads.shuffle.first.dup
    end
    @progression
  end

  def to_s
    @progression.each do |chord|
      print "#{chord} ".colorize(COLORS.sample)
      sleep 60 * 4.0 / @tempo
      #system("clear")
    end
  end

end

class RandomMinorProgression < RandomMajorProgression

  def initialize(number, tempo)
    @triads = DIATONIC_MINOR
    super(number, tempo)
  end

end

x = Generator.new
