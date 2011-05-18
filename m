Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QMorh-00037i-K1
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 May 2011 00:05:13 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so1850159fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 May 2011 15:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=towIYrgKzPBGTWaMQDqvHyK8a1zTJzeeWXiwyrXQ20c=;
	b=tn547kL9WQHCke2VaI23iVraj5ZRuqb/hj1ZbJ3LZcXtiPYjPGgGbUgH1dIUyfC3XC
	vJMr3l7C5QwlUeY4CjhxvTK1HC7JKWGm6u3lSVkRDV7wep4u5DPHk3c59HHLJpsgxXsj
	D9YgCcqDrGdDk7Pi3c9DcSoTt/VUC1CSstgwA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=UVXwns0v2C2KwC6MkGacr+c3cZ6zU2euZiwMWQ52Scvox37wCoe3iOnAdNzBVQfgRW
	1j8rxVa3d3XWQ1G0fTBtZv7Ac42HfYadd1H2mS/rEw7eASBWrqkOUAqrWXLpBCx/OD6y
	fpNVC/PJ0muqX/5kwpVTWIqfnDsOlrrc+pToU=
Received: by 10.223.69.65 with SMTP id y1mr3058149fai.60.1305756140519;
	Wed, 18 May 2011 15:02:20 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id 18sm807824fan.25.2011.05.18.15.02.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 May 2011 15:02:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 May 2011 00:02:13 +0200
Message-Id: <2e6ae9a53e01f3cc836e735a80ae48872c8ca06e.1305755919.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
In-Reply-To: <cover.1305755919.git.Martin.Jansa@gmail.com>
References: <cover.1305755919.git.Martin.Jansa@gmail.com>
Subject: [meta-efl 2/2] e-base: bump EFL_SRCREV a bit
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
X-List-Received-Date: Wed, 18 May 2011 22:05:13 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/classes/e-base.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-efl/classes/e-base.bbclass b/meta-efl/classes/e-base.bbclass
index 936a20d..26639f6 100644
--- a/meta-efl/classes/e-base.bbclass
+++ b/meta-efl/classes/e-base.bbclass
@@ -2,7 +2,7 @@ HOMEPAGE = "http://www.enlightenment.org"
 SRCNAME ?= "${BPN}"
 
 # usually tracks svn trunk HEAD
-EFL_SRCREV ?= "59242"
+EFL_SRCREV ?= "59463"
 # revision when 1.0.0 was released, for recipes which don't need rebuild so often
 EFL_SRCREV_1.0.0 ?= "56356"
 
-- 
1.7.5.rc3



