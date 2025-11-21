import 'package:easyshoppin_eshop/features/shop/models/product_attribute_model.dart';
import 'package:easyshoppin_eshop/features/shop/models/product_variation_model.dart';
import 'package:easyshoppin_eshop/utils/constants/enums.dart';
import 'package:easyshoppin_eshop/utils/constants/app_images.dart';
import 'package:flutter/cupertino.dart';
import '../features/personalization/models/address_model.dart';
import '../features/personalization/models/user_model.dart';
import '../features/shop/models/banner_model.dart';
import '../features/shop/models/brand_category_model.dart';
import '../features/shop/models/brand_model.dart';
import '../features/shop/models/cart_item_model.dart';
import '../features/shop/models/cart_model.dart';
import '../features/shop/models/category_model.dart';
import '../features/shop/models/order_model.dart';
import '../features/shop/models/product_category_model.dart';
import '../features/shop/models/product_model.dart';
import '../features/shop/models/sale_model.dart';
import '../features/shop/models/sub_category_model.dart';
import '../generated/l10n/l10n.dart';
import '../routes/routes.dart';

class TDummyData {
  /// -- Banners
  static final List<BannerModel> banners = [
    BannerModel(imageUrl: TImages.banner1, targetScreen: TRoutes.order, active: false),
    BannerModel(imageUrl: TImages.banner2, targetScreen: TRoutes.cart, active: true),
    BannerModel(imageUrl: TImages.banner3, targetScreen: TRoutes.favourites, active: true),
    BannerModel(imageUrl: TImages.banner4, targetScreen: TRoutes.search, active: true),
    BannerModel(imageUrl: TImages.banner5, targetScreen: TRoutes.profile, active: true),
    BannerModel(imageUrl: TImages.banner6, targetScreen: TRoutes.userAddress, active: true),
    BannerModel(imageUrl: TImages.banner7, targetScreen: TRoutes.checkout, active: false),
    BannerModel(imageUrl: TImages.banner8, targetScreen: TRoutes.checkout, active: false),
    BannerModel(imageUrl: TImages.banner9, targetScreen: TRoutes.checkout, active: false),
    BannerModel(imageUrl: TImages.banner10, targetScreen: TRoutes.checkout, active: false),
  ];

  /// -- List of all Sales
  static List<SaleModel> sales(BuildContext context) {
    return [
      SaleModel(id: '1', imageUrl: TImages.sale1, name: S.of(context).peakSales, active: true, targetScreen: TRoutes.order),
      SaleModel(id: '2', imageUrl: TImages.sale2, name: S.of(context).hit, active: true, targetScreen: TRoutes.cart),
      SaleModel(id: '3', imageUrl: TImages.sale3, name: S.of(context).burning, active: true, targetScreen: TRoutes.favourites),
      SaleModel(id: '4', imageUrl: TImages.sale4, name: S.of(context).clothes, active: true, targetScreen: TRoutes.search),
      SaleModel(id: '5', imageUrl: TImages.sale5, name: S.of(context).smartphones, active: true, targetScreen: TRoutes.profile),
      SaleModel(id: '6', imageUrl: TImages.sale6, name: S.of(context).lighting, active: true, targetScreen: TRoutes.userAddress),
      SaleModel(id: '7', imageUrl: TImages.sale7, name: S.of(context).fishing, active: true, targetScreen: TRoutes.checkout),
      SaleModel(id: '7', imageUrl: TImages.sale8, name: S.of(context).smartHouse, active: true, targetScreen: TRoutes.checkout),
    ];
  }

  /// -- User
  static final UserModel user = UserModel(
    id: '',
    username: 'coding_input',
    password: '',
    gender: 'Male',
    day: '',
    month: '',
    year: '',
    firstName: 'Andrey',
    lastName: 'Trepalin',
    email: 'support@inputstudios',
    phoneNumber: '+79993456783',
    profilePicture: TImages.user,
    role: '',
    smsSubscribed: false,
    addresses: [
      AddressModel(
        id: '1',
        name: 'Andrey Trepalin',
        phoneNumber: '+79627788999',
        street: 'Lenina 56',
        city: '',
        state: 'Moscow',
        postalCode: '402356',
        country: 'Russia',
      ),
      AddressModel(
        id: '3',
        name: 'Sergey Ivanov',
        phoneNumber: '+79375565656',
        street: 'Lenina 20',
        city: '',
        state: 'Moscow',
        postalCode: '402379',
        country: 'Russia',
      ),
    ],
  );

