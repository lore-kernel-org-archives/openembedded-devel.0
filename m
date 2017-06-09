Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D4FFE71AE4
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Jun 2017 06:28:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v596Sl07009150
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 8 Jun 2017 23:28:48 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 8 Jun 2017 23:28:47 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 9 Jun 2017 14:28:44 +0800
Message-ID: <cover.1496989437.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-python][PATCH 0/2] python3-django: add python3 recipes and update
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
X-List-Received-Date: Fri, 09 Jun 2017 06:28:48 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

--
The following changes since commit 41cf832cc9abd6f2293a6d612463a34a53a9a52a:

  Revert "rrdtool: add gettext-native dependency" (2017-06-05 11:13:09 +0200)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib.git jhuang0/r_up_python-django_170609_0
  http://git.pokylinux.org/cgit.cgi//log/?h=jhuang0/r_up_python-django_170609_0

Jackie Huang (2):
  python3-django-south: add new recipe
  python3-django: add python3 recipe and update to 1.11.2

 .../recipes-devtools/python/python-django-south.inc   | 17 +++++++++++++++++
 .../python/python-django-south_1.0.2.bb               | 19 ++-----------------
 .../{python-django_1.10.5.bb => python-django.inc}    |  6 +++---
 .../recipes-devtools/python/python-django_1.11.2.bb   |  2 ++
 .../python/python3-django-south_1.0.2.bb              |  2 ++
 .../recipes-devtools/python/python3-django_1.11.2.bb  |  2 ++
 6 files changed, 28 insertions(+), 20 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-django-south.inc
 rename meta-python/recipes-devtools/python/{python-django_1.10.5.bb => python-django.inc} (75%)
 create mode 100644 meta-python/recipes-devtools/python/python-django_1.11.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-django-south_1.0.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-django_1.11.2.bb

-- 
2.11.0


