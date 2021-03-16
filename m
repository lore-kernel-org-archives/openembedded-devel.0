Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.3809.1615866179937592491
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Mar 2021 20:43:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 12G3gXf1012338
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 15 Mar 2021 20:42:38 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 15 Mar 2021 20:42:27 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Mon, 15 Mar 2021 20:42:26 -0700
From: "kai" <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <schnitzeltony@gmail.com>
Subject: [meta-xfce][PATCH 4/7] xfce4-genmon-plugin: 4.1.0 -> 4.1.1
Date: Tue, 16 Mar 2021 11:41:59 +0800
Message-ID: <20210316034202.21134-5-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210316034202.21134-1-kai.kang@windriver.com>
References: <20210316034202.21134-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...fce4-genmon-plugin_4.1.0.bb => xfce4-genmon-plugin_4.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-panel-plugins/genmon/{xfce4-genmon-plugin_4.1.0.bb => xfce4-genmon-plugin_4.1.1.bb} (80%)

diff --git a/meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.1.0.bb b/meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.1.1.bb
similarity index 80%
rename from meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.1.0.bb
rename to meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.1.1.bb
index a51c52f23..9a6d4b19c 100644
--- a/meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.1.0.bb
+++ b/meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.1.1.bb
@@ -5,4 +5,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=68ad62c64cc6c620126241fd429e68fe"
 
 inherit xfce-panel-plugin
 
-SRC_URI[sha256sum] = "d1256b4b47545c7bdb16842b21eaf3ac167be443e8f2f1093cf4209e65c84e7d"
+SRC_URI[sha256sum] = "b2119fd0ff19fa293b97ec97b0de8e241799e08b86218515167c568bd9b50135"
-- 
2.17.1

