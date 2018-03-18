Return-Path: <pn@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 7E10D7867B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2018 16:49:39 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4044tD5JfKz1qsWM;
	Sun, 18 Mar 2018 17:49:40 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 4044tD51vXz1qql0;
	Sun, 18 Mar 2018 17:49:40 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id AcNQ03yLeBG2; Sun, 18 Mar 2018 17:49:40 +0100 (CET)
X-Auth-Info: /cmfpM71m8g9hgibZPi5GTbRe5WU37JG2yXy8UZvQw8=
Received: from hercules.denx.de (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Sun, 18 Mar 2018 17:49:39 +0100 (CET)
From: Parthiban Nallathambi <pn@denx.de>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Date: Sun, 18 Mar 2018 17:49:18 +0100
Message-Id: <20180318164919.5142-1-pn@denx.de>
X-Mailer: git-send-email 2.14.3
Cc: barathiraja@gmail.com
Subject: [PATCH] [busybox]: Adjust the correct version according with patches and meta-oe
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
X-List-Received-Date: Sun, 18 Mar 2018 16:49:40 -0000

Patches reffered in bbapend are with 1.24 (based on
meta-oe 'rocko') version but the bbappend naming is
with 1.27 (based on meta-oe 'master'.

Rename the bbappend to point to correct version of
meta-oe rocko branch.

Signed-off-by: Parthiban Nallathambi <pn@denx.de>
---
 recipes-tweaks/busybox/{busybox_1.27%.bbappend => busybox_1.24%.bbappend} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename recipes-tweaks/busybox/{busybox_1.27%.bbappend => busybox_1.24%.bbappend} (100%)

diff --git a/recipes-tweaks/busybox/busybox_1.27%.bbappend b/recipes-tweaks/busybox/busybox_1.24%.bbappend
similarity index 100%
rename from recipes-tweaks/busybox/busybox_1.27%.bbappend
rename to recipes-tweaks/busybox/busybox_1.24%.bbappend
-- 
2.14.3


