Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.8799.1607049807900831471
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Dec 2020 18:43:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,391,1599494400"; 
   d="scan'208";a="102047679"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 04 Dec 2020 10:43:03 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 352B74CE5CF9
	for <openembedded-devel@lists.openembedded.org>; Fri,  4 Dec 2020 10:43:00 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 4 Dec 2020 10:43:00 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] opensc: upgrade 0.20.0 -> 0.20.1
Date: Fri, 4 Dec 2020 10:42:52 +0800
Message-ID: <1607049772-63330-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 352B74CE5CF9.A3D9B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

-License-Update: The address is updated as follows
You should have received a copy of the GNU Lesser General Public
License along with this library; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../opensc/{opensc_0.20.0.bb => opensc_0.20.1.bb}           | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/opensc/{opensc_0.20.0.bb => opensc_0.20.1.bb} (90%)

diff --git a/meta-oe/recipes-support/opensc/opensc_0.20.0.bb b/meta-oe/recipes-support/opensc/opensc_0.20.1.bb
similarity index 90%
rename from meta-oe/recipes-support/opensc/opensc_0.20.0.bb
rename to meta-oe/recipes-support/opensc/opensc_0.20.1.bb
index a815980c4..2fbf60c14 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.20.0.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.20.1.bb
@@ -9,10 +9,10 @@ eID cards have also been confirmed to work."
 HOMEPAGE = "http://www.opensc-project.org/opensc/"
 SECTION = "System Environment/Libraries"
 LICENSE = "LGPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
+LIC_FILES_CHKSUM = "file://COPYING;md5=cb8aedd3bced19bd8026d96a8b6876d7"
 
-#v0.19.0
-SRCREV = "45e29056ccde422e70ed3585084a7f150c632515"
+#v0.21.0
+SRCREV = "30180986a08cf71fe4af4b50251a8bb5b1ab95af"
 SRC_URI = "git://github.com/OpenSC/OpenSC \
           "
 DEPENDS = "virtual/libiconv openssl"
-- 
2.25.1



