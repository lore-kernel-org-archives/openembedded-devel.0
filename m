Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 33422782A5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jul 2017 18:30:03 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id d136so10670456qkg.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jul 2017 11:30:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=nUwMjmRyQujmFBnwZbIo8f011HfMTJaU84kOaUKxRIE=;
	b=ZFe5SZsIQd1/UB2Zy6cZYhJxzEL1Jf5+TwZDDp04diQd3EGOVVbzKj9xSt9lk6czjB
	D6mx4INl19107Q0XMA25NUAmst+e1nj9IPG9Xum3Mxqn9vFFkf1V+QUgwUYIBF+zZzdz
	q6+dtjEYXKuGd3eICdHKSLK1iyzH1TlhJlmLmm8Qsz6XfokSH1lGkj9T5+vYplCoD4aG
	zoMbz47q3pzrTsZWfvUGIzZZcJHQutWNR7nVi+6RHslMBVk1y8AT3+D43d6Clu2w40tp
	bSKt16fiFb3HwVnqYrb3HF/+KbZiSUPdN6avTGQpevMZBIAkBMk7XAEkGCz3yIbfZ3UC
	MIPw==
X-Gm-Message-State: AIVw111JmltEaTcF+ctLN9hYp6cJlsRKDUjJPW1N2qaTzptyH+S06ayI
	tbXaaB58NrjFAhPwX1U=
X-Received: by 10.55.79.209 with SMTP id d200mr21963937qkb.336.1500921004980; 
	Mon, 24 Jul 2017 11:30:04 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.81.71])
	by smtp.gmail.com with ESMTPSA id h7sm8331499qkd.63.2017.07.24.11.30.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Jul 2017 11:30:04 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Jul 2017 14:29:59 -0400
Message-Id: <1500920999-15144-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-serpent: update to version 1.23
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
X-List-Received-Date: Mon, 24 Jul 2017 18:30:04 -0000

Update license checksum and verify terms are unchanged

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-serpent_1.22.bb => python-serpent_1.23.bb}             | 0
 .../python/{python3-serpent_1.22.bb => python3-serpent_1.23.bb}           | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-python/recipes-devtools/python/{python-serpent_1.22.bb => python-serpent_1.23.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-serpent_1.22.bb => python3-serpent_1.23.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-serpent_1.22.bb b/meta-python/recipes-devtools/python/python-serpent_1.23.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-serpent_1.22.bb
rename to meta-python/recipes-devtools/python/python-serpent_1.23.bb
diff --git a/meta-python/recipes-devtools/python/python3-serpent_1.22.bb b/meta-python/recipes-devtools/python/python3-serpent_1.23.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-serpent_1.22.bb
rename to meta-python/recipes-devtools/python/python3-serpent_1.23.bb
-- 
2.7.4


