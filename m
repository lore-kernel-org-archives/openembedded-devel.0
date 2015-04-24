Return-Path: <dbaryshkov@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 73D37605D2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Apr 2015 20:59:33 +0000 (UTC)
Received: by wizk4 with SMTP id k4so35696473wiz.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Apr 2015 13:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:in-reply-to:references;
	bh=jgK7Fqssi48IaETRQA8wZxI+xGKo78SmA9CR5htgFGo=;
	b=Zwfr7647/LLLezb0sJB+47ND8JoI4f6s0qWAZRW2awh/EcIulDzVgz5//18En3iPzE
	/z+mGDeLH9azQIFG7QrAE9R4vGnqf83KnJt2cRxUmFNDrYcgfIV480ee5m3/WZgz6xta
	D+fWIfylEJAapbLSEe/lcw9OctJCv5j18uckMDTHw5Y+Cqs+b8aFQWfvZYe7Xs0PGqTR
	sdl6amOhwOWIGM5uIO43p347+B4r0WDDjcdPkbCdPyy1yRmUl983pi3UPzLPl1WrA9MQ
	PvsHNwcoInjm/cMUnNH1xaGREUHWL5QNi+sZVO1UX3HCjoL4mmTVhibebKS1FhFHJ+Ns
	nl+w==
X-Received: by 10.180.76.231 with SMTP id n7mr1481162wiw.44.1429909174857;
	Fri, 24 Apr 2015 13:59:34 -0700 (PDT)
Received: from fangorn.rup.mentorg.com (nat-min.mentorg.com. [139.181.32.34])
	by mx.google.com with ESMTPSA id e2sm643447wij.5.2015.04.24.13.59.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Apr 2015 13:59:34 -0700 (PDT)
Sender: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
From: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Apr 2015 23:59:16 +0300
Message-Id: <1429909159-8425-2-git-send-email-dmitry_eremin@mentor.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1429909159-8425-1-git-send-email-dmitry_eremin@mentor.com>
References: <1429909159-8425-1-git-send-email-dmitry_eremin@mentor.com>
Subject: [meta-opie][PATCH 2/5] kaffe: fix LICENSE information
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
X-List-Received-Date: Fri, 24 Apr 2015 20:59:35 -0000

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
---
 recipes-qtopia/kaffe/kaffe.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qtopia/kaffe/kaffe.inc b/recipes-qtopia/kaffe/kaffe.inc
index 605e1c0..2479fdb 100644
--- a/recipes-qtopia/kaffe/kaffe.inc
+++ b/recipes-qtopia/kaffe/kaffe.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Kaffe is a clean room implementation of the Java Virtual Machine"
 HOMEPAGE = "http://www.kaffe.org/"
-LICENSE  = "GPL LGPL W3C Classpath BSD"
+LICENSE  = "GPLv2 & LGPLv2 & W3C & Classpath & BSD"
 
 DEPENDS = "virtual/javac-native fastjar-native libffi zip-native libart-lgpl"
 RDEPENDS_${PN} = "${PN}-common (>= ${PV})"
-- 
2.1.4


