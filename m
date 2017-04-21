Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E96E662133
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Apr 2017 09:08:18 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v3L98JPk031399
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Apr 2017 02:08:20 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Fri, 21 Apr 2017 02:08:18 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 21 Apr 2017 17:08:13 +0800
Message-ID: <cover.1492765386.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-python][PATCH 0/4] python-snimpy: add new recipe and required packages
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
X-List-Received-Date: Fri, 21 Apr 2017 09:08:20 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

---
The following changes since commit 2cdea6c5bb09aa90184c17c9157f4fed0e10b3c2:

  opencv: do not depend on swig. (2017-04-06 13:00:31 +0200)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib.git jhuang0/r_upstream-python-snimpy_170421_0
  http://git.pokylinux.org/cgit.cgi//log/?h=jhuang0/r_upstream-python-snimpy_170421_0

Jackie Huang (4):
  python-ply: add new recipe
  python-pysmi: add new recipe
  python-pysnmp: add new recipe
  python-snimpy: add new recipe

 .../recipes-devtools/python/python-ply_3.10.bb     | 17 ++++++++++++++
 .../recipes-devtools/python/python-pysmi_0.1.2.bb  | 22 ++++++++++++++++++
 .../recipes-devtools/python/python-pysnmp_4.3.5.bb | 25 +++++++++++++++++++++
 .../python/python-snimpy_0.8.11.bb                 | 26 ++++++++++++++++++++++
 4 files changed, 90 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-ply_3.10.bb
 create mode 100644 meta-python/recipes-devtools/python/python-pysmi_0.1.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python-pysnmp_4.3.5.bb
 create mode 100644 meta-python/recipes-devtools/python/python-snimpy_0.8.11.bb

-- 
2.11.0


