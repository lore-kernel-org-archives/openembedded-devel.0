Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 14D1960248
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Nov 2017 03:23:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vAL3N2WS014397
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Nov 2017 19:23:03 -0800 (PST)
Received: from localhost (128.224.162.134) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Mon, 20 Nov 2017 19:23:02 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 21 Nov 2017 11:21:36 +0800
Message-ID: <1511234496-10533-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.134]
Subject: [meta-oe][PATCH] site: move from meta-oe to meta-networking
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
X-List-Received-Date: Tue, 21 Nov 2017 03:23:02 -0000
Content-Type: text/plain

The site information only provides data for rp-pppoe which already moved
to meta-networking. Also move these files to meta-networking.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 {meta-oe => meta-networking}/site/endian-big    | 0
 {meta-oe => meta-networking}/site/endian-little | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename {meta-oe => meta-networking}/site/endian-big (100%)
 rename {meta-oe => meta-networking}/site/endian-little (100%)

diff --git a/meta-oe/site/endian-big b/meta-networking/site/endian-big
similarity index 100%
rename from meta-oe/site/endian-big
rename to meta-networking/site/endian-big
diff --git a/meta-oe/site/endian-little b/meta-networking/site/endian-little
similarity index 100%
rename from meta-oe/site/endian-little
rename to meta-networking/site/endian-little
-- 
2.7.4


