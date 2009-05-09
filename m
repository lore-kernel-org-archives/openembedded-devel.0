Received: from [209.85.132.244] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M2arj-0000U1-LP
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 May 2009 02:56:35 +0200
Received: by an-out-0708.google.com with SMTP id b6so1008350ana.42
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 May 2009 17:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=TAB42SFZnMWa9XEG5E9ips28lKxF3WEeHyHLHjwzWNY=;
	b=C/3DUHqvmbuv28vFT8nD8C6PtwdCskFO21m+jM+F0aJWWyZOoAe6CF2QmGreyGVBsW
	tutLu8NURFNFCIQyWLmdNu/cYegrTjn9NyAu+DM3qYSO52QPBptejuf/Q9PhAjgMG+XC
	5syy6NfRzFoSMbi1OeyJnizpHn48vf0Fmne8M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=DiiXDdAMDsy9IKpdYA5fIAw2nfW9M3kOoTTMPUqhyxIqAF+oZL4JMWbWbSdeHrn545
	YAFpR7IwPGU14EswSjFVyXMa0jqXAmbOGjOg9v0Vitos3Tpg0Wx0TVl028HBimtOW9p4
	qRVTpqxwp6j5MSJcVUSy3a/J0dopjHee3+9P0=
Received: by 10.100.128.18 with SMTP id a18mr7401529and.12.1241830220577;
	Fri, 08 May 2009 17:50:20 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 5sm1644292ywd.45.2009.05.08.17.50.18
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 08 May 2009 17:50:20 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id F3A516101A0; Fri,  8 May 2009 21:50:52 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 May 2009 21:50:28 -0300
Message-Id: <1241830239-5594-13-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.6.3.rc1.51.gea0b7
In-Reply-To: <1241830239-5594-12-git-send-email-otavio@ossystems.com.br>
References: <1241830239-5594-1-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-2-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-3-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-4-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-5-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-6-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-7-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-8-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-9-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-10-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-11-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-12-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 12/23] conf/licenses.conf: add CUPS license
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
X-List-Received-Date: Sat, 09 May 2009 00:56:36 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 conf/licenses.conf |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/conf/licenses.conf b/conf/licenses.conf
index 01c4747..c067627 100644
--- a/conf/licenses.conf
+++ b/conf/licenses.conf
@@ -1,6 +1,5 @@
 SRC_DISTRIBUTE_LICENSES += "GPL GPLv2 GPLv3 LGPL LGPLv2.1 LGPLv3"
-SRC_DISTRIBUTE_LICENSES += "BSD Apache-2.0 QPL AFL"
+SRC_DISTRIBUTE_LICENSES += "BSD Apache-2.0 QPL AFL CUPS"
 SRC_DISTRIBUTE_LICENSES += "MIT Sleepycat Classpath Perl PSF PD Artistic"
 SRC_DISTRIBUTE_LICENSES += "bzip2 zlib ntp cron libpng netperf openssl"
 SRC_DISTRIBUTE_LICENSES += "Info-ZIP tcp-wrappers"
-
-- 
1.6.3.rc1.51.gea0b7



