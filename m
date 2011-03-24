Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q2twh-0004AQ-FO
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Mar 2011 00:28:03 +0100
Received: by mail-bw0-f47.google.com with SMTP id 10so577628bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2011 16:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=5fA9dNGx5LKo9USxY6aUqht8LqoU+tthMPZFiuLSIFw=;
	b=j92zBuMLYJnL2fxq0upNZ4NG3vt1OMnMzFPJqdMsG7MpImugFwL0JH7E9yZIKO+Hvy
	KIr+9armqsgV0JaYEq+BwiYFTQ2mlE3emp+EygAZKgZWryYJf0St32mri24nQQ/tSJiT
	VwvZepXRZx69Gz/E0j6/nC+wcDxbHlhPDsZM0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=PMqv+cFS6q3zFl4OjFHWYMZJ21mLKYwkFg/eCNA079S1OGotEGYMy4r2kmQ1QEqEDU
	f1g/fVCI5+I8F09bVtZfQ2cv69+nYeNNN6/uuuFke/A2JglInzBM6bU5XbK1SA6sW4Zk
	Z/odvMpkwceK7paEi2BbRF5o+rmHGDjvx8wn0=
Received: by 10.204.19.70 with SMTP id z6mr66358bka.204.1301009172465;
	Thu, 24 Mar 2011 16:26:12 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id q18sm324614bka.3.2011.03.24.16.26.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Mar 2011 16:26:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Mar 2011 00:26:05 +0100
Message-Id: <4a1766e46f1032e108c8494c5214bd1cc37fdbd6.1301008354.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301008354.git.Martin.Jansa@gmail.com>
References: <cover.1301008354.git.Martin.Jansa@gmail.com>
Subject: [PATCH 6/8] eeze: add LIC_FILES_CHKSUM
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
X-List-Received-Date: Thu, 24 Mar 2011 23:28:03 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/eeze.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/eeze.inc b/meta-efl/recipes-efl/efl/eeze.inc
index d8abfc1..133f2d3 100644
--- a/meta-efl/recipes-efl/efl/eeze.inc
+++ b/meta-efl/recipes-efl/efl/eeze.inc
@@ -1,5 +1,6 @@
 DESCRIPTION = "Eeze is a library to simplify the use of devices"
 LICENSE = "MIT BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5388f2e926064f899c2481629ec3de18"
 DEPENDS = "ecore udev"
 
 inherit efl
-- 
1.7.4.1



