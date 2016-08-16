Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4D8486FFFE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2016 06:58:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7G6wAjO011983
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 23:58:10 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Mon, 15 Aug 2016 23:58:09 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 16 Aug 2016 14:57:09 +0800
Message-ID: <20160816065711.5083-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [meta-networking][PATCH 0/2] Upgrade 2 packages
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
X-List-Received-Date: Tue, 16 Aug 2016 06:58:10 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>


Kai Kang (2):
  radvd: 2.11 -> 2.14
  libnftnl: 1.0.5 -> 1.0.6

 .../recipes-daemons/radvd/{radvd_2.11.bb => radvd_2.14.bb}            | 4 ++--
 .../recipes-filter/libnftnl/{libnftnl_1.0.5.bb => libnftnl_1.0.6.bb}  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-networking/recipes-daemons/radvd/{radvd_2.11.bb => radvd_2.14.bb} (12%)
 rename meta-networking/recipes-filter/libnftnl/{libnftnl_1.0.5.bb => libnftnl_1.0.6.bb} (70%)

-- 
2.9.3


