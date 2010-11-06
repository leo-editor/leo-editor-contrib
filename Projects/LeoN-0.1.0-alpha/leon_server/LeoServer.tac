#!/usr/bin/env python2.3
# -*- coding: utf-8 -*-
#@+leo-ver=4
#@+node:@file LeoServer.tac
#@@first
#@@first

#@<<legal declaration>>
#@+node:<< legal declaration >>
#@+at
# LeoN version 0.1.0 alpha, "Feux d'artifice".
# LeoN project. Leo over Network.
# Rodrigo Benenson 2003, 2004. <rodrigo_b at users dot sourceforge dot net>
# http://souvenirs.sf.net, http://leo.sf.net.
# 
# The collaborative editing code is based research papers of Chengzheng Sun.
# 
# This code is released under GNU GPL.
# The license is aviable at 'LeoN.leo/LeoN/Docs/GNU GPL' or in the web 
# http://www.gnu.org .
# 
# ---
# This file is part of LeoN.
# 
# LeoN is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
# 
# LeoN is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with LeoN; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
# ---
#@-at
#@@c
#@nonl
#@-node:<< legal declaration >>
#@nl

#@+at    
#     This is the LeoServer '.tac' file (twisted application configuration).
#     Used in the twisted framework to create twisted applications, '.tap' 
# files (twisted application persisted).
#     'twistd -y LeoServer.tac' will create a deployable '.tap' file.
#     'twistd -noy LeoServer.tac' can be used for debugging purposes.
#     This '.tac' create clean projects, with a definition for "user1" and 
# "admin_user" (passwords "pass1" and "admin" respectively).
#     You can also use "LeoNtest.py just_server save_tap", to create a non 
# void '.tap' file, with the same users.
#@-at
#@@c

from LeoServer import create_application

application = create_application()
#@-node:@file LeoServer.tac
#@-leo
