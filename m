Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1RrVNd-0001Yk-Uq
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Jan 2012 15:05:17 +0100
Received: by eaal12 with SMTP id l12so913780eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Jan 2012 05:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=a6CV5jihVltjrX7MlvaYb9qfebPKYQGCkulrXXGiP3w=;
	b=EIizls/ZLN0ZdNNOzy4EMFKz+eOVvPLI12BHDSecTby1qApevr9v/HxBKSqessXjPV
	EMhFZPkHRjZ7d9C69432Z/eBKC3Sp/2KR8P2fp0uvy1XIZaKWC+aiOY19w2lFD3bceuE
	7RmzqfOpkXm7hkjYR3lPDeA8keAf1eU+n8ZK0=
Received: by 10.213.35.135 with SMTP id p7mr2198609ebd.131.1327845446428;
	Sun, 29 Jan 2012 05:57:26 -0800 (PST)
Received: from localhost.localdomain (p4FDF017C.dip.t-dialin.net.
	[79.223.1.124])
	by mx.google.com with ESMTPS id t11sm31778265eea.10.2012.01.29.05.57.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 Jan 2012 05:57:25 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 Jan 2012 14:59:31 +0100
Message-Id: <1327845574-26155-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [meta-xfce 1/4] README: Changed email address
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
X-List-Received-Date: Sun, 29 Jan 2012 14:05:18 -0000
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



