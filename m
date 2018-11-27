Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 044FC6D23A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2018 08:17:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wAR8HAkP020295
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 27 Nov 2018 00:17:10 -0800 (PST)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Tue, 27 Nov 2018 00:17:10 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 27 Nov 2018 16:32:43 +0800
Message-ID: <c7b9808268e792940796df5e03030fbe7c39dbfd.1543307294.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1543307294.git.hongxu.jia@windriver.com>
References: <cover.1543307294.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 09/12] efivar: correct version number 0.36 -> 36
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
X-List-Received-Date: Tue, 27 Nov 2018 08:17:10 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-bsp/efivar/{efivar_0.36.bb => efivar_36.bb} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/recipes-bsp/efivar/{efivar_0.36.bb => efivar_36.bb} (100%)

diff --git a/meta-oe/recipes-bsp/efivar/efivar_0.36.bb b/meta-oe/recipes-bsp/efivar/efivar_36.bb
similarity index 100%
rename from meta-oe/recipes-bsp/efivar/efivar_0.36.bb
rename to meta-oe/recipes-bsp/efivar/efivar_36.bb
-- 
2.7.4


