Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E58C1783D8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Aug 2017 09:37:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7P9b9bn002600
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Aug 2017 02:37:17 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Fri, 25 Aug 2017 01:41:24 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 25 Aug 2017 16:40:39 +0800
Message-ID: <cover.1503650271.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-python][PATCH 0/3] python-beautifulsoup4: add new recipe and required packages
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
X-List-Received-Date: Fri, 25 Aug 2017 09:37:16 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

--
The following changes since commit ac2a6d2b5d69937577effcb8bb2149651bac0176:

  json-spirit: Add -latomic to LDFLAGS (2017-08-13 13:21:04 +0200)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib.git jhuang0/r_up_python-beautifulsoup4_170825_0
  http://git.pokylinux.org/cgit.cgi//log/?h=jhuang0/r_up_python-beautifulsoup4_170825_0

Jackie Huang (3):
  python-html5lib: add Python3 support
  python-webencodings: add Python3 support
  python-beautifulsoup4: add new recipe for both python2 and python3

 .../recipes-devtools/python/python-beautifulsoup4.inc   | 17 +++++++++++++++++
 .../python/python-beautifulsoup4_4.6.0.bb               |  2 ++
 meta-python/recipes-devtools/python/python-html5lib.inc | 14 ++++++++++++++
 .../python/python-html5lib_0.999999999.bb               | 16 ++--------------
 .../recipes-devtools/python/python-webencodings.inc     | 10 ++++++++++
 .../python/python-webencodings_0.5.1.bb                 | 12 ++----------
 .../python/python3-beautifulsoup4_4.6.0.bb              |  2 ++
 .../python/python3-html5lib_0.999999999.bb              |  2 ++
 .../python/python3-webencodings_0.5.1.bb                |  2 ++
 9 files changed, 53 insertions(+), 24 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-beautifulsoup4.inc
 create mode 100644 meta-python/recipes-devtools/python/python-beautifulsoup4_4.6.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python-html5lib.inc
 create mode 100644 meta-python/recipes-devtools/python/python-webencodings.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-beautifulsoup4_4.6.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-html5lib_0.999999999.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-webencodings_0.5.1.bb

-- 
2.11.0


