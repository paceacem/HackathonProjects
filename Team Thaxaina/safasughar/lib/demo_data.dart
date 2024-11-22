import 'package:latlong2/latlong.dart';
import 'package:safasughar/features/guideline_v2/models/guideline_model.dart';
import 'package:safasughar/features/recycle/models/product_model.dart';
import 'package:safasughar/features/report/models/report_model.dart';
import 'package:safasughar/features/shared/models/location_model.dart';

const disposalLocations = [
  Location(
    title: 'Advanced College of Engineering and Management',
    address: 'Balkhu, Kathmandu',
    point: LatLng(27.6887045, 85.2485811),
    fill: 0.2,
    imgUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcROE9rjUr0GsPkOlcuqkBXWK6YKyAWWZnA2sSpWHCvnCiU602pYDX9y7VfAi-k3VktPtb4&usqp=CAU',
  ),
  Location(
    title: 'Teku Transfer Station',
    address: 'Teku, Kathmandu',
    point: LatLng(27.6933211, 85.3014457),
    fill: 0.2,
    imgUrl:
        'https://www.shutterstock.com/image-photo/recycled-materials-garbage-collection-point-260nw-2079228235.jpg',
  ),
  Location(
    title: 'Sisdol Landfill Site',
    address: 'Sisdol, Nuwakot',
    point: LatLng(27.7667, 85.2333),
    fill: 0.6,
    imgUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9LstnPVqzteQtMn-7ICviN3GM29HSlCgqXVqCiOD8AK82syJKOdwAlLEj5Nzd-I89H2c&usqp=CAU',
  ),
  Location(
    title: 'Balkumari Waste Collection Point',
    address: 'Balkumari, Lalitpur',
    point: LatLng(27.6710, 85.3420),
    fill: 0.2,
    imgUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTr60j-TCoPWrKuNW_7HEklr9wHO5Q9Dxh0fbzflI_1VMfllhtJgQLvZf7Okdu_I8jYsjE&usqp=CAU',
  ),
  Location(
    title: 'Baneshwor Waste Collection Point',
    address: 'Old Baneshwor, Kathmandu',
    point: LatLng(27.6930, 85.3340),
    fill: 1.0,
    imgUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrbzzZx-WKun95OmvFNzMwh4-FOM0-2m5b6iHGQ8feI_lRwYrEJtr_Ta8qsjGpUA5gh_I&usqp=CAU',
  ),
  Location(
    title: 'Gongabu Waste Collection Point',
    address: 'Gongabu, Kathmandu',
    point: LatLng(27.7340, 85.3160),
    fill: 0.8,
    imgUrl:
        'https://i.tribune.com.pk/media/images/1167211-Garbagestorycopy-1471798930/1167211-Garbagestorycopy-1471798930.jpg',
  ),
  Location(
    title: 'Kalanki Waste Collection Point',
    address: 'Kalanki, Kathmandu',
    point: LatLng(27.6935, 85.2840),
    fill: 0.5,
    imgUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWHwcHwTK8uNl9ncK4u4-So9-qOdflNwWJwA&s',
  ),
  Location(
    title: 'Koteshwor Waste Collection Point',
    address: 'Koteshwor, Kathmandu',
    point: LatLng(27.6780, 85.3450),
    fill: 0.3,
    imgUrl:
        'https://5.imimg.com/data5/SELLER/Default/2022/8/XS/NS/QV/130511563/garbage-pick-up-service-500x500.jpg',
  ),
  Location(
    title: 'Maharajgunj Waste Collection Point',
    address: 'Maharajgunj, Kathmandu',
    point: LatLng(27.7390, 85.3330),
    fill: 0.4,
    imgUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRl4_BkgEo0B7fVeGyWGNWsIW7Qf3i5K1rK8g&s',
  ),
  Location(
    title: 'Chabahil Waste Collection Point',
    address: 'Chabahil, Kathmandu',
    point: LatLng(27.7170, 85.3440),
    fill: 0.7,
    imgUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6doPdOR6N0DoNVR-SIRW9SCN2yf-ffMCjUg&s',
  ),
  Location(
    title: 'Kalimati Waste Collection Point',
    address: 'Kalimati, Kathmandu',
    point: LatLng(27.6930, 85.2970),
    fill: 0.6,
    imgUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8EgslxUcS9q-Mc-TeGOyqDDWVnDG5EGf5oEj2HZHM6YhR7zei3f2yKLl8jnK2yHqllDM&usqp=CAU',
  ),
  Location(
    title: 'Pulchowk Waste Collection Point',
    address: 'Pulchowk, Lalitpur',
    point: LatLng(27.6760, 85.3180),
    fill: 0.5,
    imgUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRAOWlnhQ--B6codxbSNiVqKEZsNhbJsJ5BEtwwNufEm-lyAe85lSq1D-rtXOTTqUkSyY&usqp=CAU',
  ),
  Location(
    title: 'Jawalakhel Waste Collection Point',
    address: 'Jawalakhel, Lalitpur',
    point: LatLng(27.6730, 85.3140),
    fill: 0.4,
    imgUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCJO8RrMiSqbBoShZ6F3E7xqHcKo46G-IlxQ&s',
  ),
  Location(
    title: 'Kirtipur Waste Collection Point',
    address: 'Kirtipur, Kathmandu',
    point: LatLng(27.6670, 85.2770),
    fill: 0.3,
    imgUrl:
        'https://www.shutterstock.com/image-photo/plastic-materials-garbage-collection-point-260nw-2212768211.jpg',
  ),
  Location(
    title: 'Bhaktapur Waste Collection Point',
    address: 'Bhaktapur, Bhaktapur',
    point: LatLng(27.6720, 85.4290),
    fill: 0.2,
    imgUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPNmqRhmBUOicu8pR7guAqkAW_e6pkcMv1VQ&s',
  ),
  Location(
    title: 'Thimi Waste Collection Point',
    address: 'Thimi, Bhaktapur',
    point: LatLng(27.6920, 85.3840),
    fill: 0.1,
    imgUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_WERzytjC9QpqAHMtr6vURTI8nb3uj0Hitg&s',
  ),
  Location(
    title: 'Sankhamul Waste Collection Point',
    address: 'Sankhamul, Kathmandu',
    point: LatLng(27.6840, 85.3290),
    fill: 0.3,
    imgUrl:
        'https://www.shutterstock.com/image-photo/plastic-trash-cans-baskets-full-260nw-2519139779.jpg',
  ),
  Location(
    title: 'Balaju Waste Collection Point',
    address: 'Balaju, Kathmandu',
    point: LatLng(27.7340, 85.3060),
    fill: 0.4,
    imgUrl:
        'https://upload.wikimedia.org/wikipedia/commons/1/19/Waste_collection_vehicle-Thai.JPG',
  ),
  Location(
    title: 'Sundhara Waste Collection Point',
    address: 'Sundhara, Kathmandu',
    point: LatLng(27.7040, 85.3080),
    fill: 0.5,
    imgUrl:
        'https://www.shutterstock.com/image-photo/bursa-turkey-june-5-2024-260nw-2472417553.jpg',
  ),
  Location(
    title: 'Lagankhel Waste Collection Point',
    address: 'Lagankhel, Lalitpur',
    point: LatLng(27.6670, 85.3230),
    fill: 0.6,
    imgUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQyHIhA50AMVHegjJ9_VpLJyg5Cz-qpJhE3lg&s',
  ),
  Location(
    title: 'Satdobato Waste Collection Point',
    address: 'Satdobato, Lalitpur',
    point: LatLng(27.6580, 85.3240),
    fill: 0.7,
    imgUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxgX72SvBi6mILdsT8nqLzb8cQOQiBVDSrrw&s',
  ),
];

