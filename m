Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SzpiZ-0002bI-Qo
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Aug 2012 15:57:36 +0200
Received: by mail-wi0-f171.google.com with SMTP id hq4so1195192wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Aug 2012 06:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=VPJ5pTu4vUWMJj1vM5UnKF/80Mhw8jpmHc+v7PWbAgE=;
	b=tfvVSW3+FWKDUYm5Nrj06flmlEVxouHKTULAvwTDIuPUHmJ1sdboJfYbvV4ibUCf4Z
	4VaovUm1ORIvpC9/QoD0uBfCeq3zOA3S0Wgq7KlQw+vmzH0cGeBKTIy1+PdcLOa0Ej2z
	DA11xWdQ/65NDkAGOuXdcBt5AacLL+qneCgEPvmqc9I4KUr+7LpbnsYGSTh1KM54gOyz
	24YL7ux8DACS9iZlV8929LPLUe3CLpjYGwISY3v8X0uJZlx94WY9UGmxaz54EXRjaVFI
	14Z2Z9zxwitM9WvdzGKiMtFqUl1TVQJK5hGMncZ156zPTR8WnDlFStnGshfyb1bXILE8
	DH1w==
Received: by 10.180.99.133 with SMTP id eq5mr6264889wib.0.1344606348377;
	Fri, 10 Aug 2012 06:45:48 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id el6sm7823483wib.8.2012.08.10.06.45.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Aug 2012 06:45:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Aug 2012 15:43:11 +0200
Message-Id: <5c8522ec1a448c7fbaa22fe2ac20563037204155.1344601517.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
	<cover.1344601517.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1344601517.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 16/46] e-base: bump EFL_SRCREV again
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
X-List-Received-Date: Fri, 10 Aug 2012 13:57:36 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/classes/e-base.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-efl/classes/e-base.bbclass b/meta-efl/classes/e-base.bbclass
index c1e564f..d52b4dc 100644
--- a/meta-efl/classes/e-base.bbclass
+++ b/meta-efl/classes/e-base.bbclass
@@ -1,6 +1,6 @@
 HOMEPAGE = "http://www.enlightenment.org"
 SRCNAME ?= "${BPN}"
 
-EFL_SRCREV ?= "74035"
+EFL_SRCREV ?= "74419"
 
 ARM_INSTRUCTION_SET = "arm"
-- 
1.7.8.6



