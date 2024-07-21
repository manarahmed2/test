import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/team_provider.dart';

class TeamsScreen extends StatefulWidget {
  @override
  _TeamsScreenState createState() => _TeamsScreenState();
}

class _TeamsScreenState extends State<TeamsScreen> {
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadTeams();
  }

  void _loadTeams() async {
    try {
      // الحصول على defaultLeagueId من TeamProvider
      final teamProvider = Provider.of<TeamProvider>(context, listen: false);
      await teamProvider.fetchLeagueTeams(teamProvider.defaultLeagueId);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load teams: $e')),
      );
    }
  }

  void _searchTeam() {
    final searchQuery = _searchController.text.trim();
    if (searchQuery.isNotEmpty) {
      Provider.of<TeamProvider>(context, listen: false).searchTeam(searchQuery);
    } else {
      _loadTeams();
    }
  }

  @override
  Widget build(BuildContext context) {
    final teamProvider = Provider.of<TeamProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Teams'),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                fillColor: Colors.amber,
                labelText: 'Search for a team',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: (_) => _searchTeam(),
            ),
          ),
          Expanded(
            child: teamProvider.teams.isEmpty
                ? Center(child: Text('No teams found'))
                : GridView.builder(
                    padding: EdgeInsets.all(16.0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      childAspectRatio: 1.0,
                    ),
                    itemCount: teamProvider.teams.length,
                    itemBuilder: (context, index) {
                      final team = teamProvider.teams[index];
                      return Card(
                        elevation: 3.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: InkWell(
                          onTap: () {
                            // Handle team tap action
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                team.teamLogo ?? '',
                                height: 80.0,
                                width: 80.0,
                                fit: BoxFit.contain,
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                team.teamName ?? 'Unknown',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              ),
                              SizedBox(height: 4.0),
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
