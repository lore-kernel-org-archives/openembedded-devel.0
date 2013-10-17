Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 643436CD0E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2013 11:50:21 +0000 (UTC)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Oct 2013 13:50:20 +0200
Message-Id: <1382010620-6944-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1382009929-6537-1-git-send-email-obi@opendreambox.org>
References: <1382009929-6537-1-git-send-email-obi@opendreambox.org>
Subject: [meta-filesystems][PATCH v2] xfsprogs: change DESCRIPTION to SUMMARY
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
X-List-Received-Date: Thu, 17 Oct 2013 11:50:22 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.1.11.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.1.11.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.1.11.bb
index ceb0ddf..1dc6f09 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.1.11.bb
+++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.1.11.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "XFS Filesystem Utilities"
+SUMMARY = "XFS Filesystem Utilities"
 HOMEPAGE = "http://oss.sgi.com/projects/xfs"
 SECTION = "base"
 LICENSE = "GPLv2"
-- 
1.8.1.2


