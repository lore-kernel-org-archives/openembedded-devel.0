Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1P87f3-00020y-Op
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Oct 2010 10:35:10 +0200
Received: by fxm6 with SMTP id 6so1460955fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Oct 2010 01:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=G3BO14bXWZRqnYEdYhHxsL1Iw/XHTxBZbTr+Ix2Jsrw=;
	b=cOkd20G4dfAKVtRN9R026M7QMzQKBlIpJtvVu1TvJdkq4EqH5Y8ziHN9sG0VVkUY6O
	sJULOTYIzoiwtmx95G+zAcQP6mxkzKka+E1/N0X3DpgDpuAv/+W1HNuK8FUke0BfjIA3
	1hfgi9pKXUXbPFdRkyPaq6UWA79zczWfGoPnA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=isWzXx19laAmShY6g9VMp4GsITQDnt7GQVVOgtpYJ2McXhomLv+/nk1ikLLCqblBV+
	+4F7IDT8S9gdK9wQ6v8IaLgVLMhQn9YJew5ccx7wh1Z/yr0wQKYCHqQuByPCpTTAAADl
	ufMZyrTB+at8FS+I7fmpzJFytxjmeOCJ16shA=
Received: by 10.103.192.4 with SMTP id u4mr3877048mup.92.1287477274806;
	Tue, 19 Oct 2010 01:34:34 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id a16sm4233459fak.43.2010.10.19.01.34.34
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 19 Oct 2010 01:34:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Oct 2010 10:33:27 +0200
Message-Id: <1287477207-27752-14-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.3.1
In-Reply-To: <1287477207-27752-1-git-send-email-Martin.Jansa@gmail.com>
References: <1287477207-27752-1-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 13/13] removal: add entry for removing obsoleted openmoko recipes
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
X-List-Received-Date: Tue, 19 Oct 2010 08:35:10 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 removal.txt |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/removal.txt b/removal.txt
index c5891df..175e389 100644
--- a/removal.txt
+++ b/removal.txt
@@ -25,3 +25,12 @@ Removal Date:	2009-04-15
 Maintainer:	Jamie Lenehan
 Reason:		http://www.clamav.net/lang/en/2009/10/05/eol-clamav-094/
 Proposed by:	Roman I Khimov <khimov@altell.ru>
+
+Package Name:   obsolete/*openmoko* nonworking/*openmoko*
+Removal Date:   2010-12-22
+Maintainer:     None
+Reason:         Obsoleted by SHR/FSO packages
+Proposed by:    Martin 'JaMa' Jansa
+Note:		Openmoko distribution removed 2010-08-10
+Note:		Moved to obsolete on 2010-10-19
+
-- 
1.7.3.1



