Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4EA737CB03
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Feb 2019 06:56:18 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x1M6uIbU023489
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Feb 2019 22:56:19 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.435.0; Thu, 21 Feb 2019 22:56:18 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 22 Feb 2019 14:56:15 +0800
Message-ID: <1550818577-425600-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/2] cim-schema-docs/final: remove do_unpack
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
X-List-Received-Date: Fri, 22 Feb 2019 06:56:18 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

remove do_unpack, same as recipe cim-schema-exper, 
use subdir in SRC_URI 

Changqing Li (2):
  cim-schema-docs: remove do_unpack
  cim-schema-final: remove do_unpack

 .../recipes-support/cim-schema/cim-schema-docs_2.40.0.bb           | 7 +------
 .../recipes-support/cim-schema/cim-schema-final_2.40.0.bb          | 7 +------
 2 files changed, 2 insertions(+), 12 deletions(-)

-- 
2.7.4


