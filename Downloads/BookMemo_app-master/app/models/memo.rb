class Memo < ApplicationRecord
  validates :bookname, presence: true
  validates :bookname, length: { maximum: 50 }
  validate :validate_name_not_including_commma
  before_validation :set_nameless_name  
  has_one_attached :image
  belongs_to :user    
    
  private    
    
  def validate_name_not_including_commma
    errors.add(:bookname, 'にカンマを含めることはできません') if bookname&.include?(',')  
  end
  
  def set_nameless_name
    self.bookname = '名前なし' if bookname.blank?  
  end
    
end
