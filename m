Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2F3D170364
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jul 2014 09:55:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6B9tB0Q028410
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jul 2014 02:55:11 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Fri, 11 Jul 2014 02:55:11 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 11 Jul 2014 05:55:08 -0400
Message-ID: <1405072509-8901-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/2 v2] syslog-ng: move back from nonworking
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Jul 2014 09:55:13 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-oe/recipes-support/{nonworking => }/syslog-ng/files/initscript     | 0
 meta-oe/recipes-support/{nonworking => }/syslog-ng/files/syslog-ng.conf | 0
 meta-oe/recipes-support/{nonworking => }/syslog-ng/syslog-ng.inc        | 0
 meta-oe/recipes-support/{nonworking => }/syslog-ng/syslog-ng_3.2.5.bb   | 0
 4 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/recipes-support/{nonworking => }/syslog-ng/files/initscript (100%)
 rename meta-oe/recipes-support/{nonworking => }/syslog-ng/files/syslog-ng.conf (100%)
 rename meta-oe/recipes-support/{nonworking => }/syslog-ng/syslog-ng.inc (100%)
 rename meta-oe/recipes-support/{nonworking => }/syslog-ng/syslog-ng_3.2.5.bb (100%)

diff --git a/meta-oe/recipes-support/nonworking/syslog-ng/files/initscript b/meta-oe/recipes-support/syslog-ng/files/initscript
similarity index 100%
rename from meta-oe/recipes-support/nonworking/syslog-ng/files/initscript
rename to meta-oe/recipes-support/syslog-ng/files/initscript
diff --git a/meta-oe/recipes-support/nonworking/syslog-ng/files/syslog-ng.conf b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf
similarity index 100%
rename from meta-oe/recipes-support/nonworking/syslog-ng/files/syslog-ng.conf
rename to meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf
diff --git a/meta-oe/recipes-support/nonworking/syslog-ng/syslog-ng.inc b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
similarity index 100%
rename from meta-oe/recipes-support/nonworking/syslog-ng/syslog-ng.inc
rename to meta-oe/recipes-support/syslog-ng/syslog-ng.inc
diff --git a/meta-oe/recipes-support/nonworking/syslog-ng/syslog-ng_3.2.5.bb b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.2.5.bb
similarity index 100%
rename from meta-oe/recipes-support/nonworking/syslog-ng/syslog-ng_3.2.5.bb
rename to meta-oe/recipes-support/syslog-ng/syslog-ng_3.2.5.bb
-- 
2.0.0


