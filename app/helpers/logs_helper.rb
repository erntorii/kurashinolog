module LogsHelper
  # 表示用のリサイズ済み画像を返す
  def resize(image)
    image.variant(gravity: :center, resize: '1024x576^', crop: '1024x576+0+0').processed
  end
end
