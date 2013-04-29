Received: from mail-pb0-f49.google.com ([209.85.160.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UWpmD-0007y7-G7
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Apr 2013 17:14:04 +0200
Received: by mail-pb0-f49.google.com with SMTP id rp8so680599pbb.22
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Apr 2013 07:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=q7JGl+Rdij07bXvhWWMRmzIhly1QZzodPAtmaq76k8s=;
	b=Yg2kfHjLs+ONhvhWSIbvMyF6saW4nA09Y9cd74lrjY03vR7J+RHTfjV8JXQeDTYbPw
	FFxK2Z49zBygT6DXGdGL2Kg4G1pWwxSnqfqw8U7SdKRK5rhgvdqHIAzoWzqjPb4R8fZ8
	iG23OFU+cpl7DyP0EGeidU7sgr7t/vhKBGCGBxdn4tn6SemtTS/cvUDmuTOgiFGxH5Y/
	LXt3plBX8vj7FnmQV5eZ1AKJYGp3hhv1tzEHf32WPC7zEYxb1Pr+6+jNW/7zVSvZDwxV
	mLVnXlpvYf7ybO2PD6k3wnO4qnVhi5JhchfZ4CavbDAa1mTPJ27v8unAq1o8MzgmWXKS
	GKBA==
X-Received: by 10.68.58.103 with SMTP id p7mr70650546pbq.156.1367247370409;
	Mon, 29 Apr 2013 07:56:10 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	yp2sm26251095pab.10.2013.04.29.07.56.07 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 29 Apr 2013 07:56:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Apr 2013 16:56:22 +0200
Message-Id: <1367247382-6797-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
Subject: [meta-browser][PATCH] nspr: rename bbappend to match new version from oe-core
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
X-List-Received-Date: Mon, 29 Apr 2013 15:14:26 -0000

---
 recipes-support/nspr/{nspr_4.9.5.bbappend => nspr_4.9.6.bbappend} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename recipes-support/nspr/{nspr_4.9.5.bbappend => nspr_4.9.6.bbappend} (100%)

diff --git a/recipes-support/nspr/nspr_4.9.5.bbappend b/recipes-support/nspr/nspr_4.9.6.bbappend
similarity index 100%
rename from recipes-support/nspr/nspr_4.9.5.bbappend
rename to recipes-support/nspr/nspr_4.9.6.bbappend
-- 
1.8.2.1