  /// -- Cart
  static final CartModel cart = CartModel(
    cartId: '001',
    items: [
      CartItemModel(
        productId: '001',
        variationId: '1',
        quantity: 1,
        title: products[0].title,
        image: products[0].thumbnail,
        brandName: products[0].brand!.name,
        price: products[0].productVariations![0].price,
        selectedVariation: products[0].productVariations![0].attributeValues,
      ),
      CartItemModel(
        productId: '002',
        variationId: '',
        quantity: 1,
        title: products[0].title,
        image: products[0].thumbnail,
        brandName: products[0].brand!.name,
        price: products[0].productVariations![0].price,
        selectedVariation: products[0].productVariations![0].attributeValues,
      ),
    ],
  );

  /// -- Order
  static final List<OrderModel> orders = [
    OrderModel(
      id: 'CWT0012',
      status: OrderStatus.processing,
      items: cart.items,
      totalAmount: 265,
      orderDate: DateTime(2024, 06, 14),
      deliveryDate: DateTime(2024, 06, 18)),
    OrderModel(
        id: 'CWT0027',
        status: OrderStatus.shipped,
        items: cart.items,
        totalAmount: 468,
        orderDate: DateTime(2024, 05, 24),
        deliveryDate: DateTime(2024, 05, 29)),
  ];

  /// -- List of all Categories
  static List<CategoryModel> categories(BuildContext context) {
    return [
      CategoryModel(id: '1', image: TImages.womenImage, name: S.of(context).women, isFeatured: true),
      CategoryModel(id: '2', image: TImages.shoeImage, name: S.of(context).shoes, isFeatured: true),
      CategoryModel(id: '3', image: TImages.kidsImage, name: S.of(context).kids, isFeatured: true),
      CategoryModel(id: '4', image: TImages.mensImage, name: S.of(context).mens, isFeatured: true),
      CategoryModel(id: '5', image: TImages.houseImage, name: S.of(context).house, isFeatured: true),
      CategoryModel(id: '6', image: TImages.beautyImage, name: S.of(context).beauty, isFeatured: true),
      CategoryModel(id: '7', image: TImages.accessoriesImage, name: S.of(context).accessories, isFeatured: true),
      CategoryModel(id: '8', image: TImages.electronicsImage, name: S.of(context).electronics, isFeatured: true),
      CategoryModel(id: '9', image: TImages.toysImage, name: S.of(context).toys, isFeatured: true),
      CategoryModel(id: '10', image: TImages.furnitureImage, name: S.of(context).furniture, isFeatured: true),
      CategoryModel(id: '11', image: TImages.productsForAdultsImage, name: S.of(context).productsForAdults, isFeatured: true),
      CategoryModel(id: '12', image: TImages.productsIcon, name: S.of(context).products, isFeatured: true),
      CategoryModel(id: '13', image: TImages.householdAppliancesImage, name: S.of(context).householdAppliances, isFeatured: true),
      CategoryModel(id: '14', image: TImages.petSuppliesImage, name: S.of(context).petSupplies, isFeatured: true),
      CategoryModel(id: '15', image: TImages.sportsImage, name: S.of(context).sports, isFeatured: true),
      CategoryModel(id: '16', image: TImages.automotiveGoodsImage, name: S.of(context).automotiveGoods, isFeatured: true),
      CategoryModel(id: '17', image: TImages.booksImage, name: S.of(context).books, isFeatured: true),
      CategoryModel(id: '18', image: TImages.jeweleryImage, name: S.of(context).jewelery, isFeatured: true),
      CategoryModel(id: '19', image: TImages.forRepairImage, name: S.of(context).forRepair, isFeatured: true),
      CategoryModel(id: '20', image: TImages.gardenImage, name: S.of(context).gardenSummerHouse, isFeatured: true),
      CategoryModel(id: '21', image: TImages.healthImage, name: S.of(context).health, isFeatured: true),
      CategoryModel(id: '22', image: TImages.stationeryImage, name: S.of(context).stationery, isFeatured: true),
    ];
  }

