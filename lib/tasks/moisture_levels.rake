namespace :db do
  desc "adds URLs to Plants"

task :add_images => :environment do
  levels = {
  1=> 3,
  2=> 10,
  3=> 2,
  4=> 3,
  5=> 4,
  6=> 3,
  7=> 2,
  8=> 1,
  9=> 5,
  10=> 3,
  11=> 4,
  12=> 3,
  13=> 3,
  14=> 5,
  15=> 2,
  16=> 7,
  17=> 3,
  18=> 5,
  19=> 5,
  20=> 4,
  21=> 2,
  22=> 4,
  23=> 3,
  24=> 1,
  25=> 1,
  26=> 3,
  27=> 3,
  28=> 10,
  29=> 6,
  30=> 14,
  31=> 3,
  32=> 4,
  33=> 4,
  34=> 10,
  35=> 4,
  36=> 3,
  37=> 4,
  38=> 7,
  39=> 7,
  40=> 5,
  41=> 6,
  42=> 5,
  43=> 3,
  44=> 4,
  45=> 5,
  46=> 6,
  47=> 7,
  48=> 25,
  49=> 7,
  50=> 25,
  51=> 25,
  52=> 25,
  53=> 4,
  54=>,
  55=>,
  56=>,
  57=>,
  58=>,
  59=>,
  60=>,
  61=>,
  62=>,
  63=>,
  64=>,
  65=>,
  66=>,
  67=>,
  68=>,
  69=>,
  70=>,
  71=>,
  72=>,
  73=>,
  74=>,
  75=>,
  76=>,
  77=>,
  78=>,
  79=>,
  80=>,
  81=>,
  82=>,
  83=>,
  84=>,
  85=>,
  86=>,
  87=>,
  88=>,
  89=>,
  90=>,
  91=>,
  92=>,
  93=>,
  94=>,
  95=>,
  96=>,
  97=>,
  98=>,
  99=>,
  100=>,
  101=>,
  102=>,
  103=>,
  104=>,
  105=>,
  106=>
  };

  @plants = Plant.all;

    @plants.each_with_index do |plant|


  Plant.where(id: "#{plant.id}" ).update_all(moisture: levels[plant[:id]])

  end

end

end
