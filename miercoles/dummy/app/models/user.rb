class User < ActiveRecord::Base

  def self.authenticate(email, password)
    # si el email y el password corresponden a un usuario valido, regresa el usuario
    # de otra manera regresa nil

    #p "entra a self**"  
    if user = User.find_by(email: email, password: password)
      #p "usuario seleccionado"
      user
    else
      nil
    end
  
  end
end
