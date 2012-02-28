Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1S2UuM-0006GZ-3w
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Feb 2012 22:48:30 +0100
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q1SLahDm027144
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2012 15:36:43 -0600
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id q1SLafel026734
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Feb 2012 03:06:42 +0530 (IST)
Received: from dbdp31.itg.ti.com (172.24.170.98) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 29 Feb 2012 03:06:41 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp31.itg.ti.com (8.13.8/8.13.8) with ESMTP id q1SLacgh017059;
	Wed, 29 Feb 2012 03:06:40 +0530 (IST)
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 28 Feb 2012 15:36:35 -0600
Message-ID: <1330464996-24176-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [meta-oe][PATCH 0/1] meta-oe: add nbench-byte recipe
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
X-List-Received-Date: Tue, 28 Feb 2012 21:48:30 -0000
Content-Type: text/plain

All,

This patch adds the nbench-byte recipe from the OE classic repo to the
recipes-benchmark directory.  I hope I got this patch right to give
proper credit to the original authors, as well as to update the
Upstream-Status of the nbench_32bits.patch file.

Please let me know if there is something else I need to do to give
proper credit.

Chase Maupin (1):
  nbench-byte: import recipe for oe-classic

 .../nbench-byte/nbench-byte/nbench_32bits.patch    |   46 ++++++++++++++++++++
 .../nbench-byte/nbench-byte_2.2.3.bb               |   26 +++++++++++
 2 files changed, 72 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-benchmark/nbench-byte/nbench-byte/nbench_32bits.patch
 create mode 100644 meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb



