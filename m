Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 5F1AC6FFED
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Mar 2016 10:59:15 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u2LAxCpE012179; Mon, 21 Mar 2016 05:59:12 -0500
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016032105591327-24436 ;
	Mon, 21 Mar 2016 05:59:13 -0500 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Mar 2016 12:58:38 +0200
Message-Id: <8b6ab12eddba5752e04feec12b59e98b53a439e5.1458557752.git.adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.7.3
In-Reply-To: <0519adc696bdd1d936306f40171a8dd9ddf73e74.1458557752.git.adrian.ratiu@ni.com>
References: <0519adc696bdd1d936306f40171a8dd9ddf73e74.1458557752.git.adrian.ratiu@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 03/21/2016 05:59:13 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 03/21/2016 05:59:13 AM,
	Serialize complete at 03/21/2016 05:59:13 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-03-21_05:, , signatures=0
Subject: [meta-oe][PATCH v3 2/2] meta-oe: layer.conf: Add ttf-pt-sans to SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS
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
X-List-Received-Date: Mon, 21 Mar 2016 10:59:16 -0000

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta-oe/conf/layer.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 7237964..87f11f0 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -58,6 +58,7 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   ttf-hunkyfonts->fontconfig \
   ttf-inconsolata->fontconfig \
   ttf-liberation->fontconfig \
+  ttf-pt-sans->fontconfig \
   ttf-mplus->fontconfig \
   ttf-sazanami->fontconfig \
   ttf-tlwg->fontconfig \
-- 
2.7.3


