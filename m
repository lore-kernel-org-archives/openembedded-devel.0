Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4497B72858
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Jan 2015 02:21:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0L2LfwH019448
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Tue, 20 Jan 2015 18:21:41 -0800 (PST)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Tue, 20 Jan 2015 18:21:40 -0800
From: Kai Kang <kai.kang@windriver.com>
To: <martin.jansa@gmail.com>
Date: Wed, 21 Jan 2015 10:21:28 +0800
Message-ID: <1421806889-30564-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 2.1.1
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] V2: lksctp-tools: add ptest subpackage and other updates
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
X-List-Received-Date: Wed, 21 Jan 2015 02:21:48 -0000
Content-Type: text/plain

V2:
* rebased on origin/master-next and build for qemuarm

Kai Kang (1):
  lksctp-tools: add ptest subpackage and other updates

 .../lksctp-tools/lksctp-tools/run-ptest             |  5 +++++
 .../lksctp-tools/lksctp-tools/v4test.sh             | 11 +++++++++++
 .../lksctp-tools/lksctp-tools/v6test.sh             | 11 +++++++++++
 .../lksctp-tools/lksctp-tools_1.0.16.bb             | 21 +++++++++++++++++----
 4 files changed, 44 insertions(+), 4 deletions(-)
 create mode 100644 meta-networking/recipes-support/lksctp-tools/lksctp-tools/run-ptest
 create mode 100644 meta-networking/recipes-support/lksctp-tools/lksctp-tools/v4test.sh
 create mode 100644 meta-networking/recipes-support/lksctp-tools/lksctp-tools/v6test.sh

-- 
2.1.1


