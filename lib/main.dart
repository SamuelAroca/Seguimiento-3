import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Business Process Management',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const BusinessProcessPage(),
    );
  }
}

// Modelo de datos para AdventureWorks
class SalesOrder {
  final int salesOrderId;
  final String orderDate;
  final double totalDue;
  final String status;
  final String productCategory;
  final int customerId;

  SalesOrder({
    required this.salesOrderId,
    required this.orderDate,
    required this.totalDue,
    required this.status,
    required this.productCategory,
    required this.customerId,
  });

  factory SalesOrder.fromJson(Map<String, dynamic> json) {
    return SalesOrder(
      salesOrderId: json['SalesOrderID'],
      orderDate: json['OrderDate'],
      totalDue: json['TotalDue'].toDouble(),
      status: json['Status'],
      productCategory: json['ProductCategory'],
      customerId: json['CustomerID'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'SalesOrderID': salesOrderId,
      'OrderDate': orderDate,
      'TotalDue': totalDue,
      'Status': status,
      'ProductCategory': productCategory,
      'CustomerID': customerId,
    };
  }
}

class Product {
  final int productId;
  final String name;
  final String category;
  final double price;

  Product({
    required this.productId,
    required this.name,
    required this.category,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: json['ProductID'],
      name: json['Name'],
      category: json['Category'],
      price: json['Price'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ProductID': productId,
      'Name': name,
      'Category': category,
      'Price': price,
    };
  }
}

class Employee {
  final int employeeId;
  final String firstName;
  final String lastName;
  final String jobTitle;
  final String department;

  Employee({
    required this.employeeId,
    required this.firstName,
    required this.lastName,
    required this.jobTitle,
    required this.department,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      employeeId: json['EmployeeID'],
      firstName: json['FirstName'],
      lastName: json['LastName'],
      jobTitle: json['JobTitle'],
      department: json['Department'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'EmployeeID': employeeId,
      'FirstName': firstName,
      'LastName': lastName,
      'JobTitle': jobTitle,
      'Department': department,
    };
  }
}

class Customer {
  final int customerId;
  final String firstName;
  final String lastName;
  final String email;
  final String city;

  Customer({
    required this.customerId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.city,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      customerId: json['CustomerID'],
      firstName: json['FirstName'],
      lastName: json['LastName'],
      email: json['Email'],
      city: json['City'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'CustomerID': customerId,
      'FirstName': firstName,
      'LastName': lastName,
      'Email': email,
      'City': city,
    };
  }
}

// Datos de ejemplo de AdventureWorks
List<SalesOrder> salesOrders = [
  SalesOrder(salesOrderId: 43659, orderDate: '2024-07-01', totalDue: 23153.2339, status: 'Shipped', productCategory: 'Bikes', customerId: 29825),
  SalesOrder(salesOrderId: 43660, orderDate: '2024-07-01', totalDue: 1457.3288, status: 'Shipped', productCategory: 'Components', customerId: 29672),
  SalesOrder(salesOrderId: 43661, orderDate: '2024-07-01', totalDue: 36865.8012, status: 'Shipped', productCategory: 'Bikes', customerId: 29734),
  SalesOrder(salesOrderId: 43662, orderDate: '2024-07-02', totalDue: 32474.9324, status: 'Processing', productCategory: 'Accessories', customerId: 29994),
  SalesOrder(salesOrderId: 43663, orderDate: '2024-07-02', totalDue: 472.4742, status: 'Shipped', productCategory: 'Clothing', customerId: 29565),
  SalesOrder(salesOrderId: 43664, orderDate: '2024-07-03', totalDue: 27510.4109, status: 'Shipped', productCategory: 'Bikes', customerId: 29898),
  SalesOrder(salesOrderId: 43665, orderDate: '2024-07-03', totalDue: 16158.6961, status: 'Processing', productCategory: 'Components', customerId: 29580),
  SalesOrder(salesOrderId: 43666, orderDate: '2024-07-04', totalDue: 5694.8564, status: 'Cancelled', productCategory: 'Accessories', customerId: 29921),
];

List<Product> products = [
  Product(productId: 680, name: 'HL Road Frame - Black, 58', category: 'Bikes', price: 1431.50),
  Product(productId: 706, name: 'HL Road Frame - Red, 58', category: 'Bikes', price: 1431.50),
  Product(productId: 707, name: 'Sport-100 Helmet, Red', category: 'Accessories', price: 34.99),
  Product(productId: 708, name: 'Sport-100 Helmet, Black', category: 'Accessories', price: 34.99),
  Product(productId: 709, name: 'Mountain Bike Socks, M', category: 'Clothing', price: 9.50),
];

List<Employee> employees = [
  Employee(employeeId: 1, firstName: 'Ken', lastName: 'Sánchez', jobTitle: 'Chief Executive Officer', department: 'Executive'),
  Employee(employeeId: 2, firstName: 'Terri', lastName: 'Duffy', jobTitle: 'Vice President of Engineering', department: 'Engineering'),
  Employee(employeeId: 3, firstName: 'Roberto', lastName: 'Tamburello', jobTitle: 'Engineering Manager', department: 'Engineering'),
  Employee(employeeId: 4, firstName: 'Rob', lastName: 'Walters', jobTitle: 'Senior Tool Designer', department: 'Engineering'),
  Employee(employeeId: 5, firstName: 'Gail', lastName: 'Erickson', jobTitle: 'Design Engineer', department: 'Engineering'),
];

List<Customer> customers = [
  Customer(customerId: 29825, firstName: 'Catherine', lastName: 'Abel', email: 'catherine0@adventure-works.com', city: 'Seattle'),
  Customer(customerId: 29672, firstName: 'Kim', lastName: 'Abercrombie', email: 'kim2@adventure-works.com', city: 'Atlanta'),
  Customer(customerId: 29734, firstName: 'Humberto', lastName: 'Acevedo', email: 'humberto0@adventure-works.com', city: 'Miami'),
  Customer(customerId: 29994, firstName: 'Pilar', lastName: 'Ackerman', email: 'pilar1@adventure-works.com', city: 'Chicago'),
  Customer(customerId: 29565, firstName: 'Frances', lastName: 'Adams', email: 'frances0@adventure-works.com', city: 'Phoenix'),
];

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  // Calcular métricas reales de los datos de AdventureWorks
  Map<String, double> _getSalesByCategory() {
    Map<String, double> salesByCategory = {};
    for (var order in salesOrders) {
      salesByCategory[order.productCategory] =
          (salesByCategory[order.productCategory] ?? 0) + order.totalDue;
    }
    return salesByCategory;
  }

