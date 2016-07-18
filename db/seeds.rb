Image.delete_all
Product.delete_all

def create_images prefix, amount
  images = []
  amount.times do |number|
    main = number == 0
    path = "https://s3-sa-east-1.amazonaws.com/db-store-image-bucket/#{prefix}/#{number + 1}.png"
    images << Image.new(path: path, main: main)
  end
  images
end

Product.create(
    name: '7 Esferas Do Dragão',
    small_description: '7 esferças enumeradas de acrilico um caixa original BANDAI',
    price: 139.90, discount: 20,
    star: 5,
    images: create_images('7-esferas-do-dragao', 7)
)
Product.create(
    name: 'Luminária Abajur + Boneco Goku',
    small_description: 'Impressionante Luminária Dragon Ball com o Goku fazendo a Genki Dama. Peça toda artesanal. Feita cuidando dos mínimos detalhes',
    price: 360,
    star: 4,
    images: create_images('luminaria-abajur-boneco-goku', 6))
Product.create(
    name: 'Chaveiro Dragon Ball Z',
    small_description: 'Chaveiros do anime Dragon Ball Z/GT/Super/Heroes',
    price: 19.90,
    discount: 10,
    star: 2,
    images: create_images('chaveiro-dragon-ball-z', 2)
)
