Return-Path: <luca@lucaceresoli.net>
X-Greylist: delayed 2461 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 15 Jul 2019 15:30:11 UTC
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net
	[89.40.174.40])
	by mail.openembedded.org (Postfix) with ESMTP id 1EF957EE5F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jul 2019 15:30:11 +0000 (UTC)
Received: from [109.168.11.45] (port=55732 helo=pc-ceresoli.dev.aim)
	by hostingweb31.netsons.net with esmtpa (Exim 4.92)
	(envelope-from <luca@lucaceresoli.net>)
	id 1hn2Hv-005I7b-1G; Mon, 15 Jul 2019 16:49:11 +0200
From: Luca Ceresoli <luca@lucaceresoli.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Jul 2019 16:49:01 +0200
Message-Id: <20190715144901.25305-4-luca@lucaceresoli.net>
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
Subject: [meta-filesystems][PATCH 4/4] exfat-utils: update 1.2.3 -> 1.3.0
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
X-List-Received-Date: Mon, 15 Jul 2019 15:30:12 -0000
Content-Transfer-Encoding: 8bit

1.2.3 is >3 years old now, and several bugfixes have been applied
in the meanwhile.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 .../{exfat-utils_1.2.3.bb => exfat-utils_1.3.0.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-filesystems/recipes-utils/exfat-utils/{exfat-utils_1.2.3.bb => exfat-utils_1.3.0.bb} (84%)

diff --git a/meta-filesystems/recipes-utils/exfat-utils/exfat-utils_1.2.3.bb b/meta-filesystems/recipes-utils/exfat-utils/exfat-utils_1.3.0.bb
similarity index 84%
rename from meta-filesystems/recipes-utils/exfat-utils/exfat-utils_1.2.3.bb
rename to meta-filesystems/recipes-utils/exfat-utils/exfat-utils_1.3.0.bb
index f423a248c2f0..1f2bfa6a0c37 100644
--- a/meta-filesystems/recipes-utils/exfat-utils/exfat-utils_1.2.3.bb
+++ b/meta-filesystems/recipes-utils/exfat-utils/exfat-utils_1.3.0.bb
@@ -18,5 +18,5 @@ DEPENDS = "virtual/libc"
 
 inherit pkgconfig autotools
 
-SRC_URI[md5sum] = "f4e564450aa8159e26dde2869563d242"
-SRC_URI[sha256sum] = "80d3b3f21242d60d36a38a4ddb05cb7cc3a7d4eef5793e8314814937b938fcea"
+SRC_URI[md5sum] = "f8928571b152455e828ca0bd42af8b73"
+SRC_URI[sha256sum] = "dfebd07a7b907e2d603d3a9626e6440bd43ec6c4e8c07ccfc57ce9502b724835"
-- 
2.22.0


