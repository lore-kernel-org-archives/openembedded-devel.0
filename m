Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TDylr-0001n9-JK
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Sep 2012 16:27:27 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2999601bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2012 07:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=vrfkgFHQ6b9wthJO2FtU6Iky8gqjnSztzBatyfRb284=;
	b=WRNEP23pPk5b77OgsAjtoSdOnxGUEJcTuyVjTYqQ2ChTAbTmL/Kya22vy2WFyQqAPQ
	KsVSaEJMzZqaC5vJHgeMPLGQBziPoZnx6aCP9U3PqqRM75yeR4Sern/bmx5rwjaI/jLY
	8sgQSz1mPYPtsdMEzkEw1qJ8VjRE+hjFedG1P59V81sE1ATzouZsx4h93t42VKAPBJuz
	W271LTXsr7BjQp5sQaSFkDqBynntEPm0czocW2cIM4y0iy/CF4sN3l4o5ojHfU2WMa0i
	mZqscMJ778Q7DSYt062yrhmofhKfwXNhy36Z3/Qb+4ntM3vWisTmlBTqGj74QC1lCeAC
	+WSg==
Received: by 10.204.157.151 with SMTP id b23mr148318bkx.96.1347977689874;
	Tue, 18 Sep 2012 07:14:49 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-96.unitymediagroup.de.
	[95.222.156.96])
	by mx.google.com with ESMTPS id y20sm8006887bkv.11.2012.09.18.07.14.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Sep 2012 07:14:49 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Sep 2012 16:13:05 +0200
Message-Id: <1347977601-28665-25-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
References: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/-oe/-multimedia 24/40] xfce4-wavelan-plugin: update to 0.5.11
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
X-List-Received-Date: Tue, 18 Sep 2012 14:27:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...in_0.5.10.bb => xfce4-wavelan-plugin_0.5.11.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/wavelan/{xfce4-wavelan-plugin_0.5.10.bb => xfce4-wavelan-plugin_0.5.11.bb} (67%)

diff --git a/meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.5.10.bb b/meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.5.11.bb
similarity index 67%
rename from meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.5.10.bb
rename to meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.5.11.bb
index 95acd62..b241cba 100644
--- a/meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.5.10.bb
+++ b/meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.5.11.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e1e5872df9c5cf1a23f16493d9104920"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "a4cd20ef471123936e762a139f1025e1"
-SRC_URI[sha256sum] = "c5b2535b9c90d3fbf6a5f94d096fbc9cb5ce85e2c5d67df933f6fe74ae6f761d"
+SRC_URI[md5sum] = "50514bb286f1ed6761a1b36832bb7fe3"
+SRC_URI[sha256sum] = "fe06c7ffc29c2d4ca7bc452b3356825354e276565de9b0a2d087ab55471755ae"
-- 
1.7.6.5



