Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heroor@gmail.com>) id 1Q757K-000122-AS
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Apr 2011 14:12:18 +0200
Received: by ywg8 with SMTP id 8so87006ywg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Apr 2011 05:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=ltoDHJcealvzI0ADw22OUcNyYVm8UUBjK9MMxyHKgEk=;
	b=SbcZD2bOrPhZaJfiEClWgSwWPfHs3N6uXX3P0k9BX1G9UGbGt0Err1lYgDSn+cP1Oz
	CM5klrkNT2Dh7XuzHVPNTl8qqMxs2ZOB3hcTTOR2c0+0xbucwuusQ7zowecDFqnU9J4J
	l4G4ojVn8syFSfQl6pYtXfJ11BvrBscy1/WAE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=Tn7d6uNtPwIFBGxyVA60ygXpz5er9v4PtJYBlYRN1uIb+mRN00wzpRLr0xrYtUysjf
	mKrOWBSXQD+pfph5jDIdSk4Gq8UNZJjfV1oy0oMfq3Nr1mA5na+xoPe2/bsjpf736luu
	4AJcoLebW4Oqwuz0NCxOF1bHbHWgQf/bb5Bic=
Received: by 10.236.197.99 with SMTP id s63mr11318463yhn.325.1302005411260;
	Tue, 05 Apr 2011 05:10:11 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id h43sm2798378yhm.22.2011.04.05.05.10.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Apr 2011 05:10:10 -0700 (PDT)
From: Siddharth Heroor <heroor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Apr 2011 17:40:01 +0530
Message-Id: <1302005404-21580-1-git-send-email-heroor@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Siddharth Heroor <heroor@ti.com>
Subject: [PATCH 1/4] ti-sysbios: Add missing License field.
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
X-List-Received-Date: Tue, 05 Apr 2011 12:12:18 -0000

From: Siddharth Heroor <heroor@ti.com>

* Sys/Bios is released under a BSD license.

Signed-off-by: Siddharth Heroor <heroor@ti.com>
---
 recipes/ti/ti-sysbios.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes/ti/ti-sysbios.inc b/recipes/ti/ti-sysbios.inc
index cf45c37..84a76a4 100644
--- a/recipes/ti/ti-sysbios.inc
+++ b/recipes/ti/ti-sysbios.inc
@@ -1,6 +1,7 @@
 DESCRIPTION = "TI SYS/BIOS v6 Kernel"
 HOMEPAGE = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/bios/sysbios"
 SECTION = "devel"
+LICENSE = "BSD"
 
 require ti-paths.inc
 require ti-staging.inc
-- 
1.7.0.4



