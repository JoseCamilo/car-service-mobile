import 'package:flutter/material.dart';

class DashboardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<ItemDashboardWidget> _dashboardGridHome = [
      ItemDashboardWidget(
        title: 'Lavagem',
        icon: Icons.auto_awesome,
        onClick: () => _showWash(context),
      ),
      ItemDashboardWidget(
        title: 'Pneu',
        icon: Icons.album_outlined,
        onClick: () => _showTire(context),
      ),
      ItemDashboardWidget(
        title: 'Óleo',
        icon: Icons.invert_colors_on_outlined,
        onClick: () => _showOil(context),
      ),
      ItemDashboardWidget(
        title: 'Elétrica',
        icon: Icons.flash_on_outlined,
        onClick: () => _showEletric(context),
      ),
      ItemDashboardWidget(
        title: 'Mecânica',
        icon: Icons.build_outlined,
        onClick: () => _showMechanics(context),
      ),
      ItemDashboardWidget(
        title: 'Funilaria',
        icon: Icons.auto_fix_high,
        onClick: () => _showBody(context),
      ),
    ];
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 0,
        crossAxisSpacing: 0,
        childAspectRatio: 1.5,
        crossAxisCount: 3,
      ),
      delegate: SliverChildListDelegate(
        _dashboardGridHome,
      ),
    );
  }
}

class ItemDashboardWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onClick;

  ItemDashboardWidget({
    @required this.title,
    @required this.icon,
    @required this.onClick,
  })  : assert(title != null),
        assert(icon != null),
        assert(onClick != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        color: Theme.of(context).primaryColor,
        child: InkWell(
          borderRadius: BorderRadius.circular(8.0),
          onTap: this.onClick,
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  this.icon,
                  color: Colors.white,
                  size: 30,
                ),
                Text(
                  this.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void _showWash(BuildContext context) {
  Navigator.of(context).pushNamed(
    'filter-dashboard',
    arguments: {
      'title': 'Lavagem',
      'subscription': 'WASH',
    },
  );
}

void _showTire(BuildContext context) {
  Navigator.of(context).pushNamed(
    'filter-dashboard',
    arguments: {
      'title': 'Pneu',
      'subscription': 'TIRE',
    },
  );
}

void _showOil(BuildContext context) {
  Navigator.of(context).pushNamed(
    'filter-dashboard',
    arguments: {
      'title': 'Óleo',
      'subscription': 'OIL',
    },
  );
}

void _showEletric(BuildContext context) {
  Navigator.of(context).pushNamed(
    'filter-dashboard',
    arguments: {
      'title': 'Elétrica',
      'subscription': 'ELETRIC',
    },
  );
}

void _showMechanics(BuildContext context) {
  Navigator.of(context).pushNamed(
    'filter-dashboard',
    arguments: {
      'title': 'Mecânica',
      'subscription': 'MECHANIC',
    },
  );
}

void _showBody(BuildContext context) {
  Navigator.of(context).pushNamed(
    'filter-dashboard',
    arguments: {
      'title': 'Funilaria',
      'subscription': 'BODY',
    },
  );
}
