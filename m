Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 2C6356CD0E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2013 11:38:14 +0000 (UTC)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Oct 2013 13:38:11 +0200
Message-Id: <1382009891-6444-2-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1382009891-6444-1-git-send-email-obi@opendreambox.org>
References: <1382009891-6444-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH 2/2] autofs: change DESCRIPTION to SUMMARY
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Oct 2013 11:38:15 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb b/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb
index 905be40..f8df0ef 100644
--- a/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb
+++ b/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Kernel based automounter for linux."
+SUMMARY = "Kernel based automounter for linux."
 SECTION = "base"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
-- 
1.8.1.2