  /// -- List of all SubCategories
  static List<SubCategoryModel> subCategories(BuildContext context) {
    return [
      // Women
      SubCategoryModel(id: '0', image: TImages.womenImage, name: S.of(context).blousesShirts, parentId: '1', isFeatured: true),
      SubCategoryModel(id: '1', image: TImages.womenImage, name: S.of(context).shirts, parentId: '1', isFeatured: true),
      SubCategoryModel(id: '2', image: TImages.womenImage, name: S.of(context).outerwear, parentId: '1', isFeatured: true),
      SubCategoryModel(id: '3', image: TImages.womenImage, name: S.of(context).jumpersTurtlenecksCardigans, parentId: '1', isFeatured: true),
      SubCategoryModel(id: '4', image: TImages.womenImage, name: S.of(context).jeans, parentId: '1', isFeatured: true),
      SubCategoryModel(id: '5', image: TImages.womenImage, name: S.of(context).overalls, parentId: '1', isFeatured: true),
      SubCategoryModel(id: '6', image: TImages.womenImage, name: S.of(context).costumes, parentId: '1', isFeatured: true),
      SubCategoryModel(id: '7', image: TImages.womenImage, name: S.of(context).longsleeves, parentId: '1', isFeatured: true),
      SubCategoryModel(id: '8', image: TImages.womenImage, name: S.of(context).jacketsVestsBlazers, parentId: '1', isFeatured: true),
      SubCategoryModel(id: '9', image: TImages.womenImage, name: S.of(context).dressesSundresses, parentId: '1', isFeatured: true),
      SubCategoryModel(id: '10', image: TImages.womenImage, name: S.of(context).sweatshirtsSweatshirtsHoodies, parentId: '1', isFeatured: true),
      SubCategoryModel(id: '11', image: TImages.womenImage, name: S.of(context).tunics, parentId: '1', isFeatured: true),
      SubCategoryModel(id: '12', image: TImages.womenImage, name: S.of(context).tshirtsTops, parentId: '1', isFeatured: true),
      SubCategoryModel(id: '13', image: TImages.womenImage, name: S.of(context).robes, parentId: '1', isFeatured: true),
      SubCategoryModel(id: '14', image: TImages.womenImage, name: S.of(context).shorts, parentId: '1', isFeatured: true),
      SubCategoryModel(id: '15', image: TImages.womenImage, name: S.of(context).skirts, parentId: '1', isFeatured: true),
      SubCategoryModel(id: '16', image: TImages.womenImage, name: S.of(context).underwear, parentId: '1', isFeatured: true),
      SubCategoryModel(id: '17', image: TImages.womenImage, name: S.of(context).largeSizes, parentId: '1', isFeatured: true),
      SubCategoryModel(id: '18', image: TImages.womenImage, name: S.of(context).futureMothers, parentId: '1', isFeatured: true),
      SubCategoryModel(id: '19', image: TImages.womenImage, name: S.of(context).forTall, parentId: '1', isFeatured: true),
      SubCategoryModel(id: '20', image: TImages.womenImage, name: S.of(context).forShort, parentId: '1', isFeatured: true),

      // Shoes
      SubCategoryModel(id: '21', image: TImages.shoeImage, name: S.of(context).childrens, parentId: '2', isFeatured: true),
      SubCategoryModel(id: '22', image: TImages.shoeImage, name: S.of(context).forNewborns, parentId: '2', isFeatured: true),
      SubCategoryModel(id: '23', image: TImages.shoeImage, name: S.of(context).womens, parentId: '2', isFeatured: true),
      SubCategoryModel(id: '24', image: TImages.shoeImage, name: S.of(context).mens, parentId: '2', isFeatured: true),
      SubCategoryModel(id: '25', image: TImages.shoeImage, name: S.of(context).specialFootwear, parentId: '2', isFeatured: true),
      SubCategoryModel(id: '26', image: TImages.shoeImage, name: S.of(context).shoeAccessories, parentId: '2', isFeatured: true),

      // Kids
      SubCategoryModel(id: '27', image: TImages.kidsImage, name: S.of(context).forGirls, parentId: '3', isFeatured: true),
      SubCategoryModel(id: '28', image: TImages.kidsImage, name: S.of(context).forBoys, parentId: '3', isFeatured: true),
      SubCategoryModel(id: '29', image: TImages.kidsImage, name: S.of(context).forNewborns, parentId: '3', isFeatured: true),
      SubCategoryModel(id: '30', image: TImages.kidsImage, name: S.of(context).childrensElectronics, parentId: '3', isFeatured: true),
      SubCategoryModel(id: '31', image: TImages.kidsImage, name: S.of(context).constructors, parentId: '3', isFeatured: true),
      SubCategoryModel(id: '32', image: TImages.kidsImage, name: S.of(context).childrensTransport, parentId: '3', isFeatured: true),
      SubCategoryModel(id: '33', image: TImages.kidsImage, name: S.of(context).walksTravels, parentId: '3', isFeatured: true),
      SubCategoryModel(id: '34', image: TImages.kidsImage, name: S.of(context).babyFood, parentId: '3', isFeatured: true),
      SubCategoryModel(id: '35', image: TImages.kidsImage, name: S.of(context).childrensRoom, parentId: '3', isFeatured: true),
      SubCategoryModel(id: '36', image: TImages.kidsImage, name: S.of(context).religiousClothing, parentId: '3', isFeatured: true),
      SubCategoryModel(id: '37', image: TImages.kidsImage, name: S.of(context).babyProducts, parentId: '3', isFeatured: true),
      SubCategoryModel(id: '38', image: TImages.kidsImage, name: S.of(context).diapers, parentId: '3', isFeatured: true),
      SubCategoryModel(id: '39', image: TImages.kidsImage, name: S.of(context).giftsChildren, parentId: '3', isFeatured: true),

      // Mens
      SubCategoryModel(id: '40', image: TImages.mensImage, name: S.of(context).trousers, parentId: '4', isFeatured: true),
      SubCategoryModel(id: '41', image: TImages.mensImage, name: S.of(context).outerwear, parentId: '4', isFeatured: true),
      SubCategoryModel(id: '42', image: TImages.mensImage, name: S.of(context).jumpersTurtlenecksCardigans, parentId: '4', isFeatured: true),
      SubCategoryModel(id: '43', image: TImages.mensImage, name: S.of(context).jeans, parentId: '4', isFeatured: true),
      SubCategoryModel(id: '44', image: TImages.mensImage, name: S.of(context).overallsSemioveralls, parentId: '4', isFeatured: true),
      SubCategoryModel(id: '45', image: TImages.mensImage, name: S.of(context).costumes, parentId: '4', isFeatured: true),
      SubCategoryModel(id: '46', image: TImages.mensImage, name: S.of(context).longsleeves, parentId: '4', isFeatured: true),
      SubCategoryModel(id: '47', image: TImages.mensImage, name: S.of(context).tshirts, parentId: '4', isFeatured: true),
      SubCategoryModel(id: '48', image: TImages.mensImage, name: S.of(context).jacketsVestsBlazers, parentId: '4', isFeatured: true),
      SubCategoryModel(id: '49', image: TImages.mensImage, name: S.of(context).pajamas, parentId: '4', isFeatured: true),
      SubCategoryModel(id: '50', image: TImages.mensImage, name: S.of(context).sweatshirtsSweatshirtsHoodies, parentId: '4', isFeatured: true),
      SubCategoryModel(id: '51', image: TImages.mensImage, name: S.of(context).tshirts, parentId: '4', isFeatured: true),
      SubCategoryModel(id: '52', image: TImages.mensImage, name: S.of(context).poloShirts, parentId: '4', isFeatured: true),
      SubCategoryModel(id: '53', image: TImages.mensImage, name: S.of(context).robes, parentId: '4', isFeatured: true),
      SubCategoryModel(id: '54', image: TImages.mensImage, name: S.of(context).shorts, parentId: '4', isFeatured: true),
      SubCategoryModel(id: '55', image: TImages.mensImage, name: S.of(context).underwear, parentId: '4', isFeatured: true),
      SubCategoryModel(id: '56', image: TImages.mensImage, name: S.of(context).largeSizes, parentId: '4', isFeatured: true),
      SubCategoryModel(id: '57', image: TImages.mensImage, name: S.of(context).forTall, parentId: '4', isFeatured: true),
      SubCategoryModel(id: '58', image: TImages.mensImage, name: S.of(context).forShort, parentId: '4', isFeatured: true),
      SubCategoryModel(id: '59', image: TImages.mensImage, name: S.of(context).beachwear, parentId: '4', isFeatured: true),

      // Sports
      SubCategoryModel(id: '21', image: TImages.sportsImage, name: S.of(context).sportShoes, parentId: '15', isFeatured: false),
      SubCategoryModel(id: '22', image: TImages.sportsImage, name: S.of(context).trackSuits, parentId: '15', isFeatured: false),
      SubCategoryModel(id: '23', image: TImages.sportsImage, name: S.of(context).sportsEquipments, parentId: '15', isFeatured: false),

      // Furniture
      SubCategoryModel(id: '24', image: TImages.furnitureImage, name: S.of(context).bedroomFurniture, parentId: '10', isFeatured: false),
      SubCategoryModel(id: '25', image: TImages.furnitureImage, name: S.of(context).kitchenFurniture, parentId: '10', isFeatured: false),
      SubCategoryModel(id: '26', image: TImages.furnitureImage, name: S.of(context).officeFurniture, parentId: '10', isFeatured: false),

      // Electronics
      SubCategoryModel(id: '', image: TImages.electronicsImage, name: S.of(context).laptop, parentId: '8', isFeatured: false),
      SubCategoryModel(id: '46', image: TImages.electronicsImage, name: S.of(context).mobile, parentId: '8', isFeatured: false),
      SubCategoryModel(id: '47', image: TImages.electronicsImage, name: S.of(context).officeEquipment, parentId: '8', isFeatured: false),
    ];
  }