final recycleProducts = [
  Product(
    name: 'Nike Air Force 1 Retro',
    price: 27.0,
    imageUrl:
        'https://thepremierstore.com/cdn/shop/products/8-23-22-Nike-Air-Force-1-Retro-White-Brown-1.jpg?v=1661977905',
    description:
        'A scorching edition to your af1 collection, this head-turning take on the hoops brings a whole new level of style and comfort. The design features a sleek silhouette with a modern twist, making it a must-have for sneaker enthusiasts.',
    category: 'Shoes',
    qualityRating: 4.6,
    purchasedDate: DateTime(2019, 3, 12),
    location: 'Balkhu',
    sellerContact: '9841828327',
  ),
  Product(
    name: 'Cardboard Shipping Box',
    price: 2.5,
    imageUrl:
        'https://img.drz.lazcdn.com/static/np/p/0e52a7f9bd3e60449879fd4d34e2a32e.jpg_960x960q80.jpg_.webp',
    description:
        'A sturdy cardboard box, ideal for shipping, moving, or storage. Made from recycled paper materials and fully recyclable after use.',
    category: 'Recyclable Materials',
    qualityRating: 4.7,
    purchasedDate: DateTime(2023, 12, 5),
    location: 'Chabahil',
    sellerContact: '9812345678',
  ),
  Product(
    name: 'Apple iPhone 14 Pro Max',
    price: 1599.0,
    imageUrl:
        'https://www.notebookcheck.biz/uploads/tx_nbc2/AppleiPhone14Pro__1__01.JPG',
    description:
        'The iPhone 14 Pro Max is the ultimate smartphone with the A16 Bionic chip, a stunning 48MP camera system, and a sleek design. Perfect for photography enthusiasts and tech lovers.',
    category: 'Electronics',
    qualityRating: 4.9,
    purchasedDate: DateTime(2023, 1, 25),
    location: 'Dillibazar',
    sellerContact: '9803124567',
  ),
  Product(
    name: 'Eco-Friendly Cloth Bag',
    price: 3.5,
    imageUrl:
        'https://5.imimg.com/data5/CW/TD/MY-5224180/eco-friendly-cloth-bag.jpg',
    description:
        'A reusable cloth bag made from recycled textiles. Perfect for groceries, books, and everyday needs, promoting a plastic-free lifestyle.',
    category: 'Accessories',
    qualityRating: 4.3,
    purchasedDate: DateTime(2024, 6, 15),
    location: 'Lalitpur',
    sellerContact: '9803456789',
  ),
  Product(
    name: 'Adidas Ultraboost 22',
    price: 180.0,
    imageUrl:
        'https://assets.adidas.com/images/w_1880,f_auto,q_auto/123717a32016417f9044ada9001b57e2_9366/GX5591_01_standard.jpg',
    description:
        'Experience unparalleled comfort and energy return with the Adidas Ultraboost 22. Ideal for runners and casual wear, this shoe combines performance and style seamlessly.',
    category: 'Shoes',
    qualityRating: 4.8,
    purchasedDate: DateTime(2021, 8, 15),
    location: 'Pulchowk',
    sellerContact: '9811122233',
  ),
  Product(
    name: 'Sony WH-1000XM4 Wireless Headphones',
    price: 349.0,
    imageUrl:
        'https://i.rtings.com/assets/products/nggZcsC3/sony-wh-1000xm4-wireless/design-medium.jpg?format=auto',
    description:
        'Industry-leading noise cancellation, exceptional sound quality, and up to 30 hours of battery life make these headphones the perfect travel companion.',
    category: 'Accessories',
    qualityRating: 4.7,
    purchasedDate: DateTime(2020, 11, 5),
    location: 'Lazimpat',
    sellerContact: '9849090909',
  ),
  Product(
    name: 'Recycled Aluminum Can',
    price: 0.5,
    imageUrl:
        'https://media.licdn.com/dms/image/D4D12AQGfcSTm5PTptQ/article-cover_image-shrink_720_1280/0/1661862672004?e=2147483647&v=beta&t=UGW7tWtVyHgPmKsoBr0ltTkynu9lGJA5gPaNpalfzII',
    description:
        'A lightweight and recyclable aluminum can, perfect for packaging beverages. Made with 95% recycled aluminum, reducing carbon footprint.',
    category: 'Recyclable Materials',
    qualityRating: 4.4,
    purchasedDate: DateTime(2024, 4, 10),
    location: 'Sundhara',
    sellerContact: '9865432109',
  ),
  Product(
    name: 'Organic Compost Bin',
    price: 25.0,
    imageUrl:
        'https://5.imimg.com/data5/SELLER/Default/2021/9/TB/XN/UU/3086061/organic-waste-compost-bin.jpg',
    description:
        'A compact compost bin designed for collecting organic waste like food scraps and yard clippings. Made from recycled plastics, ideal for sustainable waste management.',
    category: 'Home & Garden',
    qualityRating: 4.9,
    purchasedDate: DateTime(2024, 5, 5),
    location: 'Kupondole',
    sellerContact: '9811987654',
  ),
];

