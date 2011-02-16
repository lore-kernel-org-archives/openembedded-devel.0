Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1Ppeic-0000xB-IE
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 11:34:46 +0100
Received: (qmail 19754 invoked by uid 503); 16 Feb 2011 11:16:16 -0000
Received: from b9.ovh.net (HELO mail239.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 16 Feb 2011 11:16:16 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 16 Feb 2011 12:33:35 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 16 Feb 2011 12:33:34 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Feb 2011 11:33:46 +0100
Message-Id: <1297852433-31160-2-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1297852433-31160-1-git-send-email-eric@eukrea.com>
References: <1297852433-31160-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 12105112849527516490
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: [PATCH 02/10] gnokii-0.6.14: fix download link
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
X-List-Received-Date: Wed, 16 Feb 2011 10:34:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/gnokii/gnokii_0.6.14.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/gnokii/gnokii_0.6.14.bb b/recipes/gnokii/gnokii_0.6.14.bb
index 569d9a2..f3e968a 100644
--- a/recipes/gnokii/gnokii_0.6.14.bb
+++ b/recipes/gnokii/gnokii_0.6.14.bb
@@ -1,6 +1,6 @@
 LICENSE = "GPL"
 DESCRIPTION = "Cellphone tools and driver software"
-SRC_URI = "http://www.gnokii.org/download/gnokii/gnokii-${PV}.tar.bz2 \
+SRC_URI = "http://www.gnokii.org/download/gnokii/0.6.x/gnokii-${PV}.tar.bz2 \
 	file://configure.patch"
 
 DEPENDS = "libxpm gtk+"
-- 
1.7.0.4