  /// -- List of all Brands
  static final List<BrandModel> brands = [
    BrandModel(id: '1', image: TImages.nikeLogo, name: 'Nike', productsCount: 254, isFeatured: true),
    BrandModel(id: '2', image: TImages.adidasLogo, name: 'Adidas', productsCount: 95, isFeatured: true),
    BrandModel(id: '8', image: TImages.kenwoodLogo, name: 'Kenwood', productsCount: 36, isFeatured: false),
    BrandModel(id: '9', image: TImages.ikeaLogo, name: 'IKEA', productsCount: 36, isFeatured: false),
    BrandModel(id: '5', image: TImages.appleLogo, name: 'Apple', productsCount: 16, isFeatured: true),
    BrandModel(id: '10', image: TImages.acerLogo, name: 'Acer', productsCount: 36, isFeatured: false),
    BrandModel(id: '3', image: TImages.jordanLogo, name: 'Jordan', productsCount: 36, isFeatured: true),
    BrandModel(id: '4', image: TImages.pumaLogo, name: 'Puma', productsCount: 65, isFeatured: true),
    BrandModel(id: '6', image: TImages.zaraLogo, name: 'ZARA', productsCount: 36, isFeatured: true),
    BrandModel(id: '7', image: TImages.electronicsIcon, name: 'Samsung', productsCount: 36, isFeatured: false),
  ];

