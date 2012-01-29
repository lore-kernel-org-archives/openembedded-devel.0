Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1RrcQV-0005Ws-45
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Jan 2012 22:36:43 +0100
Received: by eekd41 with SMTP id d41so997212eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Jan 2012 13:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=a6CV5jihVltjrX7MlvaYb9qfebPKYQGCkulrXXGiP3w=;
	b=oplap2LJMsQsTA6HRCUa4CW1z2mBI4eGzvM4nw0htEzMRll3yR0ZSKC8Uga+7bdJc4
	uF5qD4lHLIcOK6+kSrJbCICifQar8yUfvnuONXUMdfkvyukBq/VLXXvUQmUmMpLqUwjF
	dq0f0A3/lh8T8GwPVJR3um52qa+VTdVSqEXoc=
Received: by 10.14.47.130 with SMTP id t2mr902949eeb.100.1327872531593;
	Sun, 29 Jan 2012 13:28:51 -0800 (PST)
Received: from localhost.localdomain (p4FDF017C.dip.t-dialin.net.
	[79.223.1.124])
	by mx.google.com with ESMTPS id n17sm63740491eei.3.2012.01.29.13.28.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 Jan 2012 13:28:51 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 Jan 2012 22:30:55 +0100
Message-Id: <1327872658-3574-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1327872658-3574-1-git-send-email-schnitzeltony@googlemail.com>
References: <1327872658-3574-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce][v2 1/4] README: Changed email address
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
X-List-Received-Date: Sun, 29 Jan 2012 21:36:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/README |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-xfce/README b/meta-xfce/README
index c7186be..6e021e1 100644
--- a/meta-xfce/README
+++ b/meta-xfce/README
@@ -12,4 +12,4 @@ Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-xfce
 
 When sending single patches, please using something like 'git send-email -1 --to openembedded-devel@lists.openembedded.org --subject-prefix meta-xfce'
 
-Interim layer maintainer: Andreas Müller <schnitzeltony@gmx.de>
+Interim layer maintainer: Andreas Müller <schnitzeltony@googlemail.com>
-- 
1.7.4.4



