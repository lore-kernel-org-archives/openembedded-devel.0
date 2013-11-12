Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f49.google.com (mail-pb0-f49.google.com
	[209.85.160.49])
	by mail.openembedded.org (Postfix) with ESMTP id F00A36D3A7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Nov 2013 05:06:25 +0000 (UTC)
Received: by mail-pb0-f49.google.com with SMTP id um1so4348048pbc.22
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Nov 2013 21:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=OD7q/EYILz9bhl4ku+0SCdCvMJOk65xE3tu8OqgPH3Y=;
	b=RgOW2BdXRZzITA6AfOXitX56wg1qoiCunhNCe854kqlhEtflm4JjYk6yx0swGboSbb
	lezWan8u6NsMoz/8oVQ4kZjd9972DkEzM5/gKFbmx0xSRtqZBfjohXeHp1FVdX+fdb3w
	F6Pr0sZjVASGcrRLmbhO8UbIG1JbMfqhqM3TlBK9Uy0IdrJZJyStOMNu7AUvICrSRezA
	Z/rl8gxINUvihSmzul6HAofezBAPTj+zj78xVlDHppgxk8iIPO1gDNFKJuvs6WN21EH4
	cuDNNl6LL5DVJDg1vegsLzLlCdK1XYAFa4NyyRPLVSZhssgn9ubgHHq0rPoXAkmP+dMF
	5a1A==
X-Received: by 10.67.23.164 with SMTP id ib4mr34903117pad.42.1384232787781;
	Mon, 11 Nov 2013 21:06:27 -0800 (PST)
Received: from haswell.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	fb3sm34617314pbc.29.2013.11.11.21.06.26 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Nov 2013 21:06:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Nov 2013 21:06:12 -0800
Message-Id: <1384232772-6151-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-browser][PATCH] nspr: match bbappend with recipe PV in OE-core
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
X-List-Received-Date: Tue, 12 Nov 2013 05:06:26 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-support/nspr/{nspr_4.10.bbappend => nspr_4.10.1.bbappend} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename recipes-support/nspr/{nspr_4.10.bbappend => nspr_4.10.1.bbappend} (100%)

diff --git a/recipes-support/nspr/nspr_4.10.bbappend b/recipes-support/nspr/nspr_4.10.1.bbappend
similarity index 100%
rename from recipes-support/nspr/nspr_4.10.bbappend
rename to recipes-support/nspr/nspr_4.10.1.bbappend
-- 
1.8.3.2


