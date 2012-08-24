Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T4n5F-0003jH-Nu
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Aug 2012 08:09:29 +0200
Received: by daks35 with SMTP id s35so788486dak.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2012 22:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=RAq2iwcXgx+sWWlfeMMm+KhXFAZx3Z60OV3vpeKzeo4=;
	b=vMHwB6ayFSczqIRE14lpbRy1yuLB2qHHkBvyF/fHWxvp3A2GGkQbLio1Q58p0cWFlL
	rNej/4f0TtgalYZCl7vYU0tFycPUemAFNQW+L8hSu0p2TcMAC9Fe9zxH/cQv5CAI1tdi
	BLi5s3HUxMEHLJKTEWQBIvM6R5IzLaMlCqHR+kRh2q940KXaUAN5msO4Nbk9sg+bFM7p
	ArHUlhB51cNk7eIxcuionBJG8LOpUV1ljWr6tcglZpU/2buQ+StzOInW1jyJbOLWMQS+
	oBdUS6xSqus14ztH+ZKb7K9haCOK/Vmqr4PNaGiiGy6x2WuhImZ661O90SbesNsProkH
	In9Q==
Received: by 10.68.191.8 with SMTP id gu8mr10280228pbc.5.1345787841871;
	Thu, 23 Aug 2012 22:57:21 -0700 (PDT)
Received: from leo.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id hr9sm7594293pbc.36.2012.08.23.22.57.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Aug 2012 22:57:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Aug 2012 22:57:03 -0700
Message-Id: <1345787825-9950-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1345787825-9950-1-git-send-email-raj.khem@gmail.com>
References: <1345787825-9950-1-git-send-email-raj.khem@gmail.com>
Subject: [2011.03-maintenance][PATCH 3/5] orc: Add recipe for 0.4.16
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
X-List-Received-Date: Fri, 24 Aug 2012 06:09:30 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/orc/orc_0.4.16.bb |    3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 recipes/orc/orc_0.4.16.bb

diff --git a/recipes/orc/orc_0.4.16.bb b/recipes/orc/orc_0.4.16.bb
new file mode 100644
index 0000000..efef664
--- /dev/null
+++ b/recipes/orc/orc_0.4.16.bb
@@ -0,0 +1,3 @@
+require orc.inc
+SRC_URI[orc.md5sum] = "e482932e544c847761449b106ecbc483"
+SRC_URI[orc.sha256sum] = "700e4edba20a0ed42164b645da26ce515b883d4c4633b222302f1e541f2a58ab"
-- 
1.7.9.5



