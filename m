Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heroor@gmail.com>) id 1Q757S-00012e-Rr
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Apr 2011 14:12:26 +0200
Received: by yxn22 with SMTP id 22so85543yxn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Apr 2011 05:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=BxrOUX2u8CIxq965jyg+hWkjhD1o334qJJldVfvka+Y=;
	b=xjTuHBn9vmfWX+1nalVGYZZYeo7fRAR/JebSyTID5TqlAKpuD9frTwfvuROmPCpDqF
	TFZw7Bj4TT/nJms3Po/SC2fxETNlKPpq3WZn5KsV/tnr09jXd3wz/d1Popdz3nAJAoNZ
	xLQK9l/oRiHgUM5xkAyKkTV27EIJLGIkRrHmI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=IIML9OAOr0I9WzDSPAW4DFXnYG4Up4VnmR0rUq9MLx2EQ3nM23GsSicfN/yFHvJlIt
	scMdyMqy+dso+qM/gTJy4Bxgqfm1swMYBHyEkmhqqrM5OAxgeI/W+IG02m9iXjUYnBTo
	6CSc/Xh/AUKZWG5K8eDGf1STDLzUiEoV7Oulg=
Received: by 10.236.77.104 with SMTP id c68mr989415yhe.7.1302005420885;
	Tue, 05 Apr 2011 05:10:20 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id h43sm2798378yhm.22.2011.04.05.05.10.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Apr 2011 05:10:20 -0700 (PDT)
From: Siddharth Heroor <heroor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Apr 2011 17:40:04 +0530
Message-Id: <1302005404-21580-4-git-send-email-heroor@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1302005404-21580-1-git-send-email-heroor@gmail.com>
References: <1302005404-21580-1-git-send-email-heroor@gmail.com>
Cc: Siddharth Heroor <heroor@ti.com>
Subject: [PATCH 4/4] ti-sysbios: Add version 6.31.04.27.
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
X-List-Received-Date: Tue, 05 Apr 2011 12:12:27 -0000

From: Siddharth Heroor <heroor@ti.com>


Signed-off-by: Siddharth Heroor <heroor@ti.com>
---
 recipes/ti/ti-sysbios_6.31.04.27.bb |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)
 create mode 100644 recipes/ti/ti-sysbios_6.31.04.27.bb

diff --git a/recipes/ti/ti-sysbios_6.31.04.27.bb b/recipes/ti/ti-sysbios_6.31.04.27.bb
new file mode 100644
index 0000000..619d6ff
--- /dev/null
+++ b/recipes/ti/ti-sysbios_6.31.04.27.bb
@@ -0,0 +1,6 @@
+require ti-sysbios.inc
+
+PV = "6_31_04_27"
+
+SRC_URI[sysbiosbin.md5sum] = "c82e1d3afc9e2d3e88b0e4137f152ed6"
+SRC_URI[sysbiosbin.sha256sum] = "92337cf3197d2b7ffe2316f311cd163be7b470acbb032273894d7d39182f4227"
-- 
1.7.0.4



