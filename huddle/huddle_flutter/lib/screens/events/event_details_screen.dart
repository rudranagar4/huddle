import 'package:flutter/material.dart';
import 'package:huddle_client/huddle_client.dart';
import 'package:intl/intl.dart';
import '../../core/services/huddle_service.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/huddle_button.dart';
import '../../core/widgets/huddle_card.dart';

class EventDetailsScreen extends StatefulWidget {
  final CampusEvent event;

  const EventDetailsScreen({super.key, required this.event});

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  late bool _isRegistered;
  late int _registeredSeats;
  late bool _isBookmarked;
  bool _isProcessing = false;

  @override
  void initState() {
    super.initState();
    _isRegistered = HuddleService.instance.isEventRegistered(widget.event.id ?? 1);
    _registeredSeats = widget.event.registeredSeats;
    _isBookmarked = HuddleService.instance.isBookmarked('event', widget.event.id ?? 1);
  }

  void _toggleRegistration() async {
    setState(() => _isProcessing = true);
    final nowReg = await HuddleService.instance.toggleEventRegistration(widget.event.id ?? 1);
    if (!mounted) return;
    setState(() {
      _isRegistered = nowReg;
      _registeredSeats += nowReg ? 1 : -1;
      _isProcessing = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(nowReg ? Icons.check_circle_rounded : Icons.info_outline_rounded, color: Colors.white, size: 20),
            const SizedBox(width: 10),
            Text(nowReg ? 'You are successfully registered!' : 'Registration cancelled.'),
          ],
        ),
        backgroundColor: nowReg ? AppColors.cyanDark : AppColors.coral,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }

  void _toggleBookmark() async {
    final nowBookmarked = await HuddleService.instance.toggleBookmark('event', widget.event.id ?? 1);
    if (!mounted) return;
    setState(() => _isBookmarked = nowBookmarked);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(nowBookmarked ? 'Saved to your Bookmarks!' : 'Removed from Bookmarks.'),
        backgroundColor: AppColors.cyanDark,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final e = widget.event;
    final seatsLeft = (e.totalSeats - _registeredSeats).clamp(0, e.totalSeats);
    final fillRatio = (_registeredSeats / e.totalSeats).clamp(0.0, 1.0);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.navyBackgroundDark : AppColors.glassBgPure,
      body: Container(
        decoration: BoxDecoration(
          gradient: isDark ? null : AppColors.glassBackgroundGradient,
        ),
        child: CustomScrollView(
          slivers: [
            // Banner Sliver AppBar
            SliverAppBar(
              expandedHeight: 260,
              pinned: true,
              backgroundColor: isDark ? AppColors.navySurfaceDark : Colors.white,
              leading: IconButton(
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.black.withAlpha(120),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.arrow_back_ios_new_rounded, size: 16, color: Colors.white),
                ),
                onPressed: () => Navigator.pop(context),
              ),
              actions: [
                IconButton(
                  icon: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black.withAlpha(120),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      _isBookmarked ? Icons.bookmark_rounded : Icons.bookmark_border_rounded,
                      color: _isBookmarked ? AppColors.cyanBrand : Colors.white,
                      size: 20,
                    ),
                  ),
                  onPressed: _toggleBookmark,
                ),
                const SizedBox(width: 8),
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      e.bannerUrl ?? 'https://images.unsplash.com/photo-1515187029135-18ee286d815b?w=800',
                      fit: BoxFit.cover,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            isDark
                                ? AppColors.navyBackgroundDark.withAlpha(240)
                                : Colors.black.withAlpha(140),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 16,
                      left: 20,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                        decoration: BoxDecoration(
                          color: AppColors.cyanDark,
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.cyanBrand.withAlpha(70),
                              blurRadius: 8,
                            ),
                          ],
                        ),
                        child: Text(
                          e.category.toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 11,
                            letterSpacing: 0.8,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Content Details
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      e.title,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                        height: 1.25,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Organized by ${e.organizer}',
                      style: const TextStyle(
                        color: AppColors.cyanDark,
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Info Cards (Date, Time, Location)
                    HuddleCard(
                      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                      child: Column(
                        children: [
                          _infoRow(
                            Icons.calendar_today_rounded,
                            'Date',
                            DateFormat('EEEE, MMMM d, yyyy').format(e.date),
                            isDark,
                          ),
                          Divider(color: isDark ? AppColors.navyBorderDark : AppColors.glassBorderSubtle, height: 20),
                          _infoRow(
                            Icons.access_time_rounded,
                            'Time',
                            e.time,
                            isDark,
                          ),
                          Divider(color: isDark ? AppColors.navyBorderDark : AppColors.glassBorderSubtle, height: 20),
                          _infoRow(
                            Icons.location_on_outlined,
                            'Venue',
                            e.venue,
                            isDark,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Seat Availability Progress Card
                    HuddleCard(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Seat Availability',
                                style: TextStyle(
                                  color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                '$seatsLeft seats remaining',
                                style: TextStyle(
                                  color: seatsLeft < 20 ? AppColors.coral : AppColors.cyanDark,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: LinearProgressIndicator(
                              value: fillRatio,
                              minHeight: 8,
                              backgroundColor: isDark ? AppColors.navyBorderDark : AppColors.glassBorderSubtle,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                seatsLeft < 20 ? AppColors.coral : AppColors.cyanBrand,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '$_registeredSeats of ${e.totalSeats} students registered',
                            style: TextStyle(
                              color: isDark ? AppColors.textDim : AppColors.textDarkSubtle,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Event Description
                    Text(
                      'About This Event',
                      style: TextStyle(
                        color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      e.description,
                      style: TextStyle(
                        color: isDark ? AppColors.textMuted : AppColors.textDarkBody,
                        fontSize: 14,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Registration Action Bar
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Registration',
                              style: TextStyle(
                                color: isDark ? AppColors.textDim : AppColors.textDarkSubtle,
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              e.isFree ? 'FREE' : '₹${e.price?.toStringAsFixed(0)}',
                              style: TextStyle(
                                color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 24),
                        Expanded(
                          child: HuddleButton(
                            height: 52,
                            text: _isRegistered ? 'Registered (Cancel)' : 'Register Now',
                            icon: _isRegistered ? Icons.check_circle_rounded : Icons.confirmation_number_outlined,
                            isLoading: _isProcessing,
                            customColor: _isRegistered ? AppColors.coral : null,
                            onPressed: _toggleRegistration,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(IconData icon, String title, String value, bool isDark) {
    return Row(
      children: [
        Icon(icon, color: AppColors.cyanDark, size: 20),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: isDark ? AppColors.textDim : AppColors.textDarkSubtle,
                fontSize: 11,
              ),
            ),
            Text(
              value,
              style: TextStyle(
                color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                fontWeight: FontWeight.w700,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
