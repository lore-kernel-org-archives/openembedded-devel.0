Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SeicZ-0004y2-Bq
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jun 2012 10:08:07 +0200
Received: by bkcjm2 with SMTP id jm2so195710bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jun 2012 00:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=STSegc0CA4ehj/zcF0n0l3fbWv1ClgimPZ7ReU6Mpmk=;
	b=hEJeJTouVJo3WmtGCNh5i+eDg+g4z8Bh4MMW5yG024Zj5v+XExovp8OZpqjF/pQ7WF
	KwD+yR16hJkR7/7YtppEOClLhur3+Ww5J7z/YpAbkd5IcP3ykibSAzL4dSquzEPXOBIx
	eIKyMeOYmcvNS5WiDzzUp40L1iOJsKIOXjOqfLToF6pyIn2r8hrbvdqfDZw6cwZtWyC5
	7K1i8Ns0JIzpEENBjriAvBVMq2QI7bojqWksakgfi0fSt6vYtSX63Ix1gBAQ7WODMqfR
	cyDXAIlYArTiYlJ0NNMQGZlVfvihhgNwghfRPCTyKwlE3haHSe4WnKmxNg37MpZStDCx
	4d5g==
Received: by 10.205.134.6 with SMTP id ia6mr13297310bkc.51.1339574251680;
	Wed, 13 Jun 2012 00:57:31 -0700 (PDT)
Received: from localhost.localdomain (ip-178-202-232-153.unitymediagroup.de.
	[178.202.232.153])
	by mx.google.com with ESMTPS id gw6sm1683361bkc.16.2012.06.13.00.57.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 13 Jun 2012 00:57:30 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Jun 2012 09:57:14 +0200
Message-Id: <1339574234-9277-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [PATCH] meta-xfce/README: remove maintainer
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
X-List-Received-Date: Wed, 13 Jun 2012 08:08:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/README |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/meta-xfce/README b/meta-xfce/README
index fa2bab0..52b6519 100644
--- a/meta-xfce/README
+++ b/meta-xfce/README
@@ -11,5 +11,3 @@ revision: HEAD
 Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-xfce]' in the subject'
 
 When sending single patches, please using something like 'git send-email -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-xfce][PATCH'
-
-Interim layer maintainer: Andreas Müller <schnitzeltony@googlemail.com>
-- 
1.7.6.5



