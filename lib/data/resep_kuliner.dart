import '../models/resep_model.dart';

List<Recipe> dummyRecipes = [
  Recipe(
    id: '1',
    title: 'Rendang Sapi',
    origin: 'Padang, Sumatera Barat',
    duration: 180,
    portion: 5,
    imageUrl: 'assets/images/Rendang_Sapi.jpe',
    ingredients: [
      '1 kg daging sapi',
      '1000 ml santan kental',
      '2 lembar daun kunyit',
      '4 lembar daun jeruk',
      'Bumbu halus (bawang merah, bawang putih, cabai, jahe, lengkuas)'
    ],
    steps: [
      'Potong daging sapi sesuai selera.',
      'Tumis bumbu halus hingga harum, masukkan santan dan daun-daun.',
      'Masukan daging, masak dengan api kecil sambil terus diaduk hingga santan mengering dan berminyak.'
    ],
  ),
  Recipe(
    id: '2',
    title: 'Soto Ayam Lamongan',
    origin: 'Lamongan, Jawa Timur',
    duration: 60,
    portion: 4,
    imageUrl: 'assets/images/Soto_Ayam_Lamongan.jpe',
    ingredients: [
      '1/2 ekor ayam',
      '2 liter air',
      'Bihun, tauge, dan telur rebus',
      'Bumbu halus (kunyit, kemiri, bawang merah, bawang putih)',
      'Koya krupuk udang'
    ],
    steps: [
      'Rebus ayam hingga empuk, tiriskan lalu suwir-suwir.',
      'Tumis bumbu halus, masukkan ke dalam kuah rebusan ayam.',
      'Sajikan kuah soto bersama suwiran ayam, bihun, tauge, dan bubuk koya.'
    ],
  ),
  Recipe(
    id: '3',
    title: 'Nasi Goreng Kampung',
    origin: 'Jawa',
    duration: 20,
    portion: 2,
    imageUrl: 'assets/images/Nasi_Goreng.jpe',
    ingredients: [
      '2 piring nasi dingin',
      '2 butir telur',
      '3 siung bawang merah & 2 siung bawang putih',
      'Cabai rawit sesuai selera',
      'Kecap manis, garam, dan penyedap rasa'
    ],
    steps: [
      'Orak-arik telur di wajan, sisihkan.',
      'Tumis bawang merah, bawang putih, dan cabai halus hingga harum.',
      'Masukkan nasi dan telur orak-arik, tambahkan kecap dan garam. Aduk hingga merata dan matang.'
    ],
  ),
];