  /// -- List of all Brand Categories
  static final List<BrandCategoryModel> brandCategory = [
    BrandCategoryModel(brandId: '1', categoryId: '1'),
    BrandCategoryModel(brandId: '1', categoryId: '8'),
    BrandCategoryModel(brandId: '1', categoryId: '9'),
    BrandCategoryModel(brandId: '1', categoryId: '10'),
    BrandCategoryModel(brandId: '2', categoryId: '1'),
    BrandCategoryModel(brandId: '2', categoryId: '8'),
    BrandCategoryModel(brandId: '2', categoryId: '9'),
    BrandCategoryModel(brandId: '2', categoryId: '10'),
    BrandCategoryModel(brandId: '3', categoryId: '1'),
    BrandCategoryModel(brandId: '3', categoryId: '8'),
    BrandCategoryModel(brandId: '3', categoryId: '9'),
    BrandCategoryModel(brandId: '3', categoryId: '10'),
    BrandCategoryModel(brandId: '4', categoryId: '1'),
    BrandCategoryModel(brandId: '4', categoryId: '8'),
    BrandCategoryModel(brandId: '4', categoryId: '9'),
    BrandCategoryModel(brandId: '4', categoryId: '10'),
    BrandCategoryModel(brandId: '5', categoryId: '15'),
    BrandCategoryModel(brandId: '5', categoryId: '2'),
    BrandCategoryModel(brandId: '10', categoryId: '2'),
    BrandCategoryModel(brandId: '10', categoryId: '14'),
    BrandCategoryModel(brandId: '6', categoryId: '3'),
    BrandCategoryModel(brandId: '6', categoryId: '16'),
    BrandCategoryModel(brandId: '7', categoryId: '2'),
    BrandCategoryModel(brandId: '8', categoryId: '5'),
    BrandCategoryModel(brandId: '8', categoryId: '11'),
    BrandCategoryModel(brandId: '8', categoryId: '12'),
    BrandCategoryModel(brandId: '8', categoryId: '13'),
    BrandCategoryModel(brandId: '9', categoryId: '5'),
    BrandCategoryModel(brandId: '9', categoryId: '11'),
    BrandCategoryModel(brandId: '9', categoryId: '12'),
    BrandCategoryModel(brandId: '9', categoryId: '13'),
  ];

