Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q7N16-0003cL-3C
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Apr 2011 09:19:04 +0200
Received: by fxm19 with SMTP id 19so888220fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Apr 2011 00:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=dm3vdcpuNSaIfXJGD9P4J5Y46fZ96bOLRCvSOrVhVSI=;
	b=Zpa0tvMHkJx+CmLy9meM4EEdGRl9F5Sx4hzjKFXEqGM0PLBqA2qkIiBLBfRPAaKsMA
	Wa37sQIoUtcO+mob6gVReS/lHbM8fcXiV3CMoyir7UYWFNTWTMoPde9TLmpJvsuwZ/kR
	rInmy9+7MCrBT5tsmswVH8OQlF28QEIQleFvg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=JfqfbeTwO8WJ4SWSp1OlOaU/YSCYJ2rEK7VojCroaPwBhDcVCAngdpBXGFhg4j2WIr
	aHBUm2uakLfmhnaPbhnNGrFiFx6gk0EKQ/e3d8jaweWbjdKwysowbSOtT84/4Sd73ebJ
	fqYriogb1/du91vK3NMrWesivrG3M3UhefC8M=
Received: by 10.223.127.210 with SMTP id h18mr645568fas.71.1302074217850;
	Wed, 06 Apr 2011 00:16:57 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id c24sm80818fak.31.2011.04.06.00.16.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 06 Apr 2011 00:16:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Apr 2011 09:16:55 +0200
Message-Id: <58d2c0200505489e56fc9b37a1bccfdb8d88d725.1302074016.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1302074016.git.Martin.Jansa@gmail.com>
References: <cover.1302074016.git.Martin.Jansa@gmail.com>
Cc: Paul Menzel <paulepanter@users.sourceforge.net>
Subject: [PATCH 6/8] e-base: bump SRCREV
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
X-List-Received-Date: Wed, 06 Apr 2011 07:19:04 -0000

---
 meta-efl/classes/e-base.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-efl/classes/e-base.bbclass b/meta-efl/classes/e-base.bbclass
index c27ba0e..2692cfe 100644
--- a/meta-efl/classes/e-base.bbclass
+++ b/meta-efl/classes/e-base.bbclass
@@ -2,7 +2,7 @@ HOMEPAGE = "http://www.enlightenment.org"
 SRCNAME ?= "${BPN}"
 
 # usually tracks svn trunk HEAD
-EFL_SRCREV ?= "56372"
+EFL_SRCREV ?= "58315"
 # revision when 1.0.0 was released, for recipes which don't need rebuild so often
 EFL_SRCREV_1.0.0 ?= "56356"
 
-- 
1.7.4.1



