// Dữ liệu cố định. Không cần API hoặc đọc JSON.
class Destination {
  final int id, price;
  final String name, location, category, imageAsset, description;
  final double rating;
  final List<String> galleryAssets;
  const Destination({
    required this.id,
    required this.name,
    required this.location,
    required this.category,
    required this.price,
    required this.rating,
    required this.imageAsset,
    required this.description,
    required this.galleryAssets,
  });
}

const sampleDestinations = <Destination>[
  Destination(
    id: 1,
    name: 'Vịnh Hạ Long',
    location: 'Quảng Ninh',
    category: 'beach',
    price: 1290000,
    rating: 4.8,
    imageAsset: 'assets/ha_long.png',
    galleryAssets: ['assets/ha_long.png', 'assets/ha_long_detail.png'],
    description: 'Du ngoạn trên vịnh và ngắm cảnh từ boong tàu.',
  ),
  Destination(
    id: 2,
    name: 'Đà Lạt',
    location: 'Lâm Đồng',
    category: 'mountain',
    price: 890000,
    rating: 4.8,
    imageAsset: 'assets/da_lat.png',
    galleryAssets: ['assets/da_lat.png', 'assets/da_lat_detail.png'],
    description: 'Dạo quanh hồ và khám phá những con đường xanh.',
  ),
  Destination(
    id: 3,
    name: 'Phố cổ Hội An',
    location: 'Quảng Nam',
    category: 'city',
    price: 750000,
    rating: 4.9,
    imageAsset: 'assets/hoi_an.png',
    galleryAssets: ['assets/hoi_an.png', 'assets/hoi_an_detail.png'],
    description: 'Đi bộ trong phố cổ và trải nghiệm không gian đèn lồng.',
  ),
  Destination(
    id: 4,
    name: 'Đà Nẵng',
    location: 'Đà Nẵng',
    category: 'city',
    price: 990000,
    rating: 4.7,
    imageAsset: 'assets/da_nang.png',
    galleryAssets: ['assets/da_nang.png', 'assets/da_nang_detail.png'],
    description: 'Khám phá thành phố, các cây cầu và không gian ven biển.',
  ),
  Destination(
    id: 5,
    name: 'Nha Trang',
    location: 'Khánh Hòa',
    category: 'beach',
    price: 1190000,
    rating: 4.6,
    imageAsset: 'assets/nha_trang.png',
    galleryAssets: ['assets/nha_trang.png', 'assets/nha_trang_detail.png'],
    description: 'Thư giãn bên biển và tận hưởng một ngày đổi gió.',
  ),
  Destination(
    id: 6,
    name: 'Sa Pa',
    location: 'Lào Cai',
    category: 'mountain',
    price: 1390000,
    rating: 4.8,
    imageAsset: 'assets/sa_pa.png',
    galleryAssets: ['assets/sa_pa.png', 'assets/sa_pa_detail.png'],
    description: 'Ngắm núi và tìm hiểu cảnh quan vùng cao.',
  ),
];
const categoryNames = {
  'beach': 'Biển',
  'mountain': 'Núi',
  'city': 'Thành phố',
  'camp': 'Cắm trại',
};
