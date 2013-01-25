Received: from mail-ea0-f177.google.com ([209.85.215.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TyryO-0007c5-Nt
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jan 2013 23:42:12 +0100
Received: by mail-ea0-f177.google.com with SMTP id n13so361118eaa.36
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jan 2013 14:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=18+5B2JxO3yOjMXna2KeTaNrAcX5TQ9s+BwRrkiTa/I=;
	b=l53eujLb7XSB1RcS1GnwTdXNbu4T00yY9jqZsbdjq8fjWFDlv1MixTJrvrc+Bc6Hfi
	6bGbeCRZLN22+bDXd6vQHOcG32ZS30X54ORi71PV41TnYsk7Tm+TF3ysOFQ9OqVCglcw
	25tOrfBBMPvFbeGZ59wJyl8iyhnyofWvHWK1O1IsYxbvLUB3+oP+TrVKUNBodin4QTYQ
	+u6ZSrHb/64w6ec+FZLsV2N69tiNihz67ObqmwPVQRS87ZpzI+Ss54y3XoqfmrKFMrB6
	4y0nu9ca2LDpgw0WzPjVK4n3s6yptuLqZoyqjM5gD8EeLxHa7GihMR2sB2YQlzU5RjAc
	Y9eA==
X-Received: by 10.14.173.196 with SMTP id v44mr18485389eel.29.1359152798067;
	Fri, 25 Jan 2013 14:26:38 -0800 (PST)
Received: from localhost.localdomain (p5B0A1952.dip.t-dialin.net.
	[91.10.25.82])
	by mx.google.com with ESMTPS id k4sm3566723eep.15.2013.01.25.14.26.36
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 14:26:37 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Jan 2013 23:26:19 +0100
Message-Id: <1359152782-23743-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1359152782-23743-1-git-send-email-schnitzeltony@googlemail.com>
References: <1359152782-23743-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-systemd/V2 2/5] tumbler: update to 0.1.27
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
X-List-Received-Date: Fri, 25 Jan 2013 22:42:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{tumbler_0.1.26.bb => tumbler_0.1.27.bb}       |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/tumbler/{tumbler_0.1.26.bb => tumbler_0.1.27.bb} (89%)

diff --git a/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.26.bb b/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.27.bb
similarity index 89%
rename from meta-xfce/recipes-xfce/tumbler/tumbler_0.1.26.bb
rename to meta-xfce/recipes-xfce/tumbler/tumbler_0.1.27.bb
index a066713..663e67c 100644
--- a/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.26.bb
+++ b/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.27.bb
@@ -6,8 +6,8 @@ DEPENDS = "dbus-glib freetype gdk-pixbuf poppler"
 
 inherit xfce
 
-SRC_URI[md5sum] = "874621e7820b3bfe0e8ab66d17f1dc31"
-SRC_URI[sha256sum] = "6602ce700160d09edd88ea0b9bcb16abbc28974f372e646709e0ed8fbacc8a78"
+SRC_URI[md5sum] = "3fa90528c3e7e77d8ace4bffcf0a2748"
+SRC_URI[sha256sum] = "4c60b3b92877257fcc54d18acbbe4ad73c84a7ff7608a430ad5a05b452923869"
 
 INSANE_SKIP_${PN} = "dev-so"
 
-- 
1.7.4.4



