Return-Path: <luca@lucaceresoli.net>
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net
	[89.40.174.40])
	by mail.openembedded.org (Postfix) with ESMTP id 513CF7ED8E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jul 2019 15:33:47 +0000 (UTC)
Received: from [109.168.11.45] (port=55732 helo=pc-ceresoli.dev.aim)
	by hostingweb31.netsons.net with esmtpa (Exim 4.92)
	(envelope-from <luca@lucaceresoli.net>)
	id 1hn2Hu-005I7b-Kq; Mon, 15 Jul 2019 16:49:10 +0200
From: Luca Ceresoli <luca@lucaceresoli.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Jul 2019 16:48:59 +0200
Message-Id: <20190715144901.25305-2-luca@lucaceresoli.net>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715144901.25305-1-luca@lucaceresoli.net>
References: <20190715144901.25305-1-luca@lucaceresoli.net>
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id:
	luca+lucaceresoli.net/only user confirmed/virtual account not
	confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: Luca Ceresoli <luca@lucaceresoli.net>, Richard Weinberger <richard@nod.at>
Subject: [meta-filesystems][PATCH 2/4] exfat-utils: moved to github
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Jul 2019 15:33:47 -0000
Content-Transfer-Encoding: 8bit

exfat-utils has been moved long ago to github. Update HOMEPAGE.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 meta-filesystems/recipes-utils/exfat-utils/exfat-utils_1.2.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-filesystems/recipes-utils/exfat-utils/exfat-utils_1.2.3.bb b/meta-filesystems/recipes-utils/exfat-utils/exfat-utils_1.2.3.bb
index 440f336184d9..f423a248c2f0 100644
--- a/meta-filesystems/recipes-utils/exfat-utils/exfat-utils_1.2.3.bb
+++ b/meta-filesystems/recipes-utils/exfat-utils/exfat-utils_1.2.3.bb
@@ -7,7 +7,7 @@ contains \
  - exfatlabel to label a exFAT filesystem \
  - mkexfatfs / mkfs.exfat to create a exFAT filesystem. \
 "
-HOMEPAGE = "http://code.google.com/p/exfat/"
+HOMEPAGE = "https://github.com/relan/exfat"
 SECTION = "universe/otherosfs"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-- 
2.22.0


