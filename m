Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id C602C78473
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Nov 2017 17:38:31 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id a142so17218240qkb.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Nov 2017 09:38:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WgUBP73ukC2IHOnpurjCgrbsZkyI8SELZIfsRzXoEto=;
	b=s0HemrOpxR3hKbzrevNvBIdMqhaC+qoa/nzFRK04BOOcwXa0ymFcG1eUn9kF0PhHHI
	f3glOEYfyADyZ8WNlHdtB4X1M4I5bQu5V3ryDKiUD4cV+Ayp+Hqr8e2xv4VmLjDXS5x3
	7qSrF/T3K0o9Pfpj9ry6plYgcECtcQfS9AUetLZ9WJ5iQikEzQYz9OmU7EshOcfW++/M
	pzwF9TiOeWjOESoZnOr0fAgl5pZR8S2E/72hMp5BrVYgH60jUbRzklALctSyMHcGRBbD
	YVoBslXLkB+FK0pLPKZkJctdvOQPI6OjVqqZLeZZuhWBbdF0FZJ8OnOKJ7xsGw2SAyYU
	UY7w==
X-Gm-Message-State: AJaThX5OuzCKw1qS8v4ORMdFa21wdR+a1FixdQIhsRyq7rR3spnxH3LV
	FySh90Cp0INA+Cax2pqIICNffd8b
X-Google-Smtp-Source: AGs4zMab1Fwfz55Gqp0hqe6LN6BnNcXv3v/mneKGORk2VFlCECQgiTrfEXZhLIwSymyCcZZM41o+Pw==
X-Received: by 10.55.127.66 with SMTP id a63mr9912210qkd.90.1510508312422;
	Sun, 12 Nov 2017 09:38:32 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	g12sm9314713qtj.13.2017.11.12.09.38.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 12 Nov 2017 09:38:31 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 12 Nov 2017 12:38:20 -0500
Message-Id: <1510508300-8852-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-cmd2: update to version 0.7.8
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
X-List-Received-Date: Sun, 12 Nov 2017 17:38:32 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-cmd2_0.7.7.bb => python-cmd2_0.7.8.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cmd2_0.7.7.bb => python-cmd2_0.7.8.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python-cmd2_0.7.7.bb b/meta-python/recipes-devtools/python/python-cmd2_0.7.8.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python-cmd2_0.7.7.bb
rename to meta-python/recipes-devtools/python/python-cmd2_0.7.8.bb
index fa1ef5f..82393db 100644
--- a/meta-python/recipes-devtools/python/python-cmd2_0.7.7.bb
+++ b/meta-python/recipes-devtools/python/python-cmd2_0.7.8.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "http://packages.python.org/cmd2/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://setup.py;beginline=49;endline=49;md5=0f13c9cfc75288223cf7edd2f3b985a2"
 
-SRC_URI[md5sum] = "576b78add6d652b48dcf9362cece88ef"
-SRC_URI[sha256sum] = "b4e2fb9fc656adccc4d01dfd55ab5a9b05890e961950543f692e7885725c2d72"
+SRC_URI[md5sum] = "afa5c55fd94bb4a38a01232a511585eb"
+SRC_URI[sha256sum] = "e132db7d1f5a2faf2310606ee4b2e49c7b4e1e5ed533f1e4ca9474c51475eb0f"
 
 inherit pypi setuptools
 
-- 
2.7.4


