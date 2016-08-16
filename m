Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B4DB17711B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2016 06:58:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7G6wBJv022928
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 23:58:12 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Mon, 15 Aug 2016 23:58:11 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 16 Aug 2016 14:57:10 +0800
Message-ID: <20160816065711.5083-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20160816065711.5083-1-kai.kang@windriver.com>
References: <20160816065711.5083-1-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] radvd: 2.11 -> 2.14
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
X-List-Received-Date: Tue, 16 Aug 2016 06:58:12 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Upgrade radvd from 2.11 to 2.14.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../recipes-daemons/radvd/{radvd_2.11.bb => radvd_2.14.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-daemons/radvd/{radvd_2.11.bb => radvd_2.14.bb} (12%)

diff --git a/meta-networking/recipes-daemons/radvd/radvd_2.11.bb b/meta-networking/recipes-daemons/radvd/radvd_2.14.bb
similarity index 12%
rename from meta-networking/recipes-daemons/radvd/radvd_2.11.bb
rename to meta-networking/recipes-daemons/radvd/radvd_2.14.bb
index c0b7532..2525249 100644
--- a/meta-networking/recipes-daemons/radvd/radvd_2.11.bb
+++ b/meta-networking/recipes-daemons/radvd/radvd_2.14.bb
@@ -1,5 +1,5 @@
 
 require radvd.inc
 
-SRC_URI[md5sum] = "57fc6021f6a5e5472e455937685472a3"
-SRC_URI[sha256sum] = "80ad60b15689e9591a5af393a57a1d93304deeff2e46482f0fd98046c00622f8"
+SRC_URI[md5sum] = "acd3883dece2c7888d15596b05c9fae4"
+SRC_URI[sha256sum] = "46d31c05daea11c3d1e3dc092997d3631b3bc72b20a4f279b05304b83dbd7aa8"
-- 
2.9.3


