Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SM78d-00025t-G0
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Apr 2012 02:28:19 +0200
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Apr 2012 02:18:43 +0200
Message-Id: <1335140323-10305-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.5.4
Subject: [meta-oe][PATCH] oe-stylize.py: Add SUMMARY variable
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
X-List-Received-Date: Mon, 23 Apr 2012 00:28:19 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 contrib/oe-stylize.py |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/contrib/oe-stylize.py b/contrib/oe-stylize.py
index e254b6a..07ed4f6 100755
--- a/contrib/oe-stylize.py
+++ b/contrib/oe-stylize.py
@@ -28,6 +28,7 @@ __version__ = "$Revision: 0.5 $"
 
 # The standard set of variables often found in .bb files in the preferred order
 OE_vars = [
+    'SUMMARY',
     'DESCRIPTION',
     'AUTHOR',
     'HOMEPAGE',
-- 
1.7.5.4