final wasteManagementGuidelines = [
  const Guideline(
    title: 'Learn Local Waste Policies',
    shortDescription:
        'Familiarize yourself with your city’s waste management policies and follow the rules for waste segregation and collection.',
    longDescription:
        "1. Check the official website of your city or local government for guidelines on waste segregation, collection schedules, and disposal methods.\n\n2. Reach out to the waste management department of your municipality to get the latest policies and practices.\n\n3. Look for downloadable resources, pamphlets, or announcements about waste management rules provided by your local authorities.\n\n4. Participate in workshops or awareness campaigns organized by local organizations or government bodies to learn about new initiatives.\n\n5. Find out the locations of waste collection bins, recycling centers, and hazardous waste drop-off points, along with their operational schedules.\n\n6. Familiarize yourself with penalties for improper waste disposal, illegal dumping, or not following segregation rules.\n\n7. Subscribe to local government or waste management authorities' social media channels for updates on waste policies or events.\n\n8. Join local community or residents' groups to share and gain knowledge about best practices and updates on waste policies.\n\n9. Waste policies can change over time; regularly review updates to ensure compliance and participation in new initiatives.",
    imgUrls: [
      'https://www.undp.org/sites/g/files/zskgke326/files/2023-05/UNDP-Jordan-2019-women-recycling-1304_2.jpg',
      'https://www.afrik21.africa/wp-content/uploads/2020/12/shutterstock_1876918771-1.jpg',
      'https://media.licdn.com/dms/image/C5612AQF0mPeqAtVf-Q/article-cover_image-shrink_600_2000/0/1520134464594?e=2147483647&v=beta&t=puwpYTN8RmnUgnhmE5yv6A_kLyVzqtYYW6fVkmYqvUo',
      'https://i.pinimg.com/736x/c6/bb/dd/c6bbdd656ab02c71367a2759017b5387.jpg',
      'https://live-production.wcms.abc-cdn.net.au/1ae66c6a24eb7e5329797d5e72f16796?impolicy=wcms_crop_resize&cropH=2001&cropW=3000&xPos=0&yPos=0&width=862&height=575'
    ],
  ),
  const Guideline(
    title: 'Segregate Waste at Source',
    shortDescription:
        'Separate waste into biodegradable, non-biodegradable, and hazardous categories for efficient disposal and recycling.',
    longDescription:
        "1. Set up separate bins for biodegradable, non-biodegradable, and hazardous waste in your home or workplace.\n\n"
        "2. Educate family members or colleagues about the importance of waste segregation.\n\n"
        "3. Identify which materials can be composted, such as food scraps and garden waste.\n\n"
        "4. Separate recyclable items like paper, plastics, and glass, and store them in a designated area.\n\n"
        "5. Ensure hazardous items like batteries, chemicals, or medical waste are kept away from general waste.\n\n"
        "6. Work with your community to implement segregation practices in shared spaces like offices, schools, or apartment buildings.\n\n"
        "7. Regularly monitor and adjust your segregation system based on waste disposal updates from local authorities.",
    imgUrls: [
      'https://www.afrik21.africa/wp-content/uploads/2020/12/shutterstock_1876918771-1.jpg',
      'https://www.undp.org/sites/g/files/zskgke326/files/2023-05/UNDP-Jordan-2019-women-recycling-1304_2.jpg',
      'https://media.licdn.com/dms/image/C5612AQF0mPeqAtVf-Q/article-cover_image-shrink_600_2000/0/1520134464594?e=2147483647&v=beta&t=puwpYTN8RmnUgnhmE5yv6A_kLyVzqtYYW6fVkmYqvUo',
      'https://i.pinimg.com/736x/c6/bb/dd/c6bbdd656ab02c71367a2759017b5387.jpg',
      'https://live-production.wcms.abc-cdn.net.au/1ae66c6a24eb7e5329797d5e72f16796?impolicy=wcms_crop_resize&cropH=2001&cropW=3000&xPos=0&yPos=0&width=862&height=575'
    ],
  ),
  const Guideline(
    title: 'Compost Organic Waste',
    shortDescription:
        'Use kitchen waste like vegetable peels and food scraps to create compost, reducing landfill waste while enriching soil.',
    longDescription:
        "1. Set up a compost bin in your backyard, garden, or balcony.\n\n"
        "2. Add biodegradable waste like vegetable peels, fruit scraps, eggshells, and coffee grounds to the compost bin.\n\n"
        "3. Avoid adding items like meat, dairy, or oily foods to prevent pests.\n\n"
        "4. Layer your compost with dry materials like leaves or shredded paper for proper aeration.\n\n"
        "5. Turn the compost pile regularly to ensure proper decomposition and airflow.\n\n"
        "6. Use the compost in your garden or potted plants to enhance soil quality and promote healthy growth.\n\n"
        "7. Share composting tips with neighbors or join local composting workshops to refine your skills.",
    imgUrls: [
      'https://media.licdn.com/dms/image/C5612AQF0mPeqAtVf-Q/article-cover_image-shrink_600_2000/0/1520134464594?e=2147483647&v=beta&t=puwpYTN8RmnUgnhmE5yv6A_kLyVzqtYYW6fVkmYqvUo',
      'https://www.undp.org/sites/g/files/zskgke326/files/2023-05/UNDP-Jordan-2019-women-recycling-1304_2.jpg',
      'https://www.afrik21.africa/wp-content/uploads/2020/12/shutterstock_1876918771-1.jpg',
      'https://i.pinimg.com/736x/c6/bb/dd/c6bbdd656ab02c71367a2759017b5387.jpg',
      'https://live-production.wcms.abc-cdn.net.au/1ae66c6a24eb7e5329797d5e72f16796?impolicy=wcms_crop_resize&cropH=2001&cropW=3000&xPos=0&yPos=0&width=862&height=575'
    ],
  ),
  const Guideline(
    title: 'Recycle Non-Biodegradables',
    shortDescription:
        'Collect recyclable materials like paper, plastics, and metals and take them to nearby recycling centers.',
    longDescription:
        "1. Identify items in your household or office that can be recycled, such as paper, plastic bottles, aluminum cans, and cardboard.\n\n"
        "2. Clean and dry recyclables before storing them to prevent contamination.\n\n"
        "3. Sort recyclable materials into different categories for easier disposal at recycling centers.\n\n"
        "4. Research local recycling centers or collection points in your area.\n\n"
        "5. Consider participating in local recycling programs or drop-off drives organized by your community.\n\n"
        "6. Reuse items like glass jars or sturdy plastic containers instead of discarding them.\n\n"
        "7. Stay informed about changes in recycling rules or policies in your area to ensure compliance.",
    imgUrls: [
      'https://i.pinimg.com/736x/c6/bb/dd/c6bbdd656ab02c71367a2759017b5387.jpg',
      'https://www.undp.org/sites/g/files/zskgke326/files/2023-05/UNDP-Jordan-2019-women-recycling-1304_2.jpg',
      'https://www.afrik21.africa/wp-content/uploads/2020/12/shutterstock_1876918771-1.jpg',
      'https://media.licdn.com/dms/image/C5612AQF0mPeqAtVf-Q/article-cover_image-shrink_600_2000/0/1520134464594?e=2147483647&v=beta&t=puwpYTN8RmnUgnhmE5yv6A_kLyVzqtYYW6fVkmYqvUo',
      'https://live-production.wcms.abc-cdn.net.au/1ae66c6a24eb7e5329797d5e72f16796?impolicy=wcms_crop_resize&cropH=2001&cropW=3000&xPos=0&yPos=0&width=862&height=575'
    ],
  ),
  const Guideline(
    title: 'Proper Disposal of Hazardous Waste',
    shortDescription:
        'Safely dispose of hazardous materials such as batteries, chemicals, and e-waste at authorized collection points.',
    longDescription:
        "1. Identify hazardous items in your home or office, including old batteries, paints, cleaning chemicals, and electronic waste.\n\n"
        "2. Store hazardous waste in a secure location to prevent leaks or accidental exposure.\n\n"
        "3. Check with your local municipality for drop-off points or collection drives for hazardous materials.\n\n"
        "4. Never mix hazardous waste with general or recyclable waste.\n\n"
        "5. Follow instructions on product labels for proper disposal of chemicals or other hazardous materials.\n\n"
        "6. Look for e-waste recycling programs to safely dispose of old electronics like phones, computers, and appliances.\n\n"
        "7. Educate your household members about the dangers of improper disposal of hazardous materials.",
    imgUrls: [
      'https://live-production.wcms.abc-cdn.net.au/1ae66c6a24eb7e5329797d5e72f16796?impolicy=wcms_crop_resize&cropH=2001&cropW=3000&xPos=0&yPos=0&width=862&height=575'
          'https://www.undp.org/sites/g/files/zskgke326/files/2023-05/UNDP-Jordan-2019-women-recycling-1304_2.jpg',
      'https://www.afrik21.africa/wp-content/uploads/2020/12/shutterstock_1876918771-1.jpg',
      'https://media.licdn.com/dms/image/C5612AQF0mPeqAtVf-Q/article-cover_image-shrink_600_2000/0/1520134464594?e=2147483647&v=beta&t=puwpYTN8RmnUgnhmE5yv6A_kLyVzqtYYW6fVkmYqvUo',
      'https://i.pinimg.com/736x/c6/bb/dd/c6bbdd656ab02c71367a2759017b5387.jpg',
    ],
  ),
  const Guideline(
    title: 'Report Waste Issues',
    shortDescription:
        'Use the app to report uncollected garbage, overflowing bins, or illegal dumping to authorities for prompt action.',
    longDescription:
        "1. Open the app and navigate to the 'Report an Issue' section.\n\n"
        "2. Take a photo or video of the waste issue you want to report, such as an overflowing bin or illegal dumping site.\n\n"
        "3. Add a brief description of the issue, including location details.\n\n"
        "4. Use the app’s map to pinpoint the exact location of the problem.\n\n"
        "5. Submit the report, ensuring all necessary details are included.\n\n"
        "6. Track the status of your report within the app to check if authorities have addressed the issue.\n\n"
        "7. Encourage others in your community to report waste issues for faster resolution.",
    imgUrls: [
      'https://www.undp.org/sites/g/files/zskgke326/files/2023-05/UNDP-Jordan-2019-women-recycling-1304_2.jpg',
      'https://www.afrik21.africa/wp-content/uploads/2020/12/shutterstock_1876918771-1.jpg',
      'https://media.licdn.com/dms/image/C5612AQF0mPeqAtVf-Q/article-cover_image-shrink_600_2000/0/1520134464594?e=2147483647&v=beta&t=puwpYTN8RmnUgnhmE5yv6A_kLyVzqtYYW6fVkmYqvUo',
      'https://i.pinimg.com/736x/c6/bb/dd/c6bbdd656ab02c71367a2759017b5387.jpg',
      'https://live-production.wcms.abc-cdn.net.au/1ae66c6a24eb7e5329797d5e72f16796?impolicy=wcms_crop_resize&cropH=2001&cropW=3000&xPos=0&yPos=0&width=862&height=575'
    ],
  ),
];

final reports = [
  DumpingReport(
    location: "Kalanki Chowk",
    issue: "Illegal Dumping",
    status: 'In Progress',
    description: "Plastic waste and trash near the parking area.",
    imagePaths: [
      '/data/user/0/com.thaxaina.safasughar/cache/scaled_1000300724.jpg'
    ],
  ),
  DumpingReport(
    location: "Near Pashupatinath Temple",
    issue: "Overflowing Bin",
    description: "Bins near the main entrance are overflowing.",
    imagePaths: [
      '/data/user/0/com.thaxaina.safasughar/cache/scaled_1000300725.jpg'
    ],
  ),
  DumpingReport(
    location: "Kalimati Road",
    issue: "Hazardous Waste",
    status: 'Resolved',
    description: "Sharp glass and broken tiles near pedestrian paths.",
    imagePaths: [
      '/data/user/0/com.thaxaina.safasughar/cache/scaled_1000300723.jpg'
    ],
  ),
];
