part of 'image_api_bloc.dart';

abstract class ImageApiEvent {}

final class SendImageNameEvent extends ImageApiEvent {
  final String name;
  SendImageNameEvent(this.name);
}
