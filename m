Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 4FA9E65CD0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 20:27:20 +0000 (UTC)
Received: by wgin8 with SMTP id n8so128667959wgi.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 13:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=8JGTB1CspPSgD33dGNL/1w81hZQDimiZNgGP07JC9Oc=;
	b=SwJ/1SvIy7mQiYwhgS1HVMaUW19zxI7QDZDXkGMO6zjl079WJHt3srUPbhZX+yr821
	Do/uhkZOTDR2+WwTbt5uMYD7gKaubEa8Wjk+6+DFvDELtgao5DsLg+cpzdsB4UXQP86m
	3dLk3sKtZOJ8OJs4KBASWZhXxGGzMRgFf24qNMFtnCh8LohHaTEDo8M+6HwjN9cweLpT
	1oUjHo0H12gu4Rn2pCPdzi1IOKSFeyxVSNh2+LrMuABxm7qLpRX66P+59bP7XZbX1PCz
	iPrtkLrx6c3ME2u7is04O/DCScBa7TC2EidHKpnqq/7xb7h9ZPwwvsVBdEYzF4NbVnWe
	WPCw==
X-Received: by 10.180.73.198 with SMTP id n6mr24102298wiv.3.1430166441340;
	Mon, 27 Apr 2015 13:27:21 -0700 (PDT)
Received: from ubuntu.ebenfeld.local (ip-84-119-99-153.unity-media.net.
	[84.119.99.153])
	by mx.google.com with ESMTPSA id dg8sm30896797wjc.9.2015.04.27.13.27.20
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 27 Apr 2015 13:27:20 -0700 (PDT)
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Apr 2015 22:27:09 +0200
Message-Id: <1430166429-20768-1-git-send-email-sven.ebenfeld@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1430165584-5634-1-git-send-email-sven.ebenfeld@gmail.com>
References: <1430165584-5634-1-git-send-email-sven.ebenfeld@gmail.com>
Subject: [meta-java][PATCH v3 10/10] README: Update PREFERRED_VERSION to new OpenJDK-7 version 75b13-2.5.4
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
X-List-Received-Date: Mon, 27 Apr 2015 20:27:25 -0000

Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
---
 README | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/README b/README
index 70af588..83cb52d 100644
--- a/README
+++ b/README
@@ -68,7 +68,7 @@ PREFERRED_VERSION_openjdk-6-jre = "6b32-1.13.4"
 PREFERRED_VERSION_icedtea6-native = "1.8.11"
 
 #For openjdk7:
-PREFERRED_VERSION_openjdk-7-jre = "25b30-2.3.12"
+PREFERRED_VERSION_openjdk-7-jre = "75b13-2.5.4"
 PREFERRED_VERSION_icedtea7-native = "2.1.3"
 
 #Sometimes the following is needed:
-- 
1.9.1


