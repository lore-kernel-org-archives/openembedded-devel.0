Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Szpgn-0001GZ-Rb
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Aug 2012 15:55:45 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so1218754wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Aug 2012 06:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=GtKrsPtNJmQz+KiytU6guHD77cJ026U7fv37tmTDETE=;
	b=caUGlSRn28KwcGoTjxKaym5FBJE1q8QP4U/6KCzodQSY20Yql+ZBzQlggm4KJU478I
	4ty6TTH3Yg3CcKHwgPhy5RKZOlE/i8M+yc0HmRm9YpXPc8D4ZOaGqygVTlfQpKZmC0kL
	QRpYG3tYNQNaNr9MkNjvem03muTmbrWFgjilR39L8BcJ3Pph824x7RREtdUYW6RQj3Ae
	XpIhGVqSv6JQON6fa+JbLlRnGRTf609HUeXDmLLN+5XbGuJ59N8ft92zzxLVoqthvrfo
	SfyTpfaCPb/SN/o8818FVAIXAlrX8p04QCSgppnXRCW6Ujtxr0XlR4jF5689dCkXqQil
	k8Kg==
Received: by 10.180.97.33 with SMTP id dx1mr6191738wib.18.1344606238368;
	Fri, 10 Aug 2012 06:43:58 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id el6sm7814760wib.8.2012.08.10.06.43.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Aug 2012 06:43:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Aug 2012 15:42:57 +0200
Message-Id: <864839abb11ee81197e5431787d6abad7ebaf005.1344601517.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
	<cover.1344601517.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1344601517.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 02/46] e-base: bump EFL_SRCREV
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
X-List-Received-Date: Fri, 10 Aug 2012 13:55:45 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/classes/e-base.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-efl/classes/e-base.bbclass b/meta-efl/classes/e-base.bbclass
index 27dd2eb..c1e564f 100644
--- a/meta-efl/classes/e-base.bbclass
+++ b/meta-efl/classes/e-base.bbclass
@@ -1,6 +1,6 @@
 HOMEPAGE = "http://www.enlightenment.org"
 SRCNAME ?= "${BPN}"
 
-EFL_SRCREV ?= "70490"
+EFL_SRCREV ?= "74035"
 
 ARM_INSTRUCTION_SET = "arm"
-- 
1.7.8.6