  /// -- List of all Product Categories
  static final List<ProductCategoryModel> productCategories = [
    ProductCategoryModel(productId: '001', categoryId: '1'),
    ProductCategoryModel(productId: '001', categoryId: '8'),
    ProductCategoryModel(productId: '004', categoryId: '3'),
    ProductCategoryModel(productId: '002', categoryId: '3'),
    ProductCategoryModel(productId: '002', categoryId: '16'),
    ProductCategoryModel(productId: '003', categoryId: '3'),
    ProductCategoryModel(productId: '005', categoryId: '1'),
    ProductCategoryModel(productId: '005', categoryId: '8'),
    ProductCategoryModel(productId: '040', categoryId: '2'),
    ProductCategoryModel(productId: '040', categoryId: '15'),
    ProductCategoryModel(productId: '006', categoryId: '2'),
    ProductCategoryModel(productId: '007', categoryId: '4'),
    ProductCategoryModel(productId: '009', categoryId: '1'),
    ProductCategoryModel(productId: '009', categoryId: '15'),
    ProductCategoryModel(productId: '010', categoryId: '1'),
    ProductCategoryModel(productId: '010', categoryId: '8'),
    ProductCategoryModel(productId: '011', categoryId: '1'),
    ProductCategoryModel(productId: '011', categoryId: '8'),
    ProductCategoryModel(productId: '012', categoryId: '1'),
    ProductCategoryModel(productId: '012', categoryId: '8'),
    ProductCategoryModel(productId: '013', categoryId: '1'),
    ProductCategoryModel(productId: '013', categoryId: '8'),

    ProductCategoryModel(productId: '014', categoryId: '1'),
    ProductCategoryModel(productId: '014', categoryId: '9'),
    ProductCategoryModel(productId: '015', categoryId: '1'),
    ProductCategoryModel(productId: '015', categoryId: '9'),
    ProductCategoryModel(productId: '016', categoryId: '1'),
    ProductCategoryModel(productId: '016', categoryId: '9'),
    ProductCategoryModel(productId: '017', categoryId: '1'),
    ProductCategoryModel(productId: '017', categoryId: '9'),

    ProductCategoryModel(productId: '018', categoryId: '1'),
    ProductCategoryModel(productId: '018', categoryId: '10'),
    ProductCategoryModel(productId: '019', categoryId: '1'),
    ProductCategoryModel(productId: '019', categoryId: '10'),
    ProductCategoryModel(productId: '020', categoryId: '1'),
    ProductCategoryModel(productId: '020', categoryId: '10'),
    ProductCategoryModel(productId: '021', categoryId: '1'),
    ProductCategoryModel(productId: '021', categoryId: '10'),

    ProductCategoryModel(productId: '022', categoryId: '5'),
    ProductCategoryModel(productId: '022', categoryId: '11'),
    ProductCategoryModel(productId: '023', categoryId: '5'),
    ProductCategoryModel(productId: '023', categoryId: '11'),
    ProductCategoryModel(productId: '024', categoryId: '5'),
    ProductCategoryModel(productId: '024', categoryId: '11'),
    ProductCategoryModel(productId: '025', categoryId: '5'),
    ProductCategoryModel(productId: '025', categoryId: '11'),

    ProductCategoryModel(productId: '026', categoryId: '5'),
    ProductCategoryModel(productId: '026', categoryId: '12'),
    ProductCategoryModel(productId: '027', categoryId: '5'),
    ProductCategoryModel(productId: '027', categoryId: '12'),
    ProductCategoryModel(productId: '028', categoryId: '5'),
    ProductCategoryModel(productId: '028', categoryId: '12'),

    ProductCategoryModel(productId: '029', categoryId: '5'),
    ProductCategoryModel(productId: '029', categoryId: '13'),
    ProductCategoryModel(productId: '030', categoryId: '5'),
    ProductCategoryModel(productId: '030', categoryId: '13'),
    ProductCategoryModel(productId: '031', categoryId: '5'),
    ProductCategoryModel(productId: '031', categoryId: '13'),
    ProductCategoryModel(productId: '032', categoryId: '5'),
    ProductCategoryModel(productId: '032', categoryId: '13'),

    ProductCategoryModel(productId: '033', categoryId: '2'),
    ProductCategoryModel(productId: '033', categoryId: '14'),
    ProductCategoryModel(productId: '034', categoryId: '2'),
    ProductCategoryModel(productId: '034', categoryId: '14'),
    ProductCategoryModel(productId: '035', categoryId: '2'),
    ProductCategoryModel(productId: '035', categoryId: '14'),
    ProductCategoryModel(productId: '036', categoryId: '2'),
    ProductCategoryModel(productId: '036', categoryId: '14'),

    ProductCategoryModel(productId: '037', categoryId: '2'),
    ProductCategoryModel(productId: '037', categoryId: '15'),
    ProductCategoryModel(productId: '038', categoryId: '2'),
    ProductCategoryModel(productId: '038', categoryId: '15'),
    ProductCategoryModel(productId: '039', categoryId: '2'),
    ProductCategoryModel(productId: '039', categoryId: '15'),
    //040 after product 005

    ProductCategoryModel(productId: '008', categoryId: '2'),
  ];

