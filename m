Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 008CD7ECAA
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 19:14:18 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id n190so18249233pgn.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 12:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JOrrC0imT1R2UudpHmSfKmjuqbpVsZTfS4bY5wTwv0Y=;
	b=rDOGM5zKdGI+1G2AjthP6f55Qen+Tw488Z6M0T5iJxAjGQqpEB+23TO+QreHD1luWa
	/nLn5KX1nKdu6LB+JNTwpjUD0lVS5lv+2mMIyxu9cCJqEP4kR93ql0h8IHnbE0cqiCic
	ZWr4lA9iyxJHa2L6bCwMGWoZ/SUcNRPa5Azp9Jgz0KSazMGNAGn1Zlb6P69P49k+BJ/f
	/SNM4EFFGcdVzh3B7nuKCqREK54sVtKiO6pN5IpHa5M8JJSyg4XmBj6G8p0inoCRcMLt
	0cwwh/N8uFtxB0NnHZn9B23E7/10knMpNXPSImxsF5sFOUH6BPbx5GeNpwJc4Sej9tTm
	WM7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JOrrC0imT1R2UudpHmSfKmjuqbpVsZTfS4bY5wTwv0Y=;
	b=d17dg5n2BG/+uVeIOo/mi0ZLp5kBNR2mKh0a4nrqTU6A8HAI+MMpG3yeGzgOaCKRQc
	3KJAfo3VWD3Mt2GxmLFN1cN/iJmB2zz+BsNp5SVkRlQthGA/9Fnl71KwKpkoMXuFmJkU
	VVxztEAc9UxkDhivEvHqfSnaQV+Dd+290SgiQTB4wlHQfTkOR0WGgnIEsqfI3HXp68P/
	8tM87Em1wOZbgQi52PnTxXVW7L/Jo59f5H9CerupqtSP9AOK0+5WJbwfVlBRGBeaDexe
	5DxyAbBqA/6tP5a2sz5zJH87fIQszP9JiMQXjZto3H+Qb8WwxIkmiasyyFgIJPtWIRVt
	tplw==
X-Gm-Message-State: APjAAAXn8tpn5xjSuRKbCjqGxO5yyZ4Jaa4CvcbuQwSCij63+dcsKouo
	Zd4I5vmiwVsC1xx6lmV/PKQCQKVEnBc=
X-Google-Smtp-Source: APXvYqzVY/OOr1x4fiqx/xTN4Kb6F1gOmUqI9t2bxqIf2BlwThhMo8ZcusY+dU3kchbiN3jhshhDMA==
X-Received: by 2002:a63:1045:: with SMTP id 5mr52781797pgq.165.1568574859481; 
	Sun, 15 Sep 2019 12:14:19 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	b11sm5950138pgr.20.2019.09.15.12.14.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Sep 2019 12:14:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 Sep 2019 12:13:57 -0700
Message-Id: <20190915191357.1898293-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] remove spurious file
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
X-List-Received-Date: Sun, 15 Sep 2019 19:14:19 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 file | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 delete mode 100644 file

diff --git a/file b/file
deleted file mode 100644
index e69de29bb2..0000000000
-- 
2.23.0


