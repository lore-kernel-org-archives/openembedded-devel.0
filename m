Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id E5D5C60897
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2013 18:16:01 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id lj1so978148pab.32
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2013 11:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:message-id:date
	:to:mime-version:x-mailer;
	bh=2eUBfZPEiq4lblVeBzVQ1k0bWy/dqg54j4AEydWDmIk=;
	b=RaJzFuDolIkcVd1mMeyoGlnGWez/EuYshxgwtrhcyl6R9ixLBb7Ua+KXRLA8xyI4kb
	y7jbQzhNVMO8DX/2y3xixFaMMT6qjEQn1tp8iQrOKsYhRZHGZ92N78GHcGIZWD6OHqMl
	BeFvxlSg6v2iZasIQvTmfC3SRgWW2EkhMIZL3eHKFk04kgT1tg5t3uFSi++cxjUDxgTo
	B526HS5Jn2r2wmDGWXJWCR5p1QvVPkVM3R/0CCZOrsfAlnTWXv9hLmY/tGNBcaLeQ3oY
	usQOEjrBXYwwfKUnfeoAJ0FY4Mcpr7kNAk45U6hyePOCHAF2VbV4frH+KM2P4Ci+V8XP
	dsDQ==
X-Received: by 10.66.177.46 with SMTP id cn14mr4728442pac.4.1369160163096;
	Tue, 21 May 2013 11:16:03 -0700 (PDT)
Received: from sa-nc-common3-43.static.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id w8sm3646343pbo.9.2013.05.21.11.16.01
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 21 May 2013 11:16:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Message-Id: <04B2970B-A4CB-48F6-88FD-56862388393F@gmail.com>
Date: Tue, 21 May 2013 11:16:10 -0700
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, 
	Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
X-Mailer: Apple Mail (2.1503)
Subject: world build on angstrom-next
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
X-List-Received-Date: Tue, 21 May 2013 18:16:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi All

I have run world build on angstrom and here are results if anyone is =
interested and provide fixes.

http://sakrah.dontexist.org/files/eglibc.beaglebone.world.log

There are a lot of parsing errors especially from meta-opie

Thanks
-Khem

=20=

