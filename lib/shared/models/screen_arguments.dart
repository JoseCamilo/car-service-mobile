class ScreenArguments {
  final String id;
  final String title;
  final String subtitle;
  final String message;
  final String image;
  final String description;
  final String address;
  final String sale;
  final String stars;
  final String ratings;
  final List<dynamic> subscription;
  final List<dynamic> tags;

  ScreenArguments(
      {this.id,
      this.title,
      this.subtitle,
      this.message,
      this.image,
      this.description,
      this.sale,
      this.stars,
      this.ratings,
      this.address,
      this.subscription,
      this.tags});

  @override
  String toString() {
    return 'ScreenArguments(id: $id, title: $title, subtitle: $subtitle, message: $message, image: $image, description: $description, address: $address, sale: $sale, stars: $stars, ratings: $ratings, subscription: $subscription, tags: $tags)';
  }
}
