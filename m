Received: from mail-ee0-f45.google.com ([74.125.83.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TqPKG-0006nK-Hn
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jan 2013 15:29:49 +0100
Received: by mail-ee0-f45.google.com with SMTP id d49so6758700eek.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Jan 2013 06:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=sZOvMca+NY2Ggzv9VqhTusMSCHncyhzRUlTkl7n+sf4=;
	b=DgTkPOivhxwMw/Rt8Ikm+49NJdeUCiuzI/xo/MUlnBEqMshgfwGbM3bOdvr+q32m9p
	IJj03OJHt92adZ6gcRmp7uGCFa41atcaRS19laEriYg3W5pQOeY/fkdAvHsTCDd/1aTO
	iQHbMlw9Sx0Nkj0ICd1rgGr1JoNhgfoBwswpy6vI02cSqUVLYSbbQ4AfDbKTlIVYbAR3
	PYW4hPKVJgym/HPpskNJTkVXOI+twDzCX/vOu1wf6zCFNs34TF0/1XL5PJdJkLkSv+a1
	FAiG5EOtAUHL/DYw0wMk85HhUcCPmoqUgP6r0mVV8AKZPFxnp/12CPiMCpPhSjXe4kPo
	VxRA==
X-Received: by 10.14.223.135 with SMTP id v7mr126074622eep.41.1357136085024;
	Wed, 02 Jan 2013 06:14:45 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id 6sm97745788eea.3.2013.01.02.06.14.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Jan 2013 06:14:44 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Jan 2013 15:14:45 +0100
Message-Id: <0dab891b020c65a86009037c2e6e124b67d98fd6.1357135909.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1357135909.git.Martin.Jansa@gmail.com>
References: <cover.1357135909.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1357135909.git.Martin.Jansa@gmail.com>
References: <cover.1357135909.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 4/6] e-base: bump EFL_SRCREV
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
X-List-Received-Date: Wed, 02 Jan 2013 14:29:49 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/classes/e-base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-efl/classes/e-base.bbclass b/meta-efl/classes/e-base.bbclass
index 1eb0eab..4c58d92 100644
--- a/meta-efl/classes/e-base.bbclass
+++ b/meta-efl/classes/e-base.bbclass
@@ -2,7 +2,7 @@ HOMEPAGE = "http://www.enlightenment.org"
 SRCNAME ?= "${BPN}"
 SRCVER ?= "${PV}"
 
-EFL_SRCREV ?= "81627"
+EFL_SRCREV ?= "81973"
 
 ARM_INSTRUCTION_SET = "arm"
 
-- 
1.8.0.2



