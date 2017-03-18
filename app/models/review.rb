class Review < ActiveRecord::Base
  # 名前は必須入力かつ20文字以内
  validates :name , length: { maximum: 20 } , presence: true
  # タイトルは必須入力かつ20文字以内
  validates :title , length: { maximum: 20 } , presence: true
  # マンガ名は必須入力かつ20文字以内
  validates :comic_name , length: { maximum: 20 } , presence: true
  # 口コミは必須入力かつ2文字以上500文字以下
  validates :body , length: { minimum: 2, maximum: 500 } , presence: true
end
