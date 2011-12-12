Received: from mail-qw0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip.balister@gmail.com>) id 1Ra8nA-0006eY-N5
	for openembedded-devel@openembedded.org; Mon, 12 Dec 2011 17:31:52 +0100
Received: by qabg14 with SMTP id g14so4454897qab.6
	for <openembedded-devel@openembedded.org>;
	Mon, 12 Dec 2011 08:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=gSq6VJO8jmle6+UDZ1p2xbweeFkdFWPNkCWCHkieaq4=;
	b=TLFLW+9fKSStdfL/QEChkAzqreHSWVH0GR2pnDC3lZAI21vFAzvbFBM+aUGOZHkP4t
	bW8hW1F1Zifl+Le7z3fibIuOE791szEBY81b8A3W2oB4Khm8iDBgMKWY0ybOAG8O2SDa
	bhbuIoKtx5YMoBhxwWyhAGplC3vWHWtcKkgJI=
Received: by 10.224.189.11 with SMTP id dc11mr18032493qab.35.1323707093407;
	Mon, 12 Dec 2011 08:24:53 -0800 (PST)
Received: from localhost.localdomain
	(pool-96-240-172-5.ronkva.east.verizon.net. [96.240.172.5])
	by mx.google.com with ESMTPS id eb5sm37323705qab.10.2011.12.12.08.24.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 12 Dec 2011 08:24:52 -0800 (PST)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@openembedded.org
Date: Mon, 12 Dec 2011 11:24:41 -0500
Message-Id: <1323707082-9185-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH 1/2] gnome-panel : Fix format of LICENSE field.
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
X-List-Received-Date: Mon, 12 Dec 2011 16:31:52 -0000

Signed-off-by: Philip Balister <philip@balister.org>
---
 .../gnome-panel/gnome-panel_2.32.1.bb              |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb
index 4a07378..78b874d 100644
--- a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "GNOME panel"
-LICENSE = "GPLv2 && LGPLv2 && GFDLv1.1"
+LICENSE = "GPLv2 & LGPLv2 & GFDLv1.1"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING-DOCS;md5=c9211dab3ae61e580f48432020784324 \
-- 
1.7.3.4



