Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id A48C2789D4
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Mar 2018 06:20:20 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id v90so14566187qte.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Mar 2018 22:20:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KlXVFpKj+lusKE89kHziunf5rFgetnoEEc/0PoCBMAw=;
	b=SvincP57JH8UxSP2PsjqzhaJK61lmz94KgD3SK07gPH417GCmh8Y83Ikl7/1LwtttC
	gI5TK+YP+sFt8FALpSNjX3foezLYmvyo2h0TvJ4i9b9tMc12nweLvZUh4A4iWs3ZP3MQ
	R7rko1wfzNxXBdvbUHSOR4glIlUN/3XHhzRqD2FXRx0F7hGBK4gxZqzyONAq5mJtW0DC
	6MjRN8O16Fr/I7ysLE0NJezWXJNBFQGDQSNT8MKWVy5MLuegJAL62JadYwCKfqAptxiq
	7huncV/5uebkT0FsRRkzEL/MEKMc6UNjmYz/bacc3jiDJMPKooa16Z13bq1EWXgIQp+8
	YraA==
X-Gm-Message-State: AElRT7Ft1OMSGfO65BD8rp9pIFaVnpbC9k2VEzgSP9BqkeXNomNQvFUx
	VSUubbe4srcUgf4EesfsPbgqJWzn
X-Google-Smtp-Source: AG47ELtAJxEmQPXmu+Lm//2Zq9FrGcA5Hu0E7UiM5v5npRuYAD1jGNG9ng8murCGUX7EZv7dCafChw==
X-Received: by 10.237.42.34 with SMTP id c31mr12171240qtd.199.1520058021086;
	Fri, 02 Mar 2018 22:20:21 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id n4sm5134899qtc.0.2018.03.02.22.20.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 02 Mar 2018 22:20:20 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  3 Mar 2018 01:13:40 -0500
Message-Id: <1520057620-12155-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] Remove Derek Straka as maintainer for meta-python
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 03 Mar 2018 06:20:20 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/README | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/README b/meta-python/README
index 905d5ee..f62ab8f 100644
--- a/meta-python/README
+++ b/meta-python/README
@@ -50,5 +50,4 @@ Maintenance
 Maintainers:
         Tim "moto-timo" Orling <TicoTimo@gmail.com>
         Paul "bluelightning" Eggleton <paul.eggleton@linux.intel.com>
-        Derek Straka <derek@asterius.io>
 
-- 
2.7.4