  /// -- List of all Products
  static final List<ProductModel> products = [
    ProductModel(
        id: '001',
        title: 'Green Nike sports shoe',
        stock: 57,
        price: 3500,
        isFeatured: true,
        thumbnail: TImages.productImage1,
        description: 'Green Nike sports shoe',
        brand: BrandModel(id: '1', image: TImages.nikeLogo, name: 'Nike', productsCount: 265, isFeatured: true),
        images: [TImages.productImage1, TImages.productImage23, TImages.productImage21, TImages.productImage9],
        salePrice: 1990,
        sku: 'ABR4567',
        categoryId: '1',
        productAttributes: [
          ProductAttributeModel(name: 'Color', values: ['Green', 'Black', 'Red']),
          ProductAttributeModel(name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
        ],
        productVariations: [
          ProductVariationModel(
              id: '1',
              stock: 34,
              price: 134,
              salePrice: 122.6,
              image: TImages.productImage1,
              description: 'This is a Product description for Green Nike sports shoe.',
              attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
          ProductVariationModel(
              id: '2', stock: 15, price: 132, image: TImages.productImage23, attributeValues: {'Color': 'Black', 'Size': 'EU 32'}),
          ProductVariationModel(
              id: '3', stock: 0, price: 234, image: TImages.productImage23, attributeValues: {'Color': 'Black', 'Size': 'EU 34'}),
          ProductVariationModel(
              id: '4', stock: 222, price: 232, image: TImages.productImage1, attributeValues: {'Color': 'Green', 'Size': 'EU 32'}),
          ProductVariationModel(
              id: '5', stock: 0, price: 334, image: TImages.productImage21, attributeValues: {'Color': 'Red', 'Size': 'EU 34'}),
          ProductVariationModel(
              id: '6', stock: 11, price: 332, image: TImages.productImage21, attributeValues: {'Color': 'Red', 'Size': 'EU 32'}),
        ],
        productType: 'ProductType.variable',
    ),
    ProductModel(
      id: '002',
      title: 'Blue T-shirt for all ages',
      stock: 15,
      price: 3560,
      isFeatured: true,
      thumbnail: TImages.productImage69,
      description: 'This is a Product description for Blue Nike Sleeve less vest. There are more things that can be added but i am just practicing and nothing else.',
      brand: BrandModel(id: '6', image: TImages.zaraLogo, name: 'ZARA', productsCount: 265, isFeatured: true),
      images: [TImages.productImage68, TImages.productImage69, TImages.productImage5],
      salePrice: 1745,
      sku: 'ABR4568',
      categoryId: '16',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
        ProductAttributeModel(name: 'Size', values: ['EU 32', 'EU 34']),
      ],
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '003',
      title: 'Leather brown Jacket',
      stock: 15,
      price: 38000,
      isFeatured: false,
      thumbnail: TImages.productImage64,
      description: 'This is a Product description for Leather brow Jacket. There are more things that can be added but i am just practicing and nothing else.',
      brand: BrandModel(id: '6', image: TImages.zaraLogo, name: 'ZARA', productsCount: 265, isFeatured: true),
      images: [TImages.productImage64, TImages.productImage65, TImages.productImage66, TImages.productImage67],
      salePrice: 18990,
      sku: 'ABR4568',
      categoryId: '16',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
        ProductAttributeModel(name: 'Size', values: ['EU 32', 'EU 34']),
      ],
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '004',
      title: '4 Color collar t-shirt dry fit',
      stock: 15,
      price: 6990,
      isFeatured: false,
      thumbnail: TImages.productImage60,
      description: 'This is a Product description for 4 Color collar t-shirt dry fit. There are more things that can be added but i am just practicing and nothing else.',
      brand: BrandModel(id: '6', image: TImages.zaraLogo, name: 'ZARA', productsCount: 448, isFeatured: true),
      images: [TImages.productImage60, TImages.productImage61, TImages.productImage62, TImages.productImage63],
      salePrice: 1783,
      sku: 'ABR4568',
      categoryId: '16',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Red', 'Yellow', 'Green', 'Blue']),
        ProductAttributeModel(name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
      ],
      productVariations: [
        ProductVariationModel(
            id: '1',
            stock: 34,
            price: 134,
            salePrice: 122.6,
            image: TImages.productImage60,
            description: 'This is a Product description for 4 Color collar t-shirt dry fit.',
            attributeValues: {'Color': 'Red', 'Size': 'EU 34'}),
        ProductVariationModel(
            id: '2', stock: 15, price: 132, image: TImages.productImage60, attributeValues: {'Color': 'Red', 'Size': 'EU 32'}),
        ProductVariationModel(
            id: '3', stock: 0, price: 234, image: TImages.productImage61, attributeValues: {'Color': 'Yellow', 'Size': 'EU 34'}),
        ProductVariationModel(
            id: '4', stock: 222, price: 232, image: TImages.productImage61, attributeValues: {'Color': 'Yellow', 'Size': 'EU 32'}),
        ProductVariationModel(
            id: '5', stock: 0, price: 334, image: TImages.productImage62, attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
        ProductVariationModel(
            id: '6', stock: 11, price: 332, image: TImages.productImage62, attributeValues: {'Color': 'Green', 'Size': 'EU 30'}),
        ProductVariationModel(
            id: '7', stock: 11, price: 332, image: TImages.productImage63, attributeValues: {'Color': 'Blue', 'Size': 'EU 30'}),
        ProductVariationModel(
            id: '8', stock: 11, price: 332, image: TImages.productImage63, attributeValues: {'Color': 'Blue', 'Size': 'EU 34'}),
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel(
      id: '005',
      title: 'Nike Air Jordan Shoes',
      stock: 15,
      price: 4518,
      isFeatured: false,
      thumbnail: TImages.productImage10,
      description: 'Nike Air Jordan Shoes for running. Quality product, Long Lasting.',
      brand: BrandModel(id: '1', image: TImages.nikeLogo, name: 'Nike', productsCount: 476, isFeatured: true),
      images: [TImages.productImage7, TImages.productImage8, TImages.productImage9, TImages.productImage10],
      salePrice: 5650,
      sku: 'ABR4568',
      categoryId: '8',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Orange', 'Black', 'Brown']),
        ProductAttributeModel(name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
      ],
      productVariations: [
        ProductVariationModel(
            id: '1',
            stock: 16,
            price: 36,
            salePrice: 12.6,
            image: TImages.productImage8,
            description: 'This is a Product description for Nike Air Jordan Shoes.',
            attributeValues: {'Color': 'Orange', 'Size': 'EU 34'}),
        ProductVariationModel(
            id: '2', stock: 15, price: 35, image: TImages.productImage7, attributeValues: {'Color': 'Black', 'Size': 'EU 32'}),
        ProductVariationModel(
            id: '3', stock: 14, price: 34, image: TImages.productImage9, attributeValues: {'Color': 'Brown', 'Size': 'EU 34'}),
        ProductVariationModel(
            id: '4', stock: 13, price: 33, image: TImages.productImage7, attributeValues: {'Color': 'Black', 'Size': 'EU 32'}),
        ProductVariationModel(
            id: '5', stock: 12, price: 32, image: TImages.productImage9, attributeValues: {'Color': 'Brown', 'Size': 'EU 32'}),
        ProductVariationModel(
            id: '6', stock: 11, price: 31, image: TImages.productImage8, attributeValues: {'Color': 'Orange', 'Size': 'EU 32'}),
      ],
      productType: 'ProductType.variable',
    ),
  ];
}
