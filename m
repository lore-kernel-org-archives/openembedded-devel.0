Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A9C7C7002B
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Sep 2016 09:15:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u869FHPH028828
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 6 Sep 2016 02:15:17 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 6 Sep 2016 02:15:16 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 6 Sep 2016 05:15:14 -0400
Message-ID: <cover.1473153229.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 0/1] add PACKAGECONFIG for lvm thin provisioning
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
X-List-Received-Date: Tue, 06 Sep 2016 09:15:21 -0000
Content-Type: text/plain

The following changes since commit 291946d2501be1dc2549304460e3e288408dfbfe:

  directfb: add PACKAGECONFIG for inputdrivers (2016-09-05 13:30:55 +0200)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib hongxu/lvm2
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=hongxu/lvm2

Hongxu Jia (1):
  add PACKAGECONFIG for lvm thin provisioning

 meta-oe/recipes-support/lvm2/lvm2.inc | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

-- 
2.8.1


