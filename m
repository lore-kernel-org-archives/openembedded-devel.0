Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1ROGXm-0004Hr-3i
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Nov 2011 23:22:54 +0100
Received: (qmail invoked by alias); 09 Nov 2011 22:16:37 -0000
Received: from p5B0A37AB.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.55.171]
	by mail.gmx.net (mp013) with SMTP; 09 Nov 2011 23:16:37 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19NrRpbKNZNEfzgKOz5O1LPoXZ+H42OCKYTE/ge4P
	16tISSK74kAhFR
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 9 Nov 2011 23:21:33 +0100
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-100.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
MIME-Version: 1.0
Message-Id: <201111092321.33622.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: systemd packages -> image
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Nov 2011 22:22:54 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

Imagine a recipe is included into an image by a task and later gets systemd-
native support.
How about forcing the packages in SYSTEMD_PACKAGES packed into images in case 

IMAGE_INIT_MANAGER  = "systemd"

is found in the image definition?

Andreas


