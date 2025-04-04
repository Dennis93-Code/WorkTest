# sports_management/__manifest__.py
{
    'name': 'Sports Management',
    'version': '1.0',
    'category': 'Management',
    'depends': ['base', 'website'],
    'data': [
        'views/sports_overview_views.xml',
        'views/sports_event_views.xml',
        'views/sports_team_views.xml',
        'views/sports_player_views.xml'
    ],
    'installable': True,
    'application': True,
}
