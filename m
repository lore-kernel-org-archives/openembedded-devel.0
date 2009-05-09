Received: from [74.125.46.154] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M2arf-0000U8-Lr
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 May 2009 02:56:31 +0200
Received: by yw-out-1718.google.com with SMTP id 9so1075458ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 May 2009 17:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=uyl/536erv25jgWZFSBMlPGt7lDfV50ghKOvAdOVgmc=;
	b=s05FxLaCGpthsR/rwcvr0MJxjrN9khNXnbF/PbeQdN+SriSwm0/X5AprDWlgncGC/d
	mzZH72myvo2sBdSpw6mt0T0jR1vVEiPb8XxzRxYrMdE6BVOgEnSdI8/OiUBIZNZbVreC
	hFkAATK3Nmn529v9SAR4m1J/RAQXN+c5owZKc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=b6RJsHZ6X0ByUCPREpqPb3iExEe/wYlnymvT4flEm1DzJZ0Ic5/j6ZCJj0+pK6t/lF
	9/dqT4oEt4R1GyFMMYxsWzDWqqxOIzQzn9/iAon7RulmwE9atY4uj8/qBs/9HofHBv14
	cbEBhKv41h1RkQy1zwmeWTeNkyukX7kF6m6d0=
Received: by 10.100.46.10 with SMTP id t10mr10020520ant.116.1241830216566;
	Fri, 08 May 2009 17:50:16 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 5sm404563ywl.49.2009.05.08.17.50.15
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 08 May 2009 17:50:16 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id B719B61019C; Fri,  8 May 2009 21:50:52 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 May 2009 21:50:23 -0300
Message-Id: <1241830239-5594-8-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.6.3.rc1.51.gea0b7
In-Reply-To: <1241830239-5594-7-git-send-email-otavio@ossystems.com.br>
References: <1241830239-5594-1-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-2-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-3-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-4-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-5-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-6-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-7-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 07/23] checksums.ini: add sun-jdk
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
X-List-Received-Date: Sat, 09 May 2009 00:56:31 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 conf/checksums.ini |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/conf/checksums.ini b/conf/checksums.ini
index c606769..cc060fb 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -11226,6 +11226,10 @@ sha256=f24ae604a20da87e3716bb1d441c483e56479eaef4e99888f41be06059790bca
 md5=4e979c0dda766ba1dd719905ca975c7b
 sha256=202de62e2f3d0667cc464720d5897d0ccb29767ec24e0a4d4c5bd6c4d37425a4
 
+[http://download.java.net/dlj/binaries/jdk-6u10-dlj-linux-i586.bin]
+md5=b70924c697584ab7955050d7a9b4de57
+sha256=dae79e8c56090ac3fb4ac3fe0df9faf6a0c9694a89ef978dce0ab970557ad264
+
 [http://www.jdom.org/dist/binary/jdom-1.1.tar.gz]
 md5=22745cbaaddb12884ed8ee09083d8fe2
 sha256=a13549087141be24ad176b659afdc2c675f1ffa5288ff999a193d6d44a282056
-- 
1.6.3.rc1.51.gea0b7



