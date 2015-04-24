Return-Path: <dbaryshkov@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 1DE36738EB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Apr 2015 20:59:37 +0000 (UTC)
Received: by wiun10 with SMTP id n10so32953517wiu.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Apr 2015 13:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:in-reply-to:references;
	bh=FNQ1CaMgBR/xnS0lv25Ms1fXeNWpbczRkhJevETSeyg=;
	b=y965JfNKx+3F399RrU9th7C32HWZj0UNjelE66Kgy2IuRjOJirOSds6bmDIzmEWDMA
	hIqUhoevBAqTeBO7nV5BcNx53Z0WeBDECUBCVF+CpSjmE2FC9N//yJcLU+3tBVm/Zgsl
	GHRft3+ISJnwlr1Crxtr6A7QPDaZHCnekPnJycqa0MziriLfZeaG54Lh6NIbtTlXy7Pa
	GhEXeFPz+nq02yFNtJPTghtFXfGjOh2hQIY0yNS6xBYs9CEW4Fa0DF1PWPw42dJ4Kwb7
	mIJKizu+QD3KYETlivR9zJkHeYhoxtR4xccVGI+soUSovLZ/gydvNfIomNSzdMybd3dT
	WgGQ==
X-Received: by 10.180.104.4 with SMTP id ga4mr1491522wib.86.1429909178838;
	Fri, 24 Apr 2015 13:59:38 -0700 (PDT)
Received: from fangorn.rup.mentorg.com (nat-min.mentorg.com. [139.181.32.34])
	by mx.google.com with ESMTPSA id e2sm643447wij.5.2015.04.24.13.59.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Apr 2015 13:59:37 -0700 (PDT)
Sender: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
From: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Apr 2015 23:59:19 +0300
Message-Id: <1429909159-8425-5-git-send-email-dmitry_eremin@mentor.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1429909159-8425-1-git-send-email-dmitry_eremin@mentor.com>
References: <1429909159-8425-1-git-send-email-dmitry_eremin@mentor.com>
Subject: [meta-opie][PATCH 5/5] qpf-bitstream-vera: fix LICENSE information
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
X-List-Received-Date: Fri, 24 Apr 2015 20:59:40 -0000

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
---
 recipes-qtopia/qpf-fonts/qpf-bitstream-vera_1.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qtopia/qpf-fonts/qpf-bitstream-vera_1.10.bb b/recipes-qtopia/qpf-fonts/qpf-bitstream-vera_1.10.bb
index 29e3f62..711e466 100644
--- a/recipes-qtopia/qpf-fonts/qpf-bitstream-vera_1.10.bb
+++ b/recipes-qtopia/qpf-fonts/qpf-bitstream-vera_1.10.bb
@@ -1,7 +1,7 @@
 require qpf.inc
 
 DESCRIPTION = "The Bitstream Vera fonts - QPF Edition"
-LICENSE = "Bitstream Vera"
+LICENSE = "BitstreamVera"
 PR = "r3"
 
 PROVIDES = "qpf-bitstream-vera-small qpf-bitstream-vera-large"
-- 
2.1.4


