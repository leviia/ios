//
//  NCBridgeSwift.h
//  Nextcloud
//
//  Created by Marino Faggiana on 11/05/17.
//  Copyright © 2017 Marino Faggiana. All rights reserved.
//
//  Author Marino Faggiana <marino.faggiana@nextcloud.com>
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.
//

//
// App bridge swift
//
// change
// from   : Nextcloud-Swift.h
// to     : brand-Swift.h
//
#if !defined(EXTENSION)
#import "${leviia_app_name}-Swift.h"
#endif

// Nextcloud Share
#if defined(EXTENSION_SHARE)
#import "Share-Swift.h"
#endif

// Nextcloud File Provider Extension
#if defined(EXTENSION_FILE_PROVIDER_EXTENSION)
#import "File_Provider_Extension-Swift.h"
#endif

// Nextcloud Notification Service Extension
#if defined(EXTENSION_NOTIFICATION_SERVICE)
#import "Notification_Service_Extension-Swift.h"
#endif
