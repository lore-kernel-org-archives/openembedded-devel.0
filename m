Received: from mail.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1UI2XD-0006B8-7m
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Mar 2013 20:49:23 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Mar 2013 20:32:30 +0100
Message-Id: <1363721551-8539-2-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1363721551-8539-1-git-send-email-obi@opendreambox.org>
References: <1363721551-8539-1-git-send-email-obi@opendreambox.org>
Subject: [meta-oe][PATCH 2/2] layer.conf: add ca-certificates to SIGGEN_EXCLUDERECIPES_ABISAFE
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
X-List-Received-Date: Tue, 19 Mar 2013 19:49:23 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta-oe/conf/layer.conf |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index b8a53d2..68f7823 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -29,4 +29,5 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
   fbset-modes \
   gpsd-machine-conf \
   distro-feed-configs \
+  ca-certificates \
 "
-- 
1.7.10.4



