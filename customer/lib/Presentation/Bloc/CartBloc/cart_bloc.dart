import 'package:bloc/bloc.dart';
import '../../../Data/Models/CartModel/AddCartModel.dart';
import '../../../Data/Models/CartModel/DeleteCartModel.dart';
import '../../../Data/Models/CartModel/GetCartModel.dart';
import '../../../Data/Models/ChatModels/CreateChatHeadModel.dart';
import '../../../Data/Models/CheckOutModel/CheckOutModel.dart';
import '../../Controllers/CartController.dart';
import '../../Controllers/ChatController.dart';
import '../../Controllers/SharedPrefrenceController.dart';
part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEventBase, CartStateBase> {
  final cartController = CartController();
  final sharedPrefrenceController = SharedPrefrenceController();
  final chatController = ChatController();
  CartBloc() : super(CartInitial()) {
    on<AddCartEvent>((event, emit) async {
      emit(CartLoading());
      String? token = await sharedPrefrenceController.getToken();

      if (token != null) {
        var res = await cartController.addCart(event.model!, token);
        res.fold((l) => emit((CartError())), (r) => emit(CartSucess()));
      }
    });
    on<GetCartEvent>((event, emit) async {
      emit(CartLoading());
      String? token = await sharedPrefrenceController.getToken();

      if (token != null) {
        var res = await cartController.getCart(token);
        res.fold((l) => emit((CartError())), (r) => emit(CartLoaded(model: r)));
      }
    });
    on<DeleteCartEvent>((event, emit) async {
      emit(CartLoading());
      String? token = await sharedPrefrenceController.getToken();

      if (token != null) {
        var res = await cartController.deleteCart(event.model!, token);
        if (res.isRight()) {
          var result = await cartController.getCart(token);
          result.fold(
              (l) => emit(CartError()), (r) => emit(CartLoaded(model: r)));
        } else {
          emit(CartError());
        }
        //     res.fold((l) => emit((CartError())), (r) => emit(CartSucess()));
      }
    });
    on<CheckOutEvent>((event, emit) async {
      emit(CartLoading());
      String? token = await sharedPrefrenceController.getToken();
      int? userId = await sharedPrefrenceController.getUserId();
      if (token != null) {
        var res = await cartController.checkOut(event.model!, token);
        res.fold((l) => emit(CartError()), (r) {
          chatController.createChatHead(CreateChatHeadModel(
            uId: event.chatHeadModel.uId,
            CustomerId: userId,
          ));
          emit(CartSucess());
        });

        //     res.fold((l) => emit((CartError())), (r) => emit(CartSucess()));
      }
    });
  }
}
