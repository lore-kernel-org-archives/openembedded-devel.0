Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q2hWK-0002BU-9o
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Mar 2011 11:12:00 +0100
Received: by mail-bw0-f47.google.com with SMTP id 10so7236709bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2011 03:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=gSDUeMI1AjGA6VOVbCM3Jipr9S94BFjTecmD5QhCjmo=;
	b=cFe6TiMwD+fn9gLA9DHHhAWDJH5m6H0xvX5wxlsQuR9tJC+ZFUdsLIvLSw89rWGpDO
	BQ2jl5eArFi9HMjGd4HcxkLHfhC+A4qA0mIDxcoLu6xlQFID4Yn2ASYi2BEiEpi0f/uH
	GW1wizP1SN+sZMnzpEz2LSYHmlb53aVTtxLso=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=G1+vgO8tWDjneLQx+rGBMpRMs0SqQKyhU+I9O8RJA+7V/5Yd+MG/4gPNbqKh3OTqQL
	1sUD97ZaND5KR2sm1DHzbP/cERw4EJY6/547mGzxiv29rklxMLVP5F2ijmsUg+L/NfEE
	MfpNKKa3UPty7wXxLkW9OEmJauCMVxnsU7Op8=
Received: by 10.204.175.194 with SMTP id bb2mr7230917bkb.121.1300961410366;
	Thu, 24 Mar 2011 03:10:10 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id w3sm6584003bkt.17.2011.03.24.03.10.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Mar 2011 03:10:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Mar 2011 11:10:02 +0100
Message-Id: <e3233329efa0d0b384f4d3e5cc9970441f209df0.1300961186.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1300961186.git.Martin.Jansa@gmail.com>
References: <cover.1300961186.git.Martin.Jansa@gmail.com>
Subject: [PATCH 2/7] mime-support: add LIC_FILES_CHKSUM
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
X-List-Received-Date: Thu, 24 Mar 2011 10:12:00 -0000

---
 .../mime-support/mime-support_3.44.bb              |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-oe/recipes-support/mime-support/mime-support_3.44.bb b/meta-oe/recipes-support/mime-support/mime-support_3.44.bb
index 415022a..99c2af7 100644
--- a/meta-oe/recipes-support/mime-support/mime-support_3.44.bb
+++ b/meta-oe/recipes-support/mime-support/mime-support_3.44.bb
@@ -1,6 +1,7 @@
 SECTION = "base"
 DESCRIPTION = "MIME files 'mime.types' & 'mailcap', and support programs"
 LICENSE = "PD"
+LIC_FILES_CHKSUM = "file://debian/README;md5=36bbe2ace0a05c3fb684b73208fbf30b"
 
 DEPENDS = "file"
 RRECOMMENDS_${PN} = "file"
-- 
1.7.4.1



