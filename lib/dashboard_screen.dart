import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  // Dummy data - in real app this would come from API/database
  Map<String, dynamic> get _dummyData => {
    'internName': 'Sarah Johnson',
    'referralCode': 'sarah2025',
    'totalDonations': 7500,
    'currency': '₹',
    'rewards': [
      {
        'title': 'Bronze Badge',
        'description': 'First donation milestone',
        'icon': Icons.emoji_events,
        'color': Colors.orange,
        'unlocked': true,
      },
      {
        'title': 'Silver Badge',
        'description': '₹5,000 raised',
        'icon': Icons.workspace_premium,
        'color': Colors.grey,
        'unlocked': true,
      },
      {
        'title': 'Gold Badge',
        'description': '₹10,000 raised',
        'icon': Icons.diamond,
        'color': Colors.amber,
        'unlocked': false,
      },
      {
        'title': 'Platinum Badge',
        'description': '₹25,000 raised',
        'icon': Icons.star,
        'color': Colors.blue,
        'unlocked': false,
      },
      {
        'title': 'Diamond Badge',
        'description': '₹50,000 raised',
        'icon': Icons.auto_awesome,
        'color': Colors.purple,
        'unlocked': false,
      },
      {
        'title': 'Master Fundraiser',
        'description': '₹100,000 raised',
        'icon': Icons.psychology,
        'color': Colors.red,
        'unlocked': false,
      },
    ],
    'recentDonations': [
      {'amount': 500, 'donor': 'Anonymous', 'date': '2 days ago'},
      {'amount': 1000, 'donor': 'John Doe', 'date': '1 week ago'},
      {'amount': 250, 'donor': 'Jane Smith', 'date': '2 weeks ago'},
    ],
  };

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 600;
    final padding = isSmallScreen ? 16.0 : 24.0;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        padding: EdgeInsets.all(padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Section
            _buildWelcomeSection(),
            const SizedBox(height: 24),

            // Stats Cards
            _buildStatsSection(),
            const SizedBox(height: 24),

            // Referral Code Section
            _buildReferralSection(context),
            const SizedBox(height: 24),

            // Rewards Section
            _buildRewardsSection(),
            const SizedBox(height: 24),

            // Recent Donations
            _buildRecentDonationsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF667eea), Color(0xFF764ba2)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white.withOpacity(0.2),
            child: const Icon(Icons.person, color: Colors.white, size: 30),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome back,',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  _dummyData['internName'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsSection() {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            title: 'Total Raised',
            value:
                '${_dummyData['currency']}${_dummyData['totalDonations'].toStringAsFixed(0)}',
            icon: Icons.trending_up,
            color: Colors.green,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildStatCard(
            title: 'Donations',
            value: '${_dummyData['recentDonations'].length}',
            icon: Icons.favorite,
            color: Colors.red,
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 12),
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(title, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
        ],
      ),
    );
  }

  Widget _buildReferralSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.share, color: Color(0xFF667eea)),
              const SizedBox(width: 8),
              const Text(
                'Your Referral Code',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF667eea).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: const Color(0xFF667eea).withOpacity(0.3),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    _dummyData['referralCode'],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF667eea),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.copy),
                  onPressed: () {
                    // Copy to clipboard
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Referral code copied!'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRewardsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Rewards & Badges',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.2,
          ),
          itemCount: _dummyData['rewards'].length,
          itemBuilder: (context, index) {
            final reward = _dummyData['rewards'][index];
            return _buildRewardCard(reward);
          },
        ),
      ],
    );
  }

  Widget _buildRewardCard(Map<String, dynamic> reward) {
    final isUnlocked = reward['unlocked'] as bool;

    return Container(
      decoration: BoxDecoration(
        color: isUnlocked ? Colors.white : Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        boxShadow: isUnlocked
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
        border: isUnlocked ? null : Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            reward['icon'],
            size: 40,
            color: isUnlocked ? reward['color'] : Colors.grey[400],
          ),
          const SizedBox(height: 8),
          Text(
            reward['title'],
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: isUnlocked ? Colors.black : Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            reward['description'],
            style: TextStyle(
              fontSize: 12,
              color: isUnlocked ? Colors.grey[600] : Colors.grey[500],
            ),
            textAlign: TextAlign.center,
          ),
          if (!isUnlocked) ...[
            const SizedBox(height: 4),
            Icon(Icons.lock, size: 16, color: Colors.grey[400]),
          ],
        ],
      ),
    );
  }

  Widget _buildRecentDonationsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Recent Donations',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _dummyData['recentDonations'].length,
            itemBuilder: (context, index) {
              final donation = _dummyData['recentDonations'][index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: const Color(0xFF667eea).withOpacity(0.1),
                  child: const Icon(Icons.favorite, color: Color(0xFF667eea)),
                ),
                title: Text(
                  donation['donor'],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(donation['date']),
                trailing: Text(
                  '${_dummyData['currency']}${donation['amount']}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
