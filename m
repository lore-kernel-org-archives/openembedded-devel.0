Return-Path: <dbaryshkov@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id A0F78738EB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Apr 2015 20:59:36 +0000 (UTC)
Received: by widdi4 with SMTP id di4so35657046wid.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Apr 2015 13:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:in-reply-to:references;
	bh=f582FCIaLLQk+ZbYGRlI2u/KFr8oakcRPOkFORBydQ0=;
	b=w0HfGol7IvuMOSlXch/z4aP0779Vd/s5wtl6fcT7Jn9yJfebLRESL9EpWLMHhbbBoO
	fISH+jfPDz0TMCoebzg884P5NfEjXO07FdYMaGfNkJmJB1i+rxBWnSyWDOlsEI0qcMj0
	riZsPeUTsKkCSXrbwakYqlYeRTgcSLbAa409vmf3SHHLssg53wiYu9InE1yGMJsrs+Wh
	pV0DhJyEaFffwpYj04SfAvvtS7UbQTkTTKFgi33PTQazP5/WBYBG2QmKsIIs3SNiJdbF
	hkaPyp6OjxvIvt9B12c8JSGV9YpYMm/Sejs8Lm5iMQt3XU3/XEjou5CfTNaftBZWEVhY
	OuSg==
X-Received: by 10.180.83.130 with SMTP id q2mr1380809wiy.89.1429909177375;
	Fri, 24 Apr 2015 13:59:37 -0700 (PDT)
Received: from fangorn.rup.mentorg.com (nat-min.mentorg.com. [139.181.32.34])
	by mx.google.com with ESMTPSA id e2sm643447wij.5.2015.04.24.13.59.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Apr 2015 13:59:36 -0700 (PDT)
Sender: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
From: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Apr 2015 23:59:18 +0300
Message-Id: <1429909159-8425-4-git-send-email-dmitry_eremin@mentor.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1429909159-8425-1-git-send-email-dmitry_eremin@mentor.com>
References: <1429909159-8425-1-git-send-email-dmitry_eremin@mentor.com>
Subject: [meta-opie][PATCH 4/5] qpf-bitstream-vera-sans-mono: fix LICENSE information
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
X-List-Received-Date: Fri, 24 Apr 2015 20:59:37 -0000

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
---
 recipes-qtopia/qpf-fonts/qpf-bitstream-vera-sans-mono_1.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qtopia/qpf-fonts/qpf-bitstream-vera-sans-mono_1.10.bb b/recipes-qtopia/qpf-fonts/qpf-bitstream-vera-sans-mono_1.10.bb
index 95b6ebf..8451e72 100644
--- a/recipes-qtopia/qpf-fonts/qpf-bitstream-vera-sans-mono_1.10.bb
+++ b/recipes-qtopia/qpf-fonts/qpf-bitstream-vera-sans-mono_1.10.bb
@@ -1,7 +1,7 @@
 require qpf.inc
 
 DESCRIPTION = "Bitstream Vera Monospaced Font, QPF for Qt/Embedded"
-LICENSE = "Bitstream Vera"
+LICENSE = "BitstreamVera"
 PR = "r5"
 
 PROVIDES += "qpf-bitstream-vera-sans-mono-small"
-- 
2.1.4


