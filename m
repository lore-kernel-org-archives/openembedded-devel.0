Received: from 31.mail-out.ovh.net ([213.186.62.10])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PyobS-00051g-Cx
	for openembedded-devel@lists.openembedded.org;
	Sun, 13 Mar 2011 17:57:14 +0100
Received: (qmail 28670 invoked by uid 503); 13 Mar 2011 17:40:22 -0000
Received: from b7.ovh.net (HELO mail97.ha.ovh.net) (213.186.33.57)
	by 31.mail-out.ovh.net with SMTP; 13 Mar 2011 17:40:22 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 13 Mar 2011 18:55:36 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 13 Mar 2011 18:55:34 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 13 Mar 2011 17:57:04 +0100
Message-Id: <1300035425-15984-3-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1300035425-15984-1-git-send-email-eric@eukrea.com>
References: <1300035425-15984-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 17799914579356134731
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: [PATCH 3/4] slugos: prefer busybox 1.18.4
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
X-List-Received-Date: Sun, 13 Mar 2011 16:57:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Eric Bénard <eric@eukrea.com>
Cc: Mike Westerhof <mike@mwester.net>
---
 conf/distro/include/preferred-slugos-versions.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/distro/include/preferred-slugos-versions.inc b/conf/distro/include/preferred-slugos-versions.inc
index b1b3255..b864dac 100644
--- a/conf/distro/include/preferred-slugos-versions.inc
+++ b/conf/distro/include/preferred-slugos-versions.inc
@@ -24,7 +24,7 @@ PREFERRED_VERSION_autoconf			?= "2.65"
 PREFERRED_VERSION_autoconf-native		?= "2.65"
 PREFERRED_VERSION_automake			?= "1.11.1"
 PREFERRED_VERSION_automake-native		?= "1.11.1"
-PREFERRED_VERSION_busybox			?= "1.18.3"
+PREFERRED_VERSION_busybox			?= "1.18.4"
 PREFERRED_VERSION_dbus				?= "1.4.1"
 PREFERRED_VERSION_glib-2.0			?= "2.26.1"
 PREFERRED_VERSION_glib-2.0-native		?= "2.26.1"
-- 
1.7.0.4



