Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 0A3466FF64
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Dec 2015 23:00:39 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id o64so95402181pfb.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Dec 2015 15:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7qlecsZ9ZSvv5GGcETIGfJsitLCJuXyHy8b3gwVFrfw=;
	b=FvnMR9yELN0ReOVM38LQD5xWvR9ybkZJouDU/hC94lcHFkJxxhsd8Ko6I3ilj/u5wl
	X3aXl782JZKMHlBAgNQEN/1MvX1l4lxGw64/a9MgctAXsD4VcIr3pWPWB1D7sU1n1Rlu
	Ev2fOyDEajY5aTtbR1nd/o+KRi+zfgf0pOPhPvyGMorHj2rEROx4ZoVMB29mpGqNvM7S
	9scxRrm2TcQ56MsW9XIcvl45knRYxHa54yJmaHP59Df5bKsWnm8VLh/FarYwvSYqnDoW
	moAWuGruGqCbBmzmiz+jB62DmNhV1aP5tM4RcPEJsZSKtzpcoQiZWbUEyXm1jZlDst50
	4vuQ==
X-Received: by 10.98.8.157 with SMTP id 29mr10459913pfi.128.1450738840097;
	Mon, 21 Dec 2015 15:00:40 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	g10sm36819317pfj.15.2015.12.21.15.00.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 21 Dec 2015 15:00:39 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Dec 2015 15:00:30 -0800
Message-Id: <1450738830-30719-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1450738830-30719-1-git-send-email-armccurdy@gmail.com>
References: <1450738830-30719-1-git-send-email-armccurdy@gmail.com>
Subject: [meta-oe][PATCH 2/2] OML: move license file from meta-oe to meta-webserver
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
X-List-Received-Date: Mon, 21 Dec 2015 23:00:40 -0000

The OML license is specific to fastcgi, which is in meta-webserver,
not meta-oe.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 {meta-oe => meta-webserver}/licenses/OML | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename {meta-oe => meta-webserver}/licenses/OML (100%)

diff --git a/meta-oe/licenses/OML b/meta-webserver/licenses/OML
similarity index 100%
rename from meta-oe/licenses/OML
rename to meta-webserver/licenses/OML
-- 
1.9.1


