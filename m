Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web11.7415.1601185677792631465
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Sep 2020 22:47:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: kai.kang@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 08R5lunQ016398
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Sat, 26 Sep 2020 22:47:56 -0700 (PDT)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Sat, 26 Sep 2020 22:47:43 -0700
From: "kai" <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH 0/2] Update python3-pytest to 6.1.0
Date: Sun, 27 Sep 2020 13:47:39 +0800
Message-ID: <20200927054741.11210-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>


Kai Kang (2):
  python3-iniconfig: add recipe
  python3-pytest: 5.4.3 -> 6.1.0

 .../python/python3-iniconfig_1.0.1.bb         |  8 +++++
 ...he-setup_requires-for-setuptools-scm.patch | 35 ++++++++++---------
 ...ytest_5.4.3.bb => python3-pytest_6.1.0.bb} |  3 +-
 3 files changed, 29 insertions(+), 17 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-iniconfig_1.0.1.bb
 rename meta-python/recipes-devtools/python/{python3-pytest_5.4.3.bb => python3-pytest_6.1.0.bb} (89%)

-- 
2.17.1

