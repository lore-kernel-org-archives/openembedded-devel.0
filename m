Received: from [74.125.46.152] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M2ari-0000U5-NF
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 May 2009 02:56:34 +0200
Received: by yw-out-1718.google.com with SMTP id 9so1075454ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 May 2009 17:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=ZvoeoGVlyj6S00b+CmHbwRJHWDz4zvJLdX9NCilQtfU=;
	b=kJxuJRc9SyYSeMqsLi08pfqKoaL1kA/CV4VCEHmY0AKuDOVCU4dNu2RoTWRBybrMFl
	/aHUuA6EXBsz7OYViP5tSK4IuTT1+5Up3LOCM1KE4iY/5u5+8mSUOXZZDcXsagSuADig
	w4sF+pH9290umdpBrlVbqhpuATXaOHkwLqgcs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=tKrHZ33OgDKOjPL7h3XNF2a+F8zt9AiJZc63hD6BwbsZ/6Lz5KwNxRrGn/XMqEMniX
	q0rkhRMMgq9/8F2CJwuwulHJStseB1Ya05xWsDLH85KlQ2030hzOBsb1FjRJgHyQ0GRz
	DLA5ZkPEEOpnMmwVHE+1o3lAkkTfvt417LL08=
Received: by 10.100.140.15 with SMTP id n15mr5335240and.83.1241830219558;
	Fri, 08 May 2009 17:50:19 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 8sm1616602ywg.13.2009.05.08.17.50.17
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 08 May 2009 17:50:18 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id AB94B610197; Fri,  8 May 2009 21:50:52 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 May 2009 21:50:22 -0300
Message-Id: <1241830239-5594-7-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.6.3.rc1.51.gea0b7
In-Reply-To: <1241830239-5594-6-git-send-email-otavio@ossystems.com.br>
References: <1241830239-5594-1-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-2-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-3-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-4-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-5-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-6-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 06/23] checksums.ini: add flash-plugin
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
X-List-Received-Date: Sat, 09 May 2009 00:56:34 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 conf/checksums.ini |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/conf/checksums.ini b/conf/checksums.ini
index d314262..c606769 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -6066,6 +6066,10 @@ sha256=ce4f7d11b3c04a7368c916ca4abc284dd0c0256f461dfb7f07df1ab445e7a5c0
 md5=8845d4536fcd3a329690c93bce9bbf8e
 sha256=c7345faf10b269b3556f2e1373c4afc35f08891f8bbd54e45d49151a8c8e4ac0
 
+[http://fpdownload.macromedia.com/get/flashplayer/current//flash-plugin-10.0.22.87-release.i386.rpm]
+md5=a3bb1f9a8e2b1238ffaf89193e60be02
+sha256=ec5ace49df7cfe69b7c02c8d1b6df8089f32076a390b931051feed2a9762d554
+
 [http://downloads.sourceforge.net/flex/flex-2.5.31.tar.bz2]
 md5=363dcc4afc917dc51306eb9d3de0152f
 sha256=701353279a17655d78e3b3678ad78d0375f5bf45877ad8b3507d589c42427f26
-- 
1.6.3.rc1.51.gea0b7



