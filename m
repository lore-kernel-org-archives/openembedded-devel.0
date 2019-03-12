Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4496E7C426
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Mar 2019 08:34:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x2C8YGxD001633
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 12 Mar 2019 01:34:16 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Tue, 12 Mar 2019 01:34:16 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
Date: Tue, 12 Mar 2019 01:34:14 -0700
Message-ID: <20190312083415.87524-2-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190312083415.87524-1-mingli.yu@windriver.com>
References: <20190312083415.87524-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/3] librelp: Upgrade to 1.4.0
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
X-List-Received-Date: Tue, 12 Mar 2019 08:34:17 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../rsyslog/{librelp_1.2.18.bb => librelp_1.4.0.bb}               | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/recipes-extended/rsyslog/{librelp_1.2.18.bb => librelp_1.4.0.bb} (100%)

diff --git a/meta-oe/recipes-extended/rsyslog/librelp_1.2.18.bb b/meta-oe/recipes-extended/rsyslog/librelp_1.4.0.bb
similarity index 100%
rename from meta-oe/recipes-extended/rsyslog/librelp_1.2.18.bb
rename to meta-oe/recipes-extended/rsyslog/librelp_1.4.0.bb
-- 
2.17.1


