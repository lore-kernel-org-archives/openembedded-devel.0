Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1P8vHm-0007ef-30
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 15:34:32 +0200
Received: by yxt3 with SMTP id 3so2495972yxt.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 06:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=oE2Yc7L9axdjImzYcQDEhP857vwlQ516dXvtVzh4ukQ=;
	b=P/ZP+O256d5dBnlLI4aLz/lwNZfFfE3OjligCEZxKzomMivihOIx1yMDPQMiXOip3Y
	0r6h4lWgiACfma6VnbAJbdeYjfSOZeKXaUT2l8Kc+YRHirLRWW4cvc/v/lOZ3QEdhoUd
	JJBJzvCazPvVdfhJmECSIEzI8FIqHDEhBL3uE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=BI78kYiwUUGfGOa9g5CxPDMD+7wi8qFNnr0Yi5nwdPpuATwa8U01iDPENPBuL0D17v
	kOI2myrIv5L1y8aMSnvZuUe3q0W0W5vpZm5yJfAUf6vXXM/kJOph8pLwhf0miba0XELM
	pH8ho5mcM/eceD/umSOOfwF4BIp25Zf3pkJcg=
Received: by 10.150.213.7 with SMTP id l7mr3770606ybg.235.1287668028451;
	Thu, 21 Oct 2010 06:33:48 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id p38sm7984809ybk.16.2010.10.21.06.33.47
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 21 Oct 2010 06:33:47 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Oct 2010 08:33:17 -0500
Message-Id: <1287668010-11310-10-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1287668010-11310-1-git-send-email-Chase.Maupin@ti.com>
References: <1287668010-11310-1-git-send-email-Chase.Maupin@ti.com>
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 09/22] iperf: update package LICENSE
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
X-List-Received-Date: Thu, 21 Oct 2010 13:35:05 -0000

* Update the LICENSE fields to reflect the licensing used in
  the source code.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/iperf/iperf.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/iperf/iperf.inc b/recipes/iperf/iperf.inc
index 138ba29..c9aea29 100644
--- a/recipes/iperf/iperf.inc
+++ b/recipes/iperf/iperf.inc
@@ -1,7 +1,7 @@
 SECTION = "console/network"
 DESCRIPTION = "Iperf is a tool to measure maximum TCP bandwidth, allowing the tuning of various parameters and UDP characteristics"
 HOMEPAGE = "http://dast.nlanr.net/Projects/Iperf/"
-LICENSE = "BSD"
+LICENSE = "NewBSD"
 INC_PR = "r1"
 
 inherit autotools
-- 
1.7.0.4



