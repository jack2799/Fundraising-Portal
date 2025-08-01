import 'package:flutter/material.dart';

class AnnouncementsScreen extends StatelessWidget {
  const AnnouncementsScreen({super.key});

  // Dummy announcements data
  List<Map<String, dynamic>> get _announcementsData => [
    {
      'title': '🎉 New Milestone Reached!',
      'message':
          'Congratulations! Our fundraising campaign has reached ₹50,000 in total donations. Thank you to all our amazing fundraisers for making this possible.',
      'date': '2 hours ago',
      'type': 'success',
      'isRead': false,
    },
    {
      'title': '📢 Weekly Challenge Update',
      'message':
          'This week\'s challenge: Raise ₹5,000 in 7 days and earn a special "Speed Fundraiser" badge. The challenge ends on Sunday at midnight.',
      'date': '1 day ago',
      'type': 'challenge',
      'isRead': false,
    },
    {
      'title': '🔔 New Feature Available',
      'message':
          'You can now share your fundraising progress directly to social media. Use the new "Share Progress" button in your dashboard.',
      'date': '3 days ago',
      'type': 'info',
      'isRead': true,
    },
    {
      'title': '🏆 Leaderboard Reset',
      'message':
          'Monthly leaderboard has been reset. New rankings are now live. Check where you stand and keep up the great work!',
      'date': '1 week ago',
      'type': 'info',
      'isRead': true,
    },
    {
      'title': '💝 Special Reward Unlocked',
      'message':
          'You\'ve earned the "First Donation" badge! Share this achievement with your network to inspire others to join the cause.',
      'date': '1 week ago',
      'type': 'reward',
      'isRead': true,
    },
    {
      'title': '📱 App Update Available',
      'message':
          'A new version of the fundraising app is available. Update now to get the latest features and bug fixes.',
      'date': '2 weeks ago',
      'type': 'update',
      'isRead': true,
    },
    {
      'title': '🎯 Monthly Goal Set',
      'message':
          'Your monthly fundraising goal has been set to ₹25,000. You\'re currently at 60% of your target. Keep going!',
      'date': '2 weeks ago',
      'type': 'goal',
      'isRead': true,
    },
    {
      'title': '🌟 Community Spotlight',
      'message':
          'Sarah Johnson has been featured in our community spotlight for raising ₹75,000 this month. Read her inspiring story!',
      'date': '3 weeks ago',
      'type': 'community',
      'isRead': true,
    },
  ];

  Color _getTypeColor(String type) {
    switch (type) {
      case 'success':
        return Colors.green;
      case 'challenge':
        return Colors.orange;
      case 'reward':
        return Colors.purple;
      case 'update':
        return Colors.blue;
      case 'goal':
        return Colors.teal;
      case 'community':
        return Colors.pink;
      default:
        return Colors.grey;
    }
  }

  IconData _getTypeIcon(String type) {
    switch (type) {
      case 'success':
        return Icons.celebration;
      case 'challenge':
        return Icons.emoji_events;
      case 'reward':
        return Icons.card_giftcard;
      case 'update':
        return Icons.system_update;
      case 'goal':
        return Icons.track_changes;
      case 'community':
        return Icons.people;
      default:
        return Icons.info;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 600;
    final padding = isSmallScreen ? 16.0 : 24.0;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Column(
        children: [
          // Header Section
          _buildHeaderSection(),

          // Announcements List
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(padding),
              itemCount: _announcementsData.length,
              itemBuilder: (context, index) {
                return _buildAnnouncementItem(
                  _announcementsData[index],
                  context,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderSection() {
    final unreadCount = _announcementsData
        .where((item) => !item['isRead'])
        .length;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF667eea), Color(0xFF764ba2)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          const Icon(Icons.campaign, color: Colors.white, size: 40),
          const SizedBox(height: 12),
          const Text(
            'Announcements',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            unreadCount > 0 ? '$unreadCount unread messages' : 'All caught up!',
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnnouncementItem(
    Map<String, dynamic> item,
    BuildContext context,
  ) {
    final title = item['title'] as String;
    final message = item['message'] as String;
    final date = item['date'] as String;
    final type = item['type'] as String;
    final isRead = item['isRead'] as bool;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: isRead
            ? Colors.white
            : const Color(0xFF667eea).withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: isRead
            ? null
            : Border.all(color: const Color(0xFF667eea), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: _getTypeColor(type).withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(_getTypeIcon(type), color: _getTypeColor(type), size: 24),
        ),
        title: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: isRead ? FontWeight.normal : FontWeight.bold,
                  color: isRead ? Colors.black : const Color(0xFF667eea),
                ),
              ),
            ),
            if (!isRead)
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Color(0xFF667eea),
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Text(
              message,
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 14,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.access_time, size: 12, color: Colors.grey[500]),
                const SizedBox(width: 4),
                Text(
                  date,
                  style: TextStyle(color: Colors.grey[500], fontSize: 12),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: _getTypeColor(type).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    type.toUpperCase(),
                    style: TextStyle(
                      color: _getTypeColor(type),
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        onTap: () {
          // Handle announcement tap
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Opening: $title'),
              backgroundColor: _getTypeColor(type),
            ),
          );
        },
      ),
    );
  }
}
