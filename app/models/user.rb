class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  self.table_name = :admins

  def admin?
    role == 'admin'
  end

  def chef_cookie?
    role == 'chef'
  end
end
