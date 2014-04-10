Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C4614605F4
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2014 02:54:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3A2sgrI003862
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-devel@lists.openembedded.org>;
	Wed, 9 Apr 2014 19:54:42 -0700 (PDT)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.169.1; Wed, 9 Apr 2014 19:54:41 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <Openembedded-devel@lists.openembedded.org>
Date: Thu, 10 Apr 2014 10:54:32 +0800
Message-ID: <1397098475-17901-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Subject: [meta-oe][PATCH 0/3] Update smartmontools and add some fix
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
X-List-Received-Date: Thu, 10 Apr 2014 02:54:44 -0000
Content-Type: text/plain

Kai Kang (3):
  smartmontools: update to 6.2
  smartmontools: add init script
  smartmontools: add PACKAGECONFIG and runtime dependency

 .../smartmontools/files/initd.smartd               | 108 +++++++++++++++++++++
 .../{smartmontools_6.1.bb => smartmontools_6.2.bb} |  36 ++++++-
 2 files changed, 139 insertions(+), 5 deletions(-)
 create mode 100755 meta-oe/recipes-extended/smartmontools/files/initd.smartd
 rename meta-oe/recipes-extended/smartmontools/{smartmontools_6.1.bb => smartmontools_6.2.bb} (19%)

-- 
1.8.4


