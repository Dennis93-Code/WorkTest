# sports_management/controllers/main.py

from odoo import http
from odoo.http import request

class SportsManagement(http.Controller):

    @http.route('/sports/events', auth='public', website=True)
    def sports_events(self):
        events = request.env['sports.event'].search([])
        return request.render('sports_management.sports_event_template', {
            'events': events
        })

    @http.route('/sports/teams', auth='public', website=True)
    def sports_teams(self):
        teams = request.env['sports.team'].search([])
        return request.render('sports_management.sports_team_template', {
            'teams': teams
        })

    @http.route('/sports/players', auth='public', website=True)
    def sports_players(self):
        players = request.env['sports.player'].search([])
        return request.render('sports_management.sports_player_template', {
            'players': players
        })
