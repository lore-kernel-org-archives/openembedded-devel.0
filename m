Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id D45606AC24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Apr 2015 07:27:58 +0000 (UTC)
Received: by wizk4 with SMTP id k4so60915559wiz.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Apr 2015 00:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=02sAgfjROrbvj8ThLReW4jaokr7y6yeCaRMznBaNM9M=;
	b=T3Ql19pVQ+IeruioEDPI2joAYMrF4dalulK/ntKdT33MmFupj5gQ0teY8ZaWbwnll6
	qG3mLqbceYD2lyp1sQsczDtinMQ96/fOHKYF90LU2rdJ7HURqYXq130cH16L9inn9hK3
	oKKdN9z/Dt/yLF/x8TcAzPak5CRZE1Q0LfK2oueWVZxGhzrDwjGVvGU9kYOtq/JoeWjl
	cQfTj3PmjwdF37T0TuTSIJM+LYiAzcmazO9yjKSTxGZ5MZFnz7HcvHGiM2xn91iL7SSC
	e7ZfqVjZ6nINl9HZtDsD08pnQG458Thsr8Dkw47d8WCOPyR8agZ9eN4Q7GU5PzdYD+kr
	ufog==
X-Received: by 10.180.102.165 with SMTP id fp5mr18488207wib.80.1428910079491; 
	Mon, 13 Apr 2015 00:27:59 -0700 (PDT)
Received: from localhost.localdomain (pD9F9B569.dip0.t-ipconnect.de.
	[217.249.181.105]) by mx.google.com with ESMTPSA id
	i10sm10139643wja.40.2015.04.13.00.27.58
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 Apr 2015 00:27:58 -0700 (PDT)
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Apr 2015 09:27:37 +0200
Message-Id: <1428910057-23647-8-git-send-email-sven.ebenfeld@gmail.com>
X-Mailer: git-send-email 1.8.1.rc3
In-Reply-To: <1428910057-23647-7-git-send-email-sven.ebenfeld@gmail.com>
References: <1428910057-23647-1-git-send-email-sven.ebenfeld@gmail.com>
	<1428910057-23647-2-git-send-email-sven.ebenfeld@gmail.com>
	<1428910057-23647-3-git-send-email-sven.ebenfeld@gmail.com>
	<1428910057-23647-4-git-send-email-sven.ebenfeld@gmail.com>
	<1428910057-23647-5-git-send-email-sven.ebenfeld@gmail.com>
	<1428910057-23647-6-git-send-email-sven.ebenfeld@gmail.com>
	<1428910057-23647-7-git-send-email-sven.ebenfeld@gmail.com>
Subject: [meta-java][PATCH v2 7/7] Update README to new OpenJDK-7
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 Apr 2015 07:27:59 -0000

Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
---
 README | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/README b/README
index 70af588..6517d3f 100644
--- a/README
+++ b/README
@@ -68,7 +68,7 @@ PREFERRED_VERSION_openjdk-6-jre = "6b32-1.13.4"
 PREFERRED_VERSION_icedtea6-native = "1.8.11"
 
 #For openjdk7:
-PREFERRED_VERSION_openjdk-7-jre = "25b30-2.3.12"
+PREFERRED_VERSION_openjdk-7-jre = "75b30-2.5.4"
 PREFERRED_VERSION_icedtea7-native = "2.1.3"
 
 #Sometimes the following is needed:
-- 
1.8.1.rc3


