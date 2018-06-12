Return-Path: <prvs=69472e970=Richard.Leitner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id 1C22E78F2D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jun 2018 14:33:36 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.51,215,1526335200"; 
   d="scan'208";a="1495424"
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 12 Jun 2018 16:33:28 +0200
Message-ID: <20180612143331.2445-2-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180612143331.2445-1-richard.leitner@skidata.com>
References: <20180612143331.2445-1-richard.leitner@skidata.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex4srv.skidata.net (192.168.111.82) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: [meta-java][PATCH 1/4] README: fix dependent branch names
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
X-List-Received-Date: Tue, 12 Jun 2018 14:33:37 -0000
Content-Type: text/plain

As we currently depend on the master branches of meta-oe and oe-core
adapt the README accordingly.

Furthermore add a short note on our stable branches.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 README | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/README b/README
index 33511ff..564a924 100644
--- a/README
+++ b/README
@@ -7,13 +7,16 @@ Yocto Project build systems.
 This layer depends on:
 
 URI: git://git.openembedded.org/openembedded-core
-branch: krogoth (or master)
+branch: master
 revision: HEAD
 
 URI: git://git.openembedded.org/meta-openembedded
-branch: krogoth (or master)
+branch: master
 revision: HEAD
 
+For use with a specific Yocto Project release please refer to the corresponding
+git branches.
+
 Contributing
 ------------
 
-- 
2.11.0


