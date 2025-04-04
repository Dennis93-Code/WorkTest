# sports_management/models/sports.py

from odoo import models, fields

class SportsEvent(models.Model):
    _name = 'sports.event'
    _description = 'Sports Event'

    name = fields.Char(string='Event Name', required=True)
    date = fields.Datetime(string='Event Date', required=True)
    location = fields.Char(string='Event Location')
    description = fields.Text(string='Event Description')

class SportsTeam(models.Model):
    _name = 'sports.team'
    _description = 'Sports Team'

    name = fields.Char(string='Team Name', required=True)
    coach = fields.Char(string='Coach Name')
    members = fields.One2many('sports.player', 'team_id', string='Players')

class SportsPlayer(models.Model):
    _name = 'sports.player'
    _description = 'Sports Player'

    name = fields.Char(string='Player Name', required=True)
    age = fields.Integer(string='Player Age')
    team_id = fields.Many2one('sports.team', string='Team')
    position = fields.Char(string='Player Position')
