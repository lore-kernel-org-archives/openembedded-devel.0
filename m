Return-Path: <mario.goulart@gmail.com>
Received: from mail-qc0-f176.google.com (mail-qc0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id 362E07391D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Mar 2015 13:23:08 +0000 (UTC)
Received: by qcfy6 with SMTP id y6so12956086qcf.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Mar 2015 06:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=/r/k92rxC/7htyHQZjMuefLDAB54Dv8p8cAga4Hqioc=;
	b=xJW7OZWKdIl6ZmOm+/qa5wxflSAlwQMYv3FoSXjoRumpGhWpom3KfAcBGdsECL2FnU
	1psimm5vr6P3dVORxW1K9rkJeEyMJe5hi89b7zvQVsgdQcSdlm8CJNjf3+lFEzC0g2Pv
	dggdOoTfyLfvA2fkqPL3oG1QuolR2wmdq1uLgaNJZI/OzHf7CkYYZY7iu3Qyzl+gAcnq
	Nufum7CJ1EHD3F/Dw7SDNiTvwxQuDRUyAMlzQsNcI6YzbD8kvqEL11G6t5YvMC3ONOt8
	msiR8l/VSNGOZJIpTF19kA3mcX5TXLKkJXImdkOmIybd2lRzj0M40T6u+XPkFGjn/MW3
	HjcA==
X-Received: by 10.55.54.73 with SMTP id d70mr21564820qka.22.1427808190059;
	Tue, 31 Mar 2015 06:23:10 -0700 (PDT)
Received: from centrium.lab.ossystems.com.br ([177.100.224.72])
	by mx.google.com with ESMTPSA id q129sm9859631qha.4.2015.03.31.06.23.08
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 31 Mar 2015 06:23:09 -0700 (PDT)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Mar 2015 10:22:35 -0300
Message-Id: <1427808158-16502-2-git-send-email-mario@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1427808158-16502-1-git-send-email-mario@ossystems.com.br>
References: <1427808158-16502-1-git-send-email-mario@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: [meta-java][PATCH 2/5] README: typo fix (s/lease/least/)
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
X-List-Received-Date: Tue, 31 Mar 2015 13:23:11 -0000

Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
---
 README | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/README b/README
index f530702..c5bba6c 100644
--- a/README
+++ b/README
@@ -52,7 +52,7 @@ Main layer maintainers:
 Usage instructions
 ------------------
 
-You should define at lease the following variables in a distro include file or local.conf
+You should define at least the following variables in a distro include file or local.conf
 
 PREFERRED_PROVIDER_virtual/java-initial = "cacao-initial"
 
-- 
2.1.4


