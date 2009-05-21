Received: from [209.85.128.184] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M6yJN-0005cd-CE
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 May 2009 04:47:13 +0200
Received: by fk-out-0910.google.com with SMTP id z22so354587fkz.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 May 2009 19:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=XhZoA1kHzAbb4Kqjbr2LIZGemDEZa6XEkJYnbq7VPaQ=;
	b=k2OQCZKHHIo626saI6JPvvXCVm7oWjBG9tqZ/29KvSeh70WDskEt+JNdSNfloucp7K
	GZe3FfphJvmkhxFGV6pIG13nMKTxh8eIU9a6v4WleOARGbK4ypQPyH0JPQEMY1YYzHMw
	mr8oDFB7NTJPnCHooiRISibiUiKFpkjUsJZOA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=h/ygEbmw2Fcx/PZMhXNy3JfJdDF8IJeOyKNfq7jtKTR8L8eQOUUwpGQhngcp08pzdJ
	7qaUHXrrF4TqB89qHkx3T9TFoW8DtGMPq7uCnnAEPL6BUv5uKPa0vKMXLy5d7HFHi0Of
	fTuua6DaUJRDQOLYwJOrzFMq+Q97wB8mV9NVM=
Received: by 10.103.49.12 with SMTP id b12mr1075601muk.51.1242873580373;
	Wed, 20 May 2009 19:39:40 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id s10sm4591515mue.38.2009.05.20.19.39.38
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 20 May 2009 19:39:39 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 5E1ED6103AF; Wed, 20 May 2009 23:39:42 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 May 2009 23:39:22 -0300
Message-Id: <1242873578-17444-8-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.6.3.1.54.g99dd
In-Reply-To: <1242873578-17444-7-git-send-email-otavio@ossystems.com.br>
References: <1242873578-17444-1-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-2-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-3-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-4-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-5-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-6-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-7-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 07/23] checksums.ini: firefox-l10n-pt-br
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
X-List-Received-Date: Thu, 21 May 2009 02:47:15 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 conf/checksums.ini |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/conf/checksums.ini b/conf/checksums.ini
index f11436e..7fe3566 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -19358,6 +19358,10 @@ sha256=6bca237485a352362133792e000a3c8e367a26b0312c5c607db7c2a97717d15f
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
1.6.3.1.54.g99dd



