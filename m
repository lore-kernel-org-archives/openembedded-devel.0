Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heroor@gmail.com>) id 1Q9ZMR-00045F-Gw
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Apr 2011 10:54:11 +0200
Received: by gwb11 with SMTP id 11so2303039gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Apr 2011 01:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=8l8UbtY1hwvMnjv5pLWnFkqRbjLfUpGsFWrOFYoxNhk=;
	b=IYYRrb+73SzLvdGE87v/bckCFC1MlVfOfbi6njlPXaQzKfiFgF8sHS3Eok3OGDOc+Q
	+rVH72ALk88FK23HIRmiRRasv/xBWtExCcDbR4rFm0s/l5kx5b+eficAyBOSLUAfrMdk
	AkOmRls7HqV9sjBksHa4pt1chVuQuja1R3yE4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=JlFroPdgKEzZVu9m+/8twJY0aLDGFSOgJu+uqaQxm4LMdvEj19o47PMkFTgz6T+M8l
	SH9JVnJYE5qebeErz7VODdOsTpUVplYQ/XRFBZal5+JXMD9IXEvkPdj7uk11xDNG+jwP
	N694aG5JZuDTBhCxkS9df1ZTW0Dqm//Y+yWEI=
Received: by 10.150.115.6 with SMTP id n6mr5660611ybc.43.1302598317193;
	Tue, 12 Apr 2011 01:51:57 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id p41sm1551838ybk.14.2011.04.12.01.51.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 12 Apr 2011 01:51:56 -0700 (PDT)
From: Siddharth Heroor <heroor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Apr 2011 14:21:49 +0530
Message-Id: <1302598309-3878-1-git-send-email-heroor@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Siddharth Heroor <heroor@ti.com>
Subject: [PATCH] ti-ipc: Add version 1.22.05.27
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
X-List-Received-Date: Tue, 12 Apr 2011 08:54:12 -0000


Signed-off-by: Siddharth Heroor <heroor@ti.com>
---
 recipes/ti/ti-ipc_1.22.05.27.bb |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)
 create mode 100644 recipes/ti/ti-ipc_1.22.05.27.bb

diff --git a/recipes/ti/ti-ipc_1.22.05.27.bb b/recipes/ti/ti-ipc_1.22.05.27.bb
new file mode 100644
index 0000000..c3d25a6
--- /dev/null
+++ b/recipes/ti/ti-ipc_1.22.05.27.bb
@@ -0,0 +1,6 @@
+require ti-ipc.inc
+
+PV = "1_22_05_27"
+
+SRC_URI[ipcbin.md5sum] = "bd35d75b754f0fc54d7ad74cfc971987"
+SRC_URI[ipcbin.sha256sum] = "b61969dc8b5bf01ee6f68151d2c8e123b1b3b425990987fe64288085d8cc15b7"
-- 
1.7.0.4



