part of 'image_api_bloc.dart';

abstract class ImageApiState {}

final class ImageApiInitial extends ImageApiState {}

final class GetImageApiState extends ImageApiState {
  final String productImage;
  GetImageApiState(this.productImage);
}

final class LoadingImageState extends ImageApiState {}

final class FailedState extends ImageApiState {}
