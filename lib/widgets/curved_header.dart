import 'package:flutter/material.dart';

class CurvedHeader extends StatelessWidget {
  final String title;
  final bool showMenu;
  final VoidCallback? onMenuTap;

  const CurvedHeader({
    super.key,
    required this.title,
    this.showMenu = false,
    this.onMenuTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: 140,
      child: Stack(
        children: [
          // background curved
          ClipPath(
            clipper: _HeaderClipper(),
            child: Container(
              height: 140,
              color: theme.primaryColor,
              alignment: Alignment.center,
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          if (showMenu)
            Positioned(
              top: 16,
              left: 16,
              child: InkWell(
                onTap: onMenuTap,
                borderRadius: BorderRadius.circular(28),
                child: Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 8,
                        color: Colors.black12,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Icon(Icons.menu, color: theme.primaryColor),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(
      size.width / 2,
      size.height + 10,
      size.width,
      size.height - 40,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
