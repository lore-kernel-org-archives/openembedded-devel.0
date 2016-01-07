Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id AC66E60761
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jan 2016 16:35:22 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id 77so226713470ioc.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jan 2016 08:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=yyMb20gcj09PbzX636riSwQlb+tbXSrKPbivmTPJCjU=;
	b=Ajb9qLEh0lrxsYc0+6PYEu5/rIN6W4Yx8efc8pmSL35k8EyEvCAp61zdMlMIYnP9ax
	uVHTiH+EPu9aX87moxH+Kj9qsJIBjn8SJ11eEdOybvXl95z9vUhVPR+W5whmNtATsH5h
	HnC3xV92Q6SDK4WWPk1wUTwaeKotlVO5XfNhDWbvnV02lQX5XOVT3+fdvCM9rvLqzPCw
	SODHwGbjbDY203xORCez7DEvCLo33Sth2OBxKtZj32HXeR+qBxtVUOzNoOV6C4VbXXmV
	Y3rni5uRHym3dQNwAS+aLJQeiBVVCptYnj1IwwFcUuSQMHsfRbq2wCiCR91nf+ZyaxAf
	Qphw==
X-Received: by 10.107.30.15 with SMTP id e15mr59212190ioe.166.1452184523053;
	Thu, 07 Jan 2016 08:35:23 -0800 (PST)
Received: from openSUSE-i7.site (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	q5sm5108573igh.6.2016.01.07.08.35.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 07 Jan 2016 08:35:22 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Jan 2016 11:34:53 -0500
Message-Id: <1452184494-23049-1-git-send-email-twoerner@gmail.com>
X-Mailer: git-send-email 2.7.0.rc3
Subject: [meta-oe][PATCH v3] nodejs: update from 4.2.3 to 4.2.4
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
X-List-Received-Date: Thu, 07 Jan 2016 16:35:22 -0000

changes from v2:
	- modify LICENSE diff in commit mesage such that it doesn't get
	  mangled when sent to the list
	- add "v3" to subject line

changes from v1:
	- add LICENSE diff to commit message

Trevor Woerner (1):
  nodejs: update from 4.2.3 to 4.2.4

 .../recipes-devtools/nodejs/{nodejs_4.2.3.bb => nodejs_4.2.4.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_4.2.3.bb => nodejs_4.2.4.bb} (93%)

-- 
2.7.0.rc3


