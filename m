Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1Rac3b-0007TH-Cl
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Dec 2011 00:46:47 +0100
Received: by wgbdt12 with SMTP id dt12so196240wgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2011 15:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=GbpgC2W29ZlhSstjg9yMZMDSZpGklvAgLlncg8Xjy2A=;
	b=NwR2LWMVdmp8Q8uSG+d/CMt9uGhf8oiXMNFP/OvvA0Vprd7Mc8o7nJzJaawkrzjRu8
	2Xv6Vqc+p4YsihI2GEKy1Heql2Fg1FGZCsoCNwK+vmvdAH9r1LG65vmU31wuIwgLYlIl
	paSrhhCDYjDOOgVDTN1zAcfU/HqqzkhCGems4=
Received: by 10.180.96.166 with SMTP id dt6mr866857wib.47.1323819591153;
	Tue, 13 Dec 2011 15:39:51 -0800 (PST)
Received: from fangorn.rup.mentorg.com (nat-rup.mentorg.com. [139.181.168.34])
	by mx.google.com with ESMTPS id ff1sm992460wbb.5.2011.12.13.15.39.49
	(version=SSLv3 cipher=OTHER); Tue, 13 Dec 2011 15:39:50 -0800 (PST)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 Dec 2011 03:38:29 +0400
Message-Id: <1323819509-19552-1-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.7.3
Subject: [meta-opie][PATCH] obexftp: fix LICENSE field
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
X-List-Received-Date: Tue, 13 Dec 2011 23:46:47 -0000

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 recipes-support/obexftp/obexftp_0.23.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-support/obexftp/obexftp_0.23.bb b/recipes-support/obexftp/obexftp_0.23.bb
index 46cc628..b6aa9fb 100644
--- a/recipes-support/obexftp/obexftp_0.23.bb
+++ b/recipes-support/obexftp/obexftp_0.23.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "OBEX Ftp Client based on openobex."
 SECTION = "console/network"
 HOMEPAGE = "http://dev.zuckschwerdt.org/openobex/wiki/ObexFtp"
-LICENSE = "GPLv2/LGPLv2"
+LICENSE = "GPLv2 & LGPLv2"
 DEPENDS = "openobex bluez4 virtual/libusb0 virtual/libiconv"
 PR = "r1"
 
-- 
1.7.7.3



