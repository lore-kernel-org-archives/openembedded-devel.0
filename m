Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AC68B7302E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Mar 2017 03:30:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v2D3Uec3020479
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Mar 2017 20:30:40 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Sun, 12 Mar 2017 20:30:39 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 13 Mar 2017 11:29:16 +0800
Message-ID: <20170313032921.8669-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
MIME-Version: 1.0
Subject: [PATCH 0/5] Update SRC_URIs
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
X-List-Received-Date: Mon, 13 Mar 2017 03:30:39 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Update SRC_URIs which show qa warnings when do_fetch.

Kai Kang (5):
  fuse: update HOMEPAGE and SRC_URI
  curlpp: update HOMEPAGE and SRC_URI
  libdnet: update SRC_URI
  cherokee: update SRC_URI
  lmsensors: update SRC_URI and S

 meta-filesystems/recipes-support/fuse/fuse_2.9.4.bb          | 6 +++---
 meta-networking/recipes-connectivity/libdnet/libdnet_1.12.bb | 8 +++++---
 meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb       | 8 ++++----
 meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb        | 6 +++---
 meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb     | 2 +-
 5 files changed, 16 insertions(+), 14 deletions(-)

-- 
2.10.1


