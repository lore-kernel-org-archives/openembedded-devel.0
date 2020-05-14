Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.545.1589485691178458546
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 May 2020 12:48:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: trevor.gamblin@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 04EJl79u011727
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Thu, 14 May 2020 12:47:27 -0700
Received: from yow-tgamblin-fedora2.wrs.com (128.224.56.206) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
 14.3.487.0; Thu, 14 May 2020 12:47:21 -0700
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <ticotimo@gmail.com>, <derek@asterius.io>
Subject: [meta-python][PATCH] meta-python: add self as maintainer
Date: Thu, 14 May 2020 15:47:21 -0400
Message-ID: <20200514194721.848173-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 meta-python/README | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/README b/meta-python/README
index 705b035d9..ca0a290d9 100644
--- a/meta-python/README
+++ b/meta-python/README
@@ -46,4 +46,5 @@ Maintenance
 Layer Maintainers:
         Tim "moto-timo" Orling <TicoTimo@gmail.com>
         Derek Straka <derek@asterius.io>
+        Trevor Gamblin <trevor.gamblin@windriver.com>
 
-- 
2.25.4

