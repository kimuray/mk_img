require 'mini_magick'

class MkImg
  attr_accessor :image

  def initialize
    @image = MiniMagick::Image.open('./background.png')
  end

  def insert_text
    image.combine_options do |c|
      c.gravity 'north'
      c.draw "text 300,300 '田中太郎'"
    end
  end

  def output
    font = './fonts/Jiyucho.otf'
    image.combine_options do |c|
      c.gravity 'north'
      c.draw "text 0,0 '田中太郎'"
      c.font font
    end
    image.write('./convert_image.png')
  end
end


image = MkImg.new
image.output
