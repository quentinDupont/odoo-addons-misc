# -*- encoding: utf-8 -*-
##############################################################################
#
#    Point Of Sale - Tare module for OpenERP
#    Copyright (C) 2015-Today GRAP (http://www.grap.coop)
#    @author Sylvain LE GAL (https://twitter.com/legalsylvain)
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU Affero General Public License as
#    published by the Free Software Foundation, either version 3 of the
#    License, or (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU Affero General Public License for more details.
#
#    You should have received a copy of the GNU Affero General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
##############################################################################

{
    'name': 'Point Of Sale - Tare',
    'summary': 'Manage Tare in Point Of Sale module',
    'version': '0.1',
    'category': 'Point Of Sale',
    'description': """
Manage Tare in Point Of Sale module
===================================

Functionality:
--------------
    * Give the possibility to the user to provide Gross weight and Tare weight.
      This will compute automatically net weight and set it to the current
      selected product;

Limit:
    * For the moment, this module disable Scale functionnality;

Copyright, Authors and Licence:
-------------------------------
    * Copyright: 2015, GRAP: Groupement Régional Alimentaire de Proximité;
    * Author:
        * Sylvain LE GAL (https://twitter.com/legalsylvain);
    * Licence: AGPL-3 (http://www.gnu.org/licenses/);""",
    'author': 'GRAP',
    'website': 'http://www.grap.coop',
    'license': 'AGPL-3',
    'depends': [
        'point_of_sale',
    ],
    'css': [
        'static/src/css/pt.css',
    ],
    'js': [
        'static/src/js/pt.js',
    ],
    'qweb': [
        'static/src/xml/pt.xml',
    ],
}
