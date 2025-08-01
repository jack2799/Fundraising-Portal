import 'package:flutter/material.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  // Mock leaderboard data
  List<Map<String, dynamic>> get _leaderboardData => [
    {
      'rank': 1,
      'name': 'Alex Chen',
      'donations': 125000,
      'currency': '₹',
      'avatar': 'AC',
      'isCurrentUser': false,
    },
    {
      'rank': 2,
      'name': 'Priya Sharma',
      'donations': 98000,
      'currency': '₹',
      'avatar': 'PS',
      'isCurrentUser': false,
    },
    {
      'rank': 3,
      'name': 'Sarah Johnson',
      'donations': 75000,
      'currency': '₹',
      'avatar': 'SJ',
      'isCurrentUser': true,
    },
    {
      'rank': 4,
      'name': 'Michael Rodriguez',
      'donations': 62000,
      'currency': '₹',
      'avatar': 'MR',
      'isCurrentUser': false,
    },
    {
      'rank': 5,
      'name': 'Emma Wilson',
      'donations': 45000,
      'currency': '₹',
      'avatar': 'EW',
      'isCurrentUser': false,
    },
  ];

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

          // Leaderboard List
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(padding),
              itemCount: _leaderboardData.length,
              itemBuilder: (context, index) {
                return _buildLeaderboardItem(_leaderboardData[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderSection() {
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
          const Icon(Icons.emoji_events, color: Colors.white, size: 40),
          const SizedBox(height: 12),
          const Text(
            'Top Fundraisers',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'This Month',
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeaderboardItem(Map<String, dynamic> item) {
    final rank = item['rank'] as int;
    final name = item['name'] as String;
    final donations = item['donations'] as int;
    final currency = item['currency'] as String;
    final avatar = item['avatar'] as String;
    final isCurrentUser = item['isCurrentUser'] as bool;

    // Define rank colors
    Color rankColor;
    IconData rankIcon;

    switch (rank) {
      case 1:
        rankColor = Colors.amber;
        rankIcon = Icons.looks_one;
        break;
      case 2:
        rankColor = Colors.grey;
        rankIcon = Icons.looks_two;
        break;
      case 3:
        rankColor = Colors.orange;
        rankIcon = Icons.looks_3;
        break;
      default:
        rankColor = Colors.grey[400]!;
        rankIcon = Icons.circle;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: isCurrentUser
            ? const Color(0xFF667eea).withOpacity(0.1)
            : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: isCurrentUser
            ? Border.all(color: const Color(0xFF667eea), width: 2)
            : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          constraints: const BoxConstraints(maxWidth: 80),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Rank indicator
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: rankColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(rankIcon, color: Colors.white, size: 16),
              ),
              const SizedBox(width: 8),
              // Avatar
              CircleAvatar(
                radius: 16,
                backgroundColor: isCurrentUser
                    ? const Color(0xFF667eea)
                    : Colors.grey[300],
                child: Text(
                  avatar,
                  style: TextStyle(
                    color: isCurrentUser ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
        title: Row(
          children: [
            Expanded(
              child: Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isCurrentUser ? const Color(0xFF667eea) : Colors.black,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (isCurrentUser) ...[
              const SizedBox(width: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFF667eea),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'YOU',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ],
        ),
        subtitle: Text(
          'Rank #$rank',
          style: TextStyle(color: Colors.grey[600], fontSize: 12),
        ),
        trailing: Container(
          constraints: const BoxConstraints(maxWidth: 70),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '$currency${donations.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                'raised',
                style: TextStyle(fontSize: 10, color: Colors.grey[600]),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
