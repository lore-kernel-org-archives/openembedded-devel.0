Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QAGPL-000652-GX
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Apr 2011 08:52:03 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so1173770fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Apr 2011 23:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=p93KRjeopLfbKoAowrTvS3LlOPSF/5g05CrfMkpQT+A=;
	b=LgTdwEkkQwUBKBM2EuPW3P0X4YyMId2XtJ6l3MJsPiACVOcDYO/+LxzDsFu/X7pSAk
	qZgpRvjs9bMFrRbfJGJvQQw5dxHmSI7DAGnaGOinuUpo4HsKULVhh2GV8qC4lRfNQIAR
	gzOlvzEbJskkKvqE9dw7d8kQAFafb6P/6bhNQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=JVdt82sbZn4C+IaOFau6K8tcuzPuDLJU2tHNdeN/qHzwwG9W67FD66X6uGWv7Gv/zp
	chpp3qR0r3PcqlV5tpyGP86SuGB9NOa7+Ae/VTTCO3aHz0khbKLkA0SQ4QYo3BRtT2yD
	uVJnTZ+Cf5yOQOUqCF7lr/WYcn+5KNGm2QQRs=
Received: by 10.223.127.210 with SMTP id h18mr419568fas.67.1302763790330;
	Wed, 13 Apr 2011 23:49:50 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id f15sm395864fax.10.2011.04.13.23.49.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 13 Apr 2011 23:49:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Apr 2011 08:49:48 +0200
Message-Id: <e30782f2e4057c2849da619ef7fa004b3d9eb69c.1302763646.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc1
In-Reply-To: <cover.1302763646.git.Martin.Jansa@gmail.com>
References: <cover.1302763646.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 1/2] e-base: bump SRCREV
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Apr 2011 06:52:03 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/classes/e-base.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-efl/classes/e-base.bbclass b/meta-efl/classes/e-base.bbclass
index 2692cfe..b25ddf2 100644
--- a/meta-efl/classes/e-base.bbclass
+++ b/meta-efl/classes/e-base.bbclass
@@ -2,7 +2,7 @@ HOMEPAGE = "http://www.enlightenment.org"
 SRCNAME ?= "${BPN}"
 
 # usually tracks svn trunk HEAD
-EFL_SRCREV ?= "58315"
+EFL_SRCREV ?= "58429"
 # revision when 1.0.0 was released, for recipes which don't need rebuild so often
 EFL_SRCREV_1.0.0 ?= "56356"
 
-- 
1.7.5.rc1



