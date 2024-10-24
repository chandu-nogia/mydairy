import '../../../export.dart';
import '../../model/cart_item_model.dart';
// import '../cart/shopping_cart.dart';
import 'controller.dart';

final shopingListProvider = FutureProvider.autoDispose((ref) async {
  return ShopingApi(ref).shopingList();
});
final cart_list_Provider = FutureProvider.autoDispose((ref) async {
  return ShopingApi(ref).cart_list();
});

final cart_item_Provider =
    StateNotifierProvider.autoDispose<CartItemNotifier, List<CartItemModel>>(
        (ref) {
  return CartItemNotifier(ref);
});

class CartItemNotifier extends StateNotifier<List<CartItemModel>> {
  Ref ref;
  CartItemNotifier(this.ref) : super([]);
  cart_add(List data) {
    List<CartItemModel> datas = [];
    for (int i = 0; i < data.length; i++) {
      datas.add(CartItemModel.fromJson(data[i]));
      datas[i].select = false;
      state.add(datas[i]);
    }
  }

  List cartItem = [];
  cart_total(int index) {
    if (state[index].select == false) {
      state[index].select = true;
      cartItem.add(index);
    } else {
      state[index].select = false;
      cartItem.remove(index);
    }
    print("cart ${cartItem}");
    return cartItem;
  }

  cart_update(CartItemModel data) {
    // final index = state.indexWhere((element) => element.id == data.id);
    // print("index :  $index");

    // state = [...state.sublist(0, index), data, ...state.sublist(index + 1)];
    state = state.map((e) {
      if (e.id == data.id) {
        e = data;
      }
      return e;
    }).toList();
  }

  cart_remove(int id) {
    // state = state.where((element) => element.id != id).toList();
    List<CartItemModel> newState = List.from(state);
    newState.removeWhere((e) => e.id == id);
    state = newState;

    // return state.removeWhere((e) => e.id == id);
  }

  total_amount() {
    dynamic total = 0.0;
    for (int i = 0; i < state.length; i++) {
      if (state[i].select == true) {
        total += state[i].total;
        print(" total ::  $total");
      }
    }
    return total;
  }
}
