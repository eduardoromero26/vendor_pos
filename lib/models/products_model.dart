import 'package:collection/collection.dart';

class ProductsModel {
  ProductsModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.permalink,
    required this.dateCreated,
    required this.dateCreatedGmt,
    required this.dateModified,
    required this.dateModifiedGmt,
    required this.type,
    required this.status,
    required this.featured,
    required this.catalogVisibility,
    required this.description,
    required this.shortDescription,
    required this.sku,
    required this.price,
    required this.regularPrice,
    required this.salePrice,
    required this.dateOnSaleFrom,
    required this.dateOnSaleFromGmt,
    required this.dateOnSaleTo,
    required this.dateOnSaleToGmt,
    required this.onSale,
    required this.purchasable,
    required this.totalSales,
    required this.virtual,
    required this.downloadable,
    required this.downloads,
    required this.downloadLimit,
    required this.downloadExpiry,
    required this.externalUrl,
    required this.buttonText,
    required this.taxStatus,
    required this.taxClass,
    required this.manageStock,
    required this.stockQuantity,
    required this.backorders,
    required this.backordersAllowed,
    required this.backordered,
    required this.lowStockAmount,
    required this.soldIndividually,
    required this.weight,
    required this.dimensions,
    required this.shippingRequired,
    required this.shippingTaxable,
    required this.shippingClass,
    required this.shippingClassId,
    required this.reviewsAllowed,
    required this.averageRating,
    required this.ratingCount,
    required this.upsellIds,
    required this.crossSellIds,
    required this.parentId,
    required this.purchaseNote,
    required this.categories,
    required this.tags,
    required this.images,
    required this.attributes,
    required this.defaultAttributes,
    required this.variations,
    required this.groupedProducts,
    required this.menuOrder,
    required this.priceHtml,
    required this.relatedIds,
    required this.metaData,
    required this.stockStatus,
    required this.hasOptions,
    required this.links,
  });

  int id;
  String name;
  String slug;
  String permalink;
  DateTime dateCreated;
  DateTime dateCreatedGmt;
  DateTime dateModified;
  DateTime dateModifiedGmt;
  Type type;
  Status status;
  bool featured;
  CatalogVisibility catalogVisibility;
  String description;
  String shortDescription;
  String sku;
  String price;
  String regularPrice;
  String salePrice;
  dynamic dateOnSaleFrom;
  dynamic dateOnSaleFromGmt;
  dynamic dateOnSaleTo;
  dynamic dateOnSaleToGmt;
  bool onSale;
  bool purchasable;
  int totalSales;
  bool virtual;
  bool downloadable;
  List<dynamic> downloads;
  int downloadLimit;
  int downloadExpiry;
  String externalUrl;
  String buttonText;
  TaxStatus taxStatus;
  String taxClass;
  bool manageStock;
  int stockQuantity;
  Backorders backorders;
  bool backordersAllowed;
  bool backordered;
  dynamic lowStockAmount;
  bool soldIndividually;
  String weight;
  Dimensions dimensions;
  bool shippingRequired;
  bool shippingTaxable;
  String shippingClass;
  int shippingClassId;
  bool reviewsAllowed;
  String averageRating;
  int ratingCount;
  List<dynamic> upsellIds;
  List<dynamic> crossSellIds;
  int parentId;
  String purchaseNote;
  List<CategoryModel> categories;
  List<dynamic> tags;
  List<Image> images;
  List<dynamic> attributes;
  List<dynamic> defaultAttributes;
  List<dynamic> variations;
  List<dynamic> groupedProducts;
  int menuOrder;
  String priceHtml;
  List<int> relatedIds;
  List<MetaDatum> metaData;
  StockStatus stockStatus;
  bool hasOptions;
  Links links;
  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      permalink: json['permalink'],
      dateCreated: DateTime.parse(json['date_created']),
      dateCreatedGmt: DateTime.parse(json['date_created_gmt']),
      dateModified: DateTime.parse(json['date_modified']),
      dateModifiedGmt: DateTime.parse(json['date_modified_gmt']),
      type: Type.values.firstWhereOrNull(
              (e) => e.toString() == 'Type.${json['type']}') ??
          Type.SIMPLE,
      status: Status.values.firstWhereOrNull(
              (e) => e.toString() == 'Status.${json['status']}') ??
          Status.PUBLISH,
      featured: json['featured'],
      catalogVisibility: CatalogVisibility.values.firstWhereOrNull((e) =>
              e.toString() ==
              'CatalogVisibility.${json['catalog_visibility']}') ??
          CatalogVisibility.VISIBLE,
      description: json['description'],
      shortDescription: json['short_description'],
      sku: json['sku'],
      price: json['price'],
      regularPrice: json['regular_price'],
      salePrice: json['sale_price'],
      dateOnSaleFrom: json['date_on_sale_from'],
      dateOnSaleFromGmt: json['date_on_sale_from_gmt'],
      dateOnSaleTo: json['date_on_sale_to'],
      dateOnSaleToGmt: json['date_on_sale_to_gmt'],
      onSale: json['on_sale'],
      purchasable: json['purchasable'],
      totalSales: json['total_sales'],
      virtual: json['virtual'],
      downloadable: json['downloadable'],
      downloads: json['downloads'],
      downloadLimit: json['download_limit'],
      downloadExpiry: json['download_expiry'],
      externalUrl: json['external_url'],
      buttonText: json['button_text'],
      taxStatus: TaxStatus.values.firstWhereOrNull(
              (e) => e.toString() == 'TaxStatus.${json['tax_status']}') ??
          TaxStatus.TAXABLE,
      taxClass: json['tax_class'],
      manageStock: json['manage_stock'],
      stockQuantity: json['stock_quantity'],
      backorders: Backorders.values.firstWhereOrNull(
              (e) => e.toString() == 'Backorders.${json['backorders']}') ??
          Backorders.NO,
      backordersAllowed: json['backorders_allowed'],
      backordered: json['backordered'],
      lowStockAmount: json['low_stock_amount'],
      soldIndividually: json['sold_individually'],
      weight: json['weight'],
      dimensions: Dimensions(
        length: json['dimensions']['length'],
        width: json['dimensions']['width'],
        height: json['dimensions']['height'],
      ),
      shippingRequired: json['shipping_required'],
      shippingTaxable: json['shipping_taxable'],
      shippingClass: json['shipping_class'],
      shippingClassId: json['shipping_class_id'],
      reviewsAllowed: json['reviews_allowed'],
      averageRating: json['average_rating'],
      ratingCount: json['rating_count'],
      upsellIds: List<int>.from(json['upsell_ids'].map((x) => x)),
      crossSellIds: List<int>.from(json['cross_sell_ids'].map((x) => x)),
      parentId: json['parent_id'],
      purchaseNote: json['purchase_note'],
      categories: List<CategoryModel>.from(
          json['categories'].map((x) => CategoryModel.fromJson(x))),
      tags: json['tags'],
      images: List<Image>.from(json['images'].map((x) => Image.fromJson(x))),
      attributes: json['attributes'],
      defaultAttributes: json['default_attributes'],
      variations: json['variations'],
      groupedProducts: json['grouped_products'],
      menuOrder: json['menu_order'],
      priceHtml: json['price_html'],
      relatedIds: List<int>.from(json['related_ids'].map((x) => x)),
      metaData: List<MetaDatum>.from(
          json['meta_data'].map((x) => MetaDatum.fromJson(x))),
      stockStatus: StockStatus.values.firstWhereOrNull(
              (e) => e.toString() == 'StockStatus.${json['stock_status']}') ??
          StockStatus.IN_STOCK,
      hasOptions: json['has_options'],
      links: Links.fromJson(json['_links']),
    );
  }
}

