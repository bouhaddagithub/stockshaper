import "package:flutter/material.dart";
import 'package:stckshaper/models/classes/client_module.dart';
import 'package:stckshaper/models/classes/deposit_module.dart';
import 'package:stckshaper/models/classes/category_module.dart';
import 'package:stckshaper/models/classes/user_module.dart';
import 'package:stckshaper/sqlite/database_connection.dart';
import 'package:stckshaper/style.dart';
import 'package:stckshaper/widgets/dropdown.dart';
import '../models/classes/product_module.dart';
import 'default_textfield.dart';

class ClientFormDialog extends StatefulWidget {
  const ClientFormDialog({super.key});

  @override
  State<ClientFormDialog> createState() => _ClientFormDialogState();
}

class _ClientFormDialogState extends State<ClientFormDialog> {
  TextEditingController clientName = TextEditingController(),
      clientPhone = TextEditingController(),
      clientAddress = TextEditingController(),
      clientCreditLimit = TextEditingController();

  void _addClientToDatabase() {
    Client newClient = Client(
      name: clientName.text,
      phoneNumber: clientPhone.text,
      address: clientAddress.text,
      creditAmount: double.parse(clientCreditLimit.text),
      remainingAmount: 0,
      paidAmount: 0,
      soldTotal: 0,
    );

    DatabaseHelper().insertClient(newClient);

    // Close the dialog
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Row(
        children: [
          Icon(
            Icons.person_add_alt_1_rounded,
            size: 32,
            color: kBlackColor.withOpacity(0.8),
          ),
          const SizedBox(
            width: 15,
          ),
          const Text('Add Client'),
        ],
      ),
      content: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            DefaultTextField(controller: clientName, label: "Name"),
            const SizedBox(
              height: 10,
            ),
            DefaultTextField(controller: clientPhone, label: "Phone Number"),
            const SizedBox(
              height: 10,
            ),
            DefaultTextField(controller: clientAddress, label: "Address"),
            const SizedBox(
              height: 10,
            ),
            DefaultTextField(
                controller: clientCreditLimit, label: "Credit Limit"),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            _addClientToDatabase();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: kMainColor,
            elevation: 0,
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            'Add',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class ProductFormDialog extends StatefulWidget {
  const ProductFormDialog(
      {super.key, required this.categories, required this.deposits});

  final List<Category> categories;
  final List<Deposit> deposits;

  @override
  State<StatefulWidget> createState() => _ProductFormDialogState();
}

class _ProductFormDialogState extends State<ProductFormDialog> {
  TextEditingController productName = TextEditingController(),
      productBarCode = TextEditingController(),
      productReference = TextEditingController(),
      productBuyingPrice = TextEditingController(),
      productSellingPrice = TextEditingController(),
      productAmount = TextEditingController();
  int depositId = 0, categoryId = 0;

  void _addProductToDatabase() {
    Product newProduct = Product(
      name: productName.text,
      reference: productReference.text,
      barCode: productBarCode.text,
      stock: int.parse(productAmount.text),
      buyingPrice: double.parse(productBuyingPrice.text),
      sellingPrice: double.parse(productSellingPrice.text),
      photo: "",
      groupId: categoryId,
      depositeId: depositId,
    );
    DatabaseHelper().insertProduct(newProduct);

    // Close the dialog
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Row(
        children: [
          Icon(
            Icons.add_circle_rounded,
            size: 32,
            color: kBlackColor.withOpacity(0.8),
          ),
          const SizedBox(
            width: 15,
          ),
          const Text('Add Product'),
        ],
      ),
      content: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            DefaultTextField(controller: productName, label: "Name"),
            const SizedBox(
              height: 10,
            ),
            DefaultTextField(controller: productReference, label: "Reference"),
            const SizedBox(
              height: 10,
            ),
            DefaultTextField(controller: productBarCode, label: "BarCode"),
            const SizedBox(
              height: 10,
            ),
            DefaultTextField(controller: productAmount, label: "Amount"),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: DefaultTextField(
                    controller: productBuyingPrice,
                    label: "Buy Price",
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: DefaultTextField(
                    controller: productSellingPrice,
                    label: "Sell Price",
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: MyDropdown(
                    getId: getId,
                    categories: widget.categories,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: MyDropdown(
                    getId: getId,
                    deposits: widget.deposits,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            _addProductToDatabase();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: kMainColor,
            elevation: 0,
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            'Add',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  getId(int selectedItemId, bool isForCategory) {
    if (isForCategory) {
      categoryId = selectedItemId;
    } else {
      depositId = selectedItemId;
    }
  }
}

class CategoryFormDialog extends StatefulWidget {
  const CategoryFormDialog({super.key, this.forEdit = false});

  final bool forEdit;

  @override
  State<CategoryFormDialog> createState() => _CategoryFormDialogState();
}

class _CategoryFormDialogState extends State<CategoryFormDialog> {
  TextEditingController categoryName = TextEditingController();

  void _addCategoryToDatabase() {
    Category newCategory = Category(name: categoryName.text);
    DatabaseHelper().insertGroupe(newCategory);
    // Close the dialog
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Row(
        children: [
          Icon(
            Icons.category_rounded,
            size: 32,
            color: kBlackColor.withOpacity(0.8),
          ),
          const SizedBox(
            width: 15,
          ),
          const Text('Add Category'),
        ],
      ),
      content: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            DefaultTextField(controller: categoryName, label: "Name"),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            _addCategoryToDatabase();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: kMainColor,
            elevation: 0,
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            'Add',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class DepositFormDialog extends StatefulWidget {
  const DepositFormDialog({super.key});

  @override
  State<DepositFormDialog> createState() => _DepositFormDialogState();
}

class _DepositFormDialogState extends State<DepositFormDialog> {
  TextEditingController depositName = TextEditingController();

  void _addDepositToDatabase() {
    Deposit newDeposit = Deposit(name: depositName.text);
    DatabaseHelper().insertDeposit(newDeposit);
    // Close the dialog
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Row(
        children: [
          Icon(
            Icons.category_rounded,
            size: 32,
            color: kBlackColor.withOpacity(0.8),
          ),
          const SizedBox(
            width: 15,
          ),
          const Text('Add Deposit'),
        ],
      ),
      content: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            DefaultTextField(controller: depositName, label: "Name"),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            _addDepositToDatabase();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: kMainColor,
            elevation: 0,
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            'Add',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class UserFormDialog extends StatefulWidget {
  const UserFormDialog({super.key});

  @override
  State<UserFormDialog> createState() => _UserFormDialogState();
}

class _UserFormDialogState extends State<UserFormDialog> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  void _addUserToDatabase() {
    User newUser = User(username: username.text, password: password.text, isActive: 0);
    DatabaseHelper().insertUser(newUser);
    // Close the dialog
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Row(
        children: [
          Icon(
            Icons.person_rounded,
            size: 32,
            color: kBlackColor.withOpacity(0.8),
          ),
          const SizedBox(
            width: 15,
          ),
          const Text('Add User'),
        ],
      ),
      content: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            DefaultTextField(controller: username, label: "Username"),
            const SizedBox(
              height: 10,
            ),
            DefaultTextField(controller: password, label: "Password", isObscure: true),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            _addUserToDatabase();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: kMainColor,
            elevation: 0,
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            'Add',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
