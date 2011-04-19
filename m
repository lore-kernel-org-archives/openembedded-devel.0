Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michael.lippautz@gmail.com>) id 1QC9R3-00054c-Sz
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Apr 2011 13:49:38 +0200
Received: by ewy5 with SMTP id 5so1660767ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Apr 2011 04:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=Ja4FfiOjHgFnW4eXlpnaFS6gP8Z+2QepIteyt5zf+Mc=;
	b=Eu3HBgCT+nLSrrDUnDpropdG0T/rCWVDb0bplC3tUQqCobNQ7ToTqefflC0T6q7Tfh
	+kV50KjyuWAu5qMp7XoTpIG6Oz7jubH6kR/6Q3jTtekezjF56wOAQTEsknUFnyfhkpPC
	DgmWthtkP3qzUXsIV2pCVgXEmGDQnjh3zPlxo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=HVyiJCSiP2hPFHn6GJ+tRYZGf/U0HFuE/Iu6liqP2q7NUvWuKRw5lZibVG6aHGcv1m
	VVqPUbyATrwAH7EJ1iy+MFLSGD85Tg013243HiKfe7NZbbdjaRgPNPnb/XDJJg5uKAGD
	Nx+xckvE4udcBr0ao0rup54WrFjqwBqQVBv3c=
Received: by 10.14.43.133 with SMTP id l5mr2042593eeb.171.1303213635865;
	Tue, 19 Apr 2011 04:47:15 -0700 (PDT)
Received: from localhost.localdomain ([62.218.44.194])
	by mx.google.com with ESMTPS id r48sm4752396eei.23.2011.04.19.04.47.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 19 Apr 2011 04:47:15 -0700 (PDT)
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Apr 2011 13:47:11 +0200
Message-Id: <1303213631-7082-1-git-send-email-michael.lippautz@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-oe] fakeroot: Add LIC_FILES_CHKSUM
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
X-List-Received-Date: Tue, 19 Apr 2011 11:49:38 -0000

Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>
---
 meta-oe/recipes-core/fakeroot/fakeroot_1.12.4.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-oe/recipes-core/fakeroot/fakeroot_1.12.4.bb b/meta-oe/recipes-core/fakeroot/fakeroot_1.12.4.bb
index c265749..1cc5602 100644
--- a/meta-oe/recipes-core/fakeroot/fakeroot_1.12.4.bb
+++ b/meta-oe/recipes-core/fakeroot/fakeroot_1.12.4.bb
@@ -2,6 +2,7 @@ DESCRIPTION = "Gives a fake root environment"
 HOMEPAGE = "http://fakeroot.alioth.debian.org"
 SECTION = "base"
 LICENSE = "GPL"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7686b00e9859a1a04043d33452bae823"
 PR = "r2"
 
 SRC_URI = "\
-- 
1.7.3.4



