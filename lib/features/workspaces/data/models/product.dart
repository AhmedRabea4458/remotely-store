

class Product {
  final String title;
  final String image;
  final double price;
  final double rating;
  final String? category;

  Product({
    required this.title,
    required this.image,
    required this.price,
    required this.rating,
    this.category,
  });
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      title: json['title'] ?? '',
      image: (json['images'] != null && json['images'].isNotEmpty)
          ? json['images'][0]
          : '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      category: json['category'],
    );
  }
  Product.empty()
      : title = '',
        image = 'https://images.search.yahoo.com/images/view;_ylt=AwrFF.s9hZJpGmIYegGJzbkF;_ylu=c2VjA3NyBHNsawNpbWcEb2lkAzUzM2ViMGJhNTg0MWVlZjFkYjRmZmY3MThkYjczOTlkBGdwb3MDMjEEaXQDYmluZw--?back=https%3A%2F%2Fimages.search.yahoo.com%2Fsearch%2Fimages%3Fp%3Dlaptop%26type%3DE210US91105G91985%26fr%3Dmcafee%26fr2%3Dpiv-web%26tab%3Dorganic%26ri%3D21&w=2000&h=1361&imgurl=b2c-contenthub.com%2Fwp-content%2Fuploads%2F2023%2F07%2FAcer_Aspire3.jpg%3Fquality%3D50%26strip%3Dall&rurl=https%3A%2F%2Fwww.pcworld.com%2Farticle%2F2250639%2Fthe-5-laptop-features-that-matter-most-in-2024.html&size=1293KB&p=laptop&oid=533eb0ba5841eef1db4fff718db7399d&fr2=piv-web&fr=mcafee&tt=The+5+laptop+features+that+matter+most+in+2024+%7C+PCWorld&b=0&ni=21&no=21&ts=&tab=organic&sigr=FU0rG3jRhTXA&sigb=qXELMXDw8pSa&sigi=1kDI2lTvIN.O&sigt=F8eaadqXv.sr&.crumb=5YPwpVdisVG&fr=mcafee&fr2=piv-web&type=E210US91105G91985',
        price = 0.0,
        rating = 0.0,
        category = null;
}
