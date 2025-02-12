import 'package:dartz/dartz.dart';
import 'package:ebook_app/Features/home/data/models/book_model/book_model.dart';
import 'package:ebook_app/Features/home/data/repos/home_repo.dart';
import 'package:ebook_app/core/errors/failures.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<Either<Failure, List<BookModel>>> fetchBestSellerBooks() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() {
    throw UnimplementedError();
  }
}
