Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1THs2u-0007kS-DC
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Sep 2012 10:05:08 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q8T7qDPC007600
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Sep 2012 00:52:13 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Sat, 29 Sep 2012 00:52:12 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 29 Sep 2012 15:52:10 +0800
Message-ID: <1348905131-4266-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [meta-networking][PATCH v2 1/2] ptpd: migrate from meta-oe into meta-networking
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
X-List-Received-Date: Sat, 29 Sep 2012 08:05:08 -0000
Content-Type: text/plain

ptpd: migrate from meta-oe into meta-networking

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../ptpd/ptpd-1.0.0/add-limit-h.patch              |    0
 .../recipes-daemons}/ptpd/ptpd_1.0.0.bb            |    0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename {meta-oe/recipes-connectivity => meta-networking/recipes-daemons}/ptpd/ptpd-1.0.0/add-limit-h.patch (100%)
 rename {meta-oe/recipes-connectivity => meta-networking/recipes-daemons}/ptpd/ptpd_1.0.0.bb (100%)

diff --git a/meta-oe/recipes-connectivity/ptpd/ptpd-1.0.0/add-limit-h.patch b/meta-networking/recipes-daemons/ptpd/ptpd-1.0.0/add-limit-h.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/ptpd/ptpd-1.0.0/add-limit-h.patch
rename to meta-networking/recipes-daemons/ptpd/ptpd-1.0.0/add-limit-h.patch
diff --git a/meta-oe/recipes-connectivity/ptpd/ptpd_1.0.0.bb b/meta-networking/recipes-daemons/ptpd/ptpd_1.0.0.bb
similarity index 100%
rename from meta-oe/recipes-connectivity/ptpd/ptpd_1.0.0.bb
rename to meta-networking/recipes-daemons/ptpd/ptpd_1.0.0.bb
-- 
1.7.4