enum Backorders { NO }

enum CatalogVisibility { VISIBLE }

class CategoryModel {
  CategoryModel({
    required this.id,
    required this.name,
    required this.slug,
  });

  int id;
  CategoryName name;
  CategorySlug slug;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json['id'],
        name: CategoryName.values.firstWhereOrNull((e) =>
                e.toString().split('.').last.toLowerCase() ==
                json['name'].toString().toLowerCase()) ??
            CategoryName.COLLARES,
        slug: CategorySlug.values.firstWhereOrNull((e) =>
                e.toString().split('.').last.toLowerCase() ==
                json['slug'].toString().toLowerCase()) ??
            CategorySlug.COLLARES,
      );
}

enum CategoryName { COLLARES, ANILLOS, PULSERAS, ARETES, PERSONALIZADOS }

enum CategorySlug { COLLARES, ANILLOS, PULSERAS, ARETES, PERSONALIZADOS }

class Dimensions {
  Dimensions({
    required this.length,
    required this.width,
    required this.height,
  });

  String length;
  String width;
  String height;
}

class Image {
  Image({
    required this.id,
    required this.dateCreated,
    required this.dateCreatedGmt,
    required this.dateModified,
    required this.dateModifiedGmt,
    required this.src,
    required this.name,
    required this.alt,
  });

  int id;
  DateTime dateCreated;
  DateTime dateCreatedGmt;
  DateTime dateModified;
  DateTime dateModifiedGmt;
  String src;
  String name;
  String alt;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json['id'],
        dateCreated: DateTime.parse(json['date_created']),
        dateCreatedGmt: DateTime.parse(json['date_created_gmt']),
        dateModified: DateTime.parse(json['date_modified']),
        dateModifiedGmt: DateTime.parse(json['date_modified_gmt']),
        src: json['src'],
        name: json['name'],
        alt: json['alt'],
      );
}

class Links {
  Links({
    required this.self,
    required this.collection,
  });

  List<Collection> self;
  List<Collection> collection;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: List<Collection>.from(
            json['self'].map((x) => Collection.fromJson(x))),
        collection: List<Collection>.from(
            json['collection'].map((x) => Collection.fromJson(x))),
      );
}

class Collection {
  Collection({
    required this.href,
  });

  String href;

  factory Collection.fromJson(Map<String, dynamic> json) => Collection(
        href: json['href'],
      );
}

class MetaDatum {
  MetaDatum({
    required this.id,
    required this.key,
    required this.value,
  });

  int id;
  Key? key;
  String value;

  factory MetaDatum.fromJson(Map<String, dynamic> json) => MetaDatum(
        id: json['id'],
        key: keyValues.map[json['key']],
        value: json['value'],
      );
}

enum Key { RANK_MATH_INTERNAL_LINKS_PROCESSED, RANK_MATH_ANALYTIC_OBJECT_ID }

final keyValues = EnumValues({
  'rank_math_internal_links_processed': Key.RANK_MATH_INTERNAL_LINKS_PROCESSED,
  'rank_math_analytic_object_id': Key.RANK_MATH_ANALYTIC_OBJECT_ID,
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => MapEntry(v, k));
    }
    return reverseMap;
  }
}

enum Status { PUBLISH }

enum StockStatus { INSTOCK, IN_STOCK }

enum TaxStatus { TAXABLE }

enum Type { SIMPLE }
