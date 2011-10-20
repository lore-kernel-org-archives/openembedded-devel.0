Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RGzOL-00077U-RU
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Oct 2011 22:39:07 +0200
Received: (qmail invoked by alias); 20 Oct 2011 20:33:12 -0000
Received: from p4FDF0EB6.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.14.182]
	by mail.gmx.net (mp007) with SMTP; 20 Oct 2011 22:33:12 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/6W4AjB3H6U9ZrSLcw0AewP/PTfrzbnsXnBu5KBi
	SwOp21amvTM+Bc
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Oct 2011 22:37:52 +0200
Message-Id: <1319143073-23469-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-xfce 0/1] xfce4-icon-theme: initial add 4.4.3
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
X-List-Received-Date: Thu, 20 Oct 2011 20:39:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

For those used to xfce icons (there a only few differences to gnome-icon-theme)
xfce-icon-theme is added. It is optional and not made default again in 
xfce4-settings. Many other recipes insist on gnome-icon-theme and if 
users do not add xfce-icon-theme, image is not blown up unnecessarily.

Andreas Müller (1):
  xfce4-icon-theme: initial add 4.4.3

 .../xfce4-icon-theme/xfce4-icon-theme_4.4.3.bb     |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-art/xfce4-icon-theme/xfce4-icon-theme_4.4.3.bb

-- 
1.7.4.4



