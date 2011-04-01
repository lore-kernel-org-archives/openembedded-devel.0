Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heroor@gmail.com>) id 1Q5XDd-0006ea-6J
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Apr 2011 07:48:25 +0200
Received: by gxk3 with SMTP id 3so1309590gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2011 22:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=YVsaxh9T6cRfofdoNt5LVNncCuONpmnm+kjgOAF4VBw=;
	b=D5VhlogyI1QLwUfrKqp3jWJoA2XWWmUjk2z6UxQaFxYKE94IoLt9qMdKyqubQWNRW+
	h1pyo2OtYG0h8W9xYwldXS5RdSJll/QYVvskP/u8ta7vB8H0oFplpUERWMhmohiYw9B+
	ZfclP9WTCYIFRx1IDCePqzmo+MU/LE3c/Ea3M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=hkYHjRfwbIUk94fwnxecUg9tZBaPllNecOR/FJQQAZLzmyfOecSJDTksoj7QqiFQe3
	BFO968KBIxeOZ2238c4NrNNOfS4v5DZdmGeg8zxe1Er9676p6nsWXXzjp6yIwDxx+HrX
	3jZyTZ2f0NbGXI3tTMRGy2s+H1aSsX9R/c5gU=
Received: by 10.150.173.10 with SMTP id v10mr3869672ybe.119.1301636782640;
	Thu, 31 Mar 2011 22:46:22 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id p33sm208274ybk.17.2011.03.31.22.46.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 22:46:22 -0700 (PDT)
From: Siddharth Heroor <heroor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Apr 2011 11:16:15 +0530
Message-Id: <1301636775-30589-1-git-send-email-heroor@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Siddharth Heroor <heroor@ti.com>
Subject: [PATCH] ti-cgt6x: Add release 7.2.2
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
X-List-Received-Date: Fri, 01 Apr 2011 05:48:25 -0000

From: Siddharth Heroor <heroor@ti.com>


Signed-off-by: Siddharth Heroor <heroor@ti.com>
---
 recipes/ti/ti-cgt6x_7.2.2.bb |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)
 create mode 100644 recipes/ti/ti-cgt6x_7.2.2.bb

diff --git a/recipes/ti/ti-cgt6x_7.2.2.bb b/recipes/ti/ti-cgt6x_7.2.2.bb
new file mode 100644
index 0000000..e4c0e8e
--- /dev/null
+++ b/recipes/ti/ti-cgt6x_7.2.2.bb
@@ -0,0 +1,8 @@
+require ti-cgt6x.inc
+
+PE = "1"
+PV = "7_2_2"
+PVwithdots = "7.2.2"
+
+SRC_URI[cgt6xbin.md5sum] = "8cbe25f3edbc897ba4a535a416df19bc"
+SRC_URI[cgt6xbin.sha256sum] = "7a938083850d05430a9bab4a18c14a7a0ac2ea08e94c652cf1644bb9560ca22e"
-- 
1.7.0.4



