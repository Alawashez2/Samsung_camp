import 'package:bloc/bloc.dart';
import 'package:samsung_camp/service/apiserp.dart';

part 'image_api_event.dart';
part 'image_api_state.dart';

class ImageApiBloc extends Bloc<ImageApiEvent, ImageApiState> {
  ImageApiBloc() : super(ImageApiInitial()) {
    on<SendImageNameEvent>(
      (event, emit) async {
        emit(LoadingImageState());
        try {
          final String image = GetSerper().getImage(event.name).toString();
          print("++++");
          emit(GetImageApiState(image));
        } catch (e) {
          emit(FailedState());
        }
      },
    );
  }
}
