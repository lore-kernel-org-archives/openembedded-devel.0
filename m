Return-Path: <paul.betafive@gmail.com>
Received: from mail-we0-f169.google.com (mail-we0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id A251A6023E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2013 23:36:28 +0000 (UTC)
Received: by mail-we0-f169.google.com with SMTP id n57so3983240wev.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2013 16:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=S9qzQ8BH/p9g2BaQlFphk1OT/wmbQx5t4Dbbfv5zn5E=;
	b=yTJHEgcbqtdX1spN4ceYRz5WhyvWs4mAwEOc4g121eTEx9H8P5jiYd1qJdre2DXJbq
	GcRN6gGsY+k7u4EcO8idKtSjVW3n58bvlw16g9dnST8NSmoacOO+fmRyzeve2Fq8BtsT
	y8eKvhUv5n9h2/BPJHFasNaOz1Vv9OaMUfQZcjdDkcgGvXFlOopxkXjIb6IdnCag05v/
	ehWIPpAAUnLu9176WYsi0PIv9Gp7F7WtN41qchor5LMs6d80p+IsbBpXpETf9q589LzM
	s0H4/ZFcZJOpJhRmHnaMNSWWcpMEsgG5UjX1VC2rmfiMz9N7dfkFKvF5s9LJCtazeczB
	HPvQ==
X-Received: by 10.194.78.110 with SMTP id a14mr53569wjx.84.1371598588974;
	Tue, 18 Jun 2013 16:36:28 -0700 (PDT)
Received: from vesta.betafive.co.uk (94-192-12-83.zone6.bethere.co.uk.
	[94.192.12.83])
	by mx.google.com with ESMTPSA id fo10sm5434483wib.8.2013.06.18.16.36.27
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 18 Jun 2013 16:36:28 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Jun 2013 00:36:09 +0100
Message-Id: <1371598570-16322-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.8.3.1
Subject: [meta-networking][PATCH] ipsec-tools: update Upstream-Status for patch
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
X-List-Received-Date: Tue, 18 Jun 2013 23:36:29 -0000

I've not seen anyone else send in a patch just to change Upstream-Status so this
may be unnecessary churn. Let me know if it is.

Paul Barker (1):
  ipsec-tools: update Upstream-Status for patch

 .../ipsec-tools/ipsec-tools/0001-Fix-warning-with-gcc-4.8.patch        | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
1.8.3.1


