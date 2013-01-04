Received: from mail-ea0-f179.google.com ([209.85.215.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tr6V9-0008RZ-Cd
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jan 2013 13:36:07 +0100
Received: by mail-ea0-f179.google.com with SMTP id i12so6572798eaa.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jan 2013 04:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=DYuV4Gi/bcF6HJabJz/xdXH2CFQdxMVEDtf7kI1wfwI=;
	b=SMneBVnm2I74qBl7uH2bEm4WV26MVi8u/UbyyoXbUBHiaWijnbkEKGXgZpZ474aDjm
	uFSD2plKZ11F3oTWJbF583ZtwKLWXqNtbmT8B0+turKIFRTQ3+0UcRftQZxEP3ud0GS4
	WMyml8FOJrsFZdpAu3YbIGapE+8aNb2BCh9vg49k7gqQM2mhTM42G+MHjJ5q5N7NMCti
	pfUq6hzEU7CK+Xuh8KPXiUpdx53YD5k2E+nKagcN1+rU2wofR29MlzUpYadcZV/mID6z
	Ch0bsXIPIU2fOfMYG85UqduZsaU5eLM2eVkpN104w9k8+LHBbOcBeZXOf/WVt5N+Ibvw
	LqtA==
X-Received: by 10.14.194.199 with SMTP id m47mr142938450een.11.1357302050598; 
	Fri, 04 Jan 2013 04:20:50 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id z8sm110367341eeo.11.2013.01.04.04.20.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 Jan 2013 04:20:50 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 Jan 2013 13:20:35 +0100
Message-Id: <f7bc832e4fdd5638651a0b78daed1a48a0e7d636.1357301108.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1357301108.git.Martin.Jansa@gmail.com>
References: <cover.1357301108.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1357301108.git.Martin.Jansa@gmail.com>
References: <cover.1357301108.git.Martin.Jansa@gmail.com>
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-oe][danny][PATCH 5/6] midori: move to meta-gnome due to libnotify
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
X-List-Received-Date: Fri, 04 Jan 2013 12:36:14 -0000
X-List-Received-Date: Fri, 04 Jan 2013 12:36:14 -0000
X-List-Received-Date: Fri, 04 Jan 2013 12:36:14 -0000

From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 {meta-oe => meta-gnome}/recipes-connectivity/midori/midori_0.4.6.bb | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename {meta-oe => meta-gnome}/recipes-connectivity/midori/midori_0.4.6.bb (100%)

diff --git a/meta-oe/recipes-connectivity/midori/midori_0.4.6.bb b/meta-gnome/recipes-connectivity/midori/midori_0.4.6.bb
similarity index 100%
rename from meta-oe/recipes-connectivity/midori/midori_0.4.6.bb
rename to meta-gnome/recipes-connectivity/midori/midori_0.4.6.bb
-- 
1.8.0.2



