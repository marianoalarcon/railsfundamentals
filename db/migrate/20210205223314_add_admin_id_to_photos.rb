class AddAdminIdToPhotos < ActiveRecord::Migration[6.1]
  def change
    add_reference :photos, :admin, null: false, foreign_key: true, default: 1
    # En mi opinion usar ese default 1 seria un error pues si se necesita generar las migraciones,
    #al generarlas siempre daran en este caso que todos las fotos pertenezcan al admin 1. 
  end
end
