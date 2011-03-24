Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q2tw9-0004AQ-LL
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Mar 2011 00:27:29 +0100
Received: by mail-bw0-f47.google.com with SMTP id 10so577628bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2011 16:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=f07hU6f6LEqJk6HIUQ0de8XKS3aonnlnrVXiKgYcZ0M=;
	b=fjAXY/IWUcVedBCsUhUXrrQ8ZrR4eQPz6QksHSr3BM74rYsuvIT06nDj8xdYSU+Cgg
	s0/HOxSDH9G8Sk5kAhEeZ2lNyCVBmpE811aQ9WrJlqftX7+Y/L/hUvu97wUrSDynQd+I
	C80f7KUObTslGo4cXRDz/MnZ+/pxfazcOAkUI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=L5K4vm4VxLtWa8Xb9Y69irsN+z9wLn7UHKP7jICvS4XdUhzjDvylYgQye3U3bnSJZE
	tbOAfTP1XIUf+zR2+UN6vmF0x7ftE9uXXALqi/mRSyOhh+I1+9LmtI8B4UAyf4ax39sx
	sygOvUzKkhgFU6GKFkVtjky3sf3dh8LJMSN9o=
Received: by 10.204.19.20 with SMTP id y20mr65157bka.170.1301009135919;
	Thu, 24 Mar 2011 16:25:35 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id z18sm317046bkf.20.2011.03.24.16.25.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Mar 2011 16:25:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Mar 2011 00:25:28 +0100
Message-Id: <b434f07098e0c55d882bb3c4fa9d53116fc89b7f.1301008354.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301008354.git.Martin.Jansa@gmail.com>
References: <cover.1301008354.git.Martin.Jansa@gmail.com>
Subject: [PATCH 1/8] eet: add LIC_FILES_CHKSUM
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
X-List-Received-Date: Thu, 24 Mar 2011 23:27:29 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/eet.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/eet.inc b/meta-efl/recipes-efl/efl/eet.inc
index aacb878..5b8ccb2 100644
--- a/meta-efl/recipes-efl/efl/eet.inc
+++ b/meta-efl/recipes-efl/efl/eet.inc
@@ -1,6 +1,7 @@
 DESCRIPTION = "EET is the Enlightenment data storage library"
 DEPENDS = "pkgconfig zlib jpeg openssl eina gnutls"
 LICENSE = "MIT BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4ca74999c2a19695474d532d2f2ac886"
 
 inherit efl
 
-- 
1.7.4.1



