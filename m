Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C32A07E4EC
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 May 2019 12:42:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x4PCgN1F007101
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 May 2019 05:42:23 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Sat, 25 May 2019 05:42:22 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 25 May 2019 08:41:58 -0400
Message-ID: <20190525124158.184776-3-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190525124158.184776-1-kai.kang@windriver.com>
References: <20190525124158.184776-1-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [meta-xfce][PATCH 3/3] packagegroup-xfce-extended: add xfce4-screensaver
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 25 May 2019 12:42:22 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Add xfce4-screensaver to RRECOMMENDS of packagegroup-xfce-extended.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../recipes-xfce/packagegroups/packagegroup-xfce-extended.bb     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
index b412c2726..62b89fd47 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
@@ -62,6 +62,7 @@ RRECOMMENDS_${PN} = " \
     thunar-archive-plugin \
     \
     xfce4-appfinder \
+    xfce4-screensaver \
     xfce4-screenshooter \
     xfce4-power-manager \
     ristretto \
-- 
2.20.0


