Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CEC297F25B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Sep 2019 05:54:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id x8T5sOV4001377
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Sep 2019 22:54:24 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Sat, 28 Sep 2019 22:54:23 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 29 Sep 2019 13:42:37 +0800
Message-ID: <cover.1569734973.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-python][PATCH 0/4] Add new recipes four python packages
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
X-List-Received-Date: Sun, 29 Sep 2019 05:54:28 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

--
The following changes since commit 41fe46157ca3caa96408a9a749d62c8bbc3c2794:

  python-paste: upgrade 3.2.0 -> 3.2.1 (2019-09-25 22:51:10 -0700)

are available in the git repository at:

  git://github.com/jackiehjm/meta-openembedded jackiehjm/python-versiontools_pymysql_statistics_pyperf_20190929
  https://github.com/jackiehjm/meta-openembedded/tree/jackiehjm/python-versiontools_pymysql_statistics_pyperf_20190929

Jackie Huang (4):
  python-versiontools: add recipes for python2 and python3
  python-pymysql: add recipes for python2 and python3
  python-statistics: add new recipe
  python-pyperf: add recipes for python2 and python3

 .../recipes-devtools/python/python-pymysql.inc     | 18 +++++++++++++++++
 .../python/python-pymysql_0.9.3.bb                 |  2 ++
 .../recipes-devtools/python/python-pyperf.inc      | 23 ++++++++++++++++++++++
 .../recipes-devtools/python/python-pyperf_1.6.1.bb |  4 ++++
 .../python/python-statistics_1.0.3.5.bb            | 15 ++++++++++++++
 .../python/python-versiontools.inc                 | 10 ++++++++++
 .../python/python-versiontools_1.9.1.bb            |  2 ++
 .../python/python3-pymysql_0.9.3.bb                |  2 ++
 .../python/python3-pyperf_1.6.1.bb                 |  4 ++++
 .../python/python3-versiontools_1.9.1.bb           |  2 ++
 10 files changed, 82 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pymysql.inc
 create mode 100644 meta-python/recipes-devtools/python/python-pymysql_0.9.3.bb
 create mode 100644 meta-python/recipes-devtools/python/python-pyperf.inc
 create mode 100644 meta-python/recipes-devtools/python/python-pyperf_1.6.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python-statistics_1.0.3.5.bb
 create mode 100644 meta-python/recipes-devtools/python/python-versiontools.inc
 create mode 100644 meta-python/recipes-devtools/python/python-versiontools_1.9.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pymysql_0.9.3.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pyperf_1.6.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-versiontools_1.9.1.bb

-- 
2.7.4