  Map<String, int> _getOrdersByStatus() {
    Map<String, int> ordersByStatus = {};
    for (var order in salesOrders) {
      ordersByStatus[order.status] = (ordersByStatus[order.status] ?? 0) + 1;
    }
    return ordersByStatus;
  }

  double _getTotalRevenue() {
    return salesOrders.fold(0, (sum, order) => sum + order.totalDue);
  }

  @override
  Widget build(BuildContext context) {
    final salesByCategory = _getSalesByCategory();
    final ordersByStatus = _getOrdersByStatus();
    final totalRevenue = _getTotalRevenue();

    return Scaffold(
      appBar: AppBar(
        title: const Text('AdventureWorks Analytics Dashboard'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // KPIs Row
            Row(
              children: [
                Expanded(
                  child: Card(
                    elevation: 6,
                    color: Colors.blue.shade50,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          const Icon(Icons.shopping_cart, size: 45, color: Colors.blue),
                          const SizedBox(height: 12),
                          const Text('Total Orders', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          Text('${salesOrders.length}', style: const TextStyle(fontSize: 32, color: Colors.blue, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Card(
                    elevation: 6,
                    color: Colors.green.shade50,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          const Icon(Icons.monetization_on, size: 45, color: Colors.green),
                          const SizedBox(height: 12),
                          const Text('Total Revenue', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          Text('\$${totalRevenue.toStringAsFixed(0)}', style: const TextStyle(fontSize: 26, color: Colors.green, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Card(
                    elevation: 6,
                    color: Colors.orange.shade50,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          const Icon(Icons.people, size: 45, color: Colors.orange),
                          const SizedBox(height: 12),
                          const Text('Employees', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          Text('${employees.length}', style: const TextStyle(fontSize: 32, color: Colors.orange, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Sales by Category Chart
            Card(
              elevation: 6,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Sales by Product Category',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.indigo)),
                    const SizedBox(height: 24),
                    SizedBox(
                      height: 300,
                      child: BarChart(
                        BarChartData(
                          alignment: BarChartAlignment.spaceAround,
                          maxY: salesByCategory.values.isNotEmpty
                              ? salesByCategory.values.reduce((a, b) => a > b ? a : b) * 1.2
                              : 100,
                          barTouchData: BarTouchData(
                            enabled: true,
                            touchTooltipData: BarTouchTooltipData(
                              tooltipBgColor: Colors.blueAccent,
                              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                                if (group.x >= 0 && group.x < salesByCategory.keys.length) {
                                  String category = salesByCategory.keys.elementAt(group.x);
                                  return BarTooltipItem(
                                    '$category\n\$${rod.toY.toStringAsFixed(0)}',
                                    const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                  );
                                }
                                return null;
                              },
                            ),
                          ),
                          titlesData: FlTitlesData(
                            show: true,
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (value, meta) {
                                  final categories = salesByCategory.keys.toList();
                                  if (value.toInt() >= 0 && value.toInt() < categories.length) {
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: Text(categories[value.toInt()],
                                          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                                    );
                                  }
                                  return const Text('');
                                },
                              ),
                            ),
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (value, meta) {
                                  return Text('\$${(value/1000).toStringAsFixed(0)}K',
                                      style: const TextStyle(fontSize: 10));
                                },
                              ),
                            ),
                            topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                            rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                          ),
                          gridData: FlGridData(
                            show: true,
                            drawVerticalLine: false,
                            horizontalInterval: 10000,
                            getDrawingHorizontalLine: (value) {
                              return FlLine(color: Colors.grey.shade300, strokeWidth: 1);
                            },
                          ),
                          borderData: FlBorderData(show: false),
                          barGroups: salesByCategory.entries.map((entry) {
                            int index = salesByCategory.keys.toList().indexOf(entry.key);
                            Color barColor = [Colors.indigo, Colors.teal, Colors.amber, Colors.deepOrange][index % 4];
                            return BarChartGroupData(
                              x: index,
                              barRods: [
                                BarChartRodData(
                                  toY: entry.value,
                                  color: barColor,
                                  width: 35,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8),
                                  ),
                                ),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Order Status Distribution
            Card(
              elevation: 6,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Order Status Distribution',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.indigo)),
                    const SizedBox(height: 24),
                    SizedBox(
                      height: 250,
                      child: PieChart(
                        PieChartData(
                          sections: ordersByStatus.entries.map((entry) {
                            Color color = entry.key == 'Shipped' ? Colors.green :
                                         entry.key == 'Processing' ? Colors.orange : Colors.red;
                            double percentage = salesOrders.isNotEmpty
                                ? (entry.value / salesOrders.length) * 100
                                : 0;
                            return PieChartSectionData(
                              value: entry.value.toDouble(),
                              color: color,
                              title: '${entry.key}\n${percentage.toStringAsFixed(1)}%',
                              radius: 90,
                              titleStyle: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            );
                          }).toList(),
                          centerSpaceRadius: 45,
                          sectionsSpace: 3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Top Products
            Card(
              elevation: 6,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Top Products',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.indigo)),
                    const SizedBox(height: 24),
                    ...products.take(5).map((product) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              color: Colors.primaries[product.productId % Colors.primaries.length],
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(product.name,
                                style: const TextStyle(fontSize: 13)),
                          ),
                          Text('\$${product.price.toStringAsFixed(2)}',
                              style: const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BusinessProcessPage extends StatefulWidget {
  const BusinessProcessPage({super.key});

  @override
  State<BusinessProcessPage> createState() => _BusinessProcessPageState();
}

class _BusinessProcessPageState extends State<BusinessProcessPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    DashboardPage(),
    SalesOrdersPage(),
    ProductsPage(),
    EmployeesPage(),
    CustomersPage(),
    PowerBIPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(Icons.dashboard),
            icon: Icon(Icons.dashboard_outlined),
            label: 'Dashboard',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.shopping_cart),
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Orders',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.inventory),
            icon: Icon(Icons.inventory_outlined),
            label: 'Products',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.people),
            icon: Icon(Icons.people_outline),
            label: 'Employees',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person),
            icon: Icon(Icons.person_outline),
            label: 'Customers',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.analytics),
            icon: Icon(Icons.analytics_outlined),
            label: 'Power BI',
          ),
        ],
      ),
    );
  }
}

class SalesOrdersPage extends StatefulWidget {
  const SalesOrdersPage({super.key});

  @override
  State<SalesOrdersPage> createState() => _SalesOrdersPageState();
}

class _SalesOrdersPageState extends State<SalesOrdersPage> {
  Customer? _selectedCustomer;
  String? _selectedCategory;
  String? _selectedStatus;

  List<SalesOrder> get filteredOrders {
    return salesOrders.where((order) {
      bool customerMatch = _selectedCustomer == null || order.customerId == _selectedCustomer!.customerId;
      bool categoryMatch = _selectedCategory == null || order.productCategory == _selectedCategory;
      bool statusMatch = _selectedStatus == null || order.status == _selectedStatus;
      return customerMatch && categoryMatch && statusMatch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sales Orders'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Filtros
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.grey.shade100,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<Customer>(
                        decoration: const InputDecoration(
                          labelText: 'Customer',
                          border: OutlineInputBorder(),
                        ),
                        initialValue: _selectedCustomer,
                        items: [
                          const DropdownMenuItem<Customer>(
                            value: null,
                            child: Text('All Customers'),
                          ),
                          ...customers.map((customer) => DropdownMenuItem(
                            value: customer,
                            child: Text('${customer.firstName} ${customer.lastName}'),
                          )),
                        ],
                        onChanged: (Customer? value) {
                          setState(() {
                            _selectedCustomer = value;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          labelText: 'Category',
                          border: OutlineInputBorder(),
                        ),
                        initialValue: _selectedCategory,
                        items: [
                          const DropdownMenuItem<String>(
                            value: null,
                            child: Text('All Categories'),
                          ),
                          ...['Bikes', 'Components', 'Accessories', 'Clothing'].map((category) =>
                            DropdownMenuItem(value: category, child: Text(category))),
                        ],
                        onChanged: (String? value) {
                          setState(() {
                            _selectedCategory = value;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          labelText: 'Status',
                          border: OutlineInputBorder(),
                        ),
                        initialValue: _selectedStatus,
                        items: [
                          const DropdownMenuItem<String>(
                            value: null,
                            child: Text('All Status'),
                          ),
                          ...['Shipped', 'Processing', 'Cancelled'].map((status) =>
                            DropdownMenuItem(value: status, child: Text(status))),
                        ],
                        onChanged: (String? value) {
                          setState(() {
                            _selectedStatus = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Lista de órdenes
          Expanded(
            child: ListView.builder(
              itemCount: filteredOrders.length,
              itemBuilder: (context, index) {
                final order = filteredOrders[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: order.status == 'Shipped' ? Colors.green :
                                      order.status == 'Processing' ? Colors.orange : Colors.red,
                      child: Text(order.salesOrderId.toString().substring(order.salesOrderId.toString().length - 2),
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                    title: Text('Order #${order.salesOrderId}'),
                    subtitle: Text('${order.productCategory} - ${order.orderDate}'),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('\$${order.totalDue.toStringAsFixed(2)}',
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        Text(order.status,
                            style: TextStyle(
                              color: order.status == 'Shipped' ? Colors.green :
                                     order.status == 'Processing' ? Colors.orange : Colors.red,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.primaries[product.productId % Colors.primaries.length],
                child: Text(product.productId.toString().substring(product.productId.toString().length - 2),
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
              title: Text(product.name),
              subtitle: Text(product.category),
              trailing: Text('\$${product.price.toStringAsFixed(2)}',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
          );
        },
      ),
    );
  }
}

class EmployeesPage extends StatelessWidget {
  const EmployeesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employees'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: employees.length,
        itemBuilder: (context, index) {
          final employee = employees[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.indigo,
                child: Text('${employee.firstName[0]}${employee.lastName[0]}',
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
              title: Text('${employee.firstName} ${employee.lastName}'),
              subtitle: Text('${employee.jobTitle}\n${employee.department}'),
              isThreeLine: true,
            ),
          );
        },
      ),
    );
  }
}

class CustomersPage extends StatelessWidget {
  const CustomersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customers'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: customers.length,
        itemBuilder: (context, index) {
          final customer = customers[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text('${customer.firstName[0]}${customer.lastName[0]}',
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
              title: Text('${customer.firstName} ${customer.lastName}'),
              subtitle: Text('${customer.email}\n${customer.city}'),
              isThreeLine: true,
            ),
          );
        },
      ),
    );
  }
}

class PowerBIPage extends StatefulWidget {
  const PowerBIPage({super.key});

  @override
  State<PowerBIPage> createState() => _PowerBIPageState();
}

class _PowerBIPageState extends State<PowerBIPage> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {
            debugPrint('Web resource error: ${error.description}');
          },
        ),
      )
      ..loadRequest(Uri.parse('https://app.powerbi.com/view?r=eyJrIjoiZTc0MWY4YmEtYjUxOC00NWQ2LWJhNGItOTNiYTc0M2FjZWQyIiwidCI6IjRkZDEzM2ZkLWNhMmEtNDA5OC1hZTkxLTBlYWEwYzU4MjNiOCIsImMiOjR9'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Power BI Analytics'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              _controller.reload();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.blue.shade50,
            child: const Row(
              children: [
                Icon(Icons.info, color: Colors.blue),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Power BI Dashboard - Advanced Analytics and Reporting',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: WebViewWidget(controller: _controller),
          ),
        ],
      ),
    );
  }
}
