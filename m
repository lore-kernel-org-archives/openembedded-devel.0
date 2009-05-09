Received: from [209.85.132.246] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M2ars-0000Uf-BF
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 May 2009 02:56:44 +0200
Received: by an-out-0708.google.com with SMTP id b6so1008390ana.42
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 May 2009 17:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=9ujdk8uVvKKz1AubhC9fEjLzL+xIh3p4gwAtd5iklD4=;
	b=JNaIE+no0dW1JWaka4KBAJosT+T1A9/LDdlny0w6jRAB+62wllUymCMkppyKsYuZJ6
	wSVRlxXvyXcdjXa0kYjSUFgCHsANkRlnlWKJdu4mtKL1KhVwvA+0p9hNYth185PV/NL4
	bKI9tesRoos9DsfI27XwOMbycS/0ppdydZoY8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=BvUYtY/9fp7cVT+clsrEwJSrDFq7+dTyj5ixlIxOFdKDudQuMDYe/rBXRsSVrLwjaj
	Yt7iitkKu2g3pTuifERItSmQJsa/w6fIiTbsfRCHH/M0kfeF0CW9h8CL4skjQRU05+NV
	KfWBOyk0fzyGQ1o9FwHHCuR9InoL+jmze4dQU=
Received: by 10.100.144.14 with SMTP id r14mr8905341and.65.1241830219729;
	Fri, 08 May 2009 17:50:19 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 9sm394380ywf.32.2009.05.08.17.50.17
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 08 May 2009 17:50:18 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id F19A461019F; Fri,  8 May 2009 21:50:52 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 May 2009 21:50:24 -0300
Message-Id: <1241830239-5594-9-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.6.3.rc1.51.gea0b7
In-Reply-To: <1241830239-5594-8-git-send-email-otavio@ossystems.com.br>
References: <1241830239-5594-1-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-2-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-3-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-4-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-5-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-6-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-7-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-8-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 08/23] checksums.ini: firefox-l10n-pt-br
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
X-List-Received-Date: Sat, 09 May 2009 00:56:44 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 conf/checksums.ini |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/conf/checksums.ini b/conf/checksums.ini
index cc060fb..5daf8ec 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -19194,6 +19194,10 @@ sha256=6bca237485a352362133792e000a3c8e367a26b0312c5c607db7c2a97717d15f
 md5=2e81938855cf5cc38856bd4a31d79a4c
 sha256=a13c81897c94b3d6e705fc9da07c610492e28cf7abd5ff8e992f0ec95a269d62
 
+[http://releases.mozilla.org/pub/mozilla.org/firefox/releases/3.0.4/linux-i686/xpi/pt-BR.xpi]
+md5=29c672886aa9ca41428ba04196938545
+sha256=1474828a58f893bed20f0e0cd26bc310c7472d69bf7a1ae01c00a371de256b1a
+
 [ftp://ftp.ossp.org/pkg/lib/pth/pth-2.0.0.tar.gz]
 md5=f84a87295fef3b41499f3b728b1f0050
 sha256=1935a06368c1555d5f80329ba1e53f5b1a7dd9efb7fc9354427f2d1a583c81a3
-- 
1.6.3.rc1.51.gea0b7



