class Bid < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  validates :price, :due_to, :qtd, :url, :user, :product, :presence => true

 #Salvar as faixas com seus valores iniciais e finais
 #Quando o usuário digitar o preço e submeter a oferta, recuperar as faixas e verificar qual faixa compreende o preço ofertado.
 #Selecionada a faixa, buscar os wishes com os preços compreendidos nessa faixa

  def price_range
    [(price * 0.9).to_i, (price * 1.1).to_i]
  end

end
