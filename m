Received: from ey-out-1920.google.com ([74.125.78.150])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen@dominion.thruhere.net>) id 1OCxF1-0002Qy-PR
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 May 2010 17:56:00 +0200
Received: by ey-out-1920.google.com with SMTP id 26so243470eyw.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 May 2010 08:52:05 -0700 (PDT)
Received: by 10.213.68.193 with SMTP id w1mr449772ebi.92.1273852325339;
	Fri, 14 May 2010 08:52:05 -0700 (PDT)
Received: from [172.20.1.5] (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id 16sm1337854ewy.7.2010.05.14.08.52.04
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 14 May 2010 08:52:04 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1078)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4BED67FB.1060900@eukrea.com>
Date: Fri, 14 May 2010 17:52:01 +0200
Message-Id: <3D406A77-A498-47BB-A8DD-6BEC7E55D5B6@student.utwente.nl>
References: <1272921691-6963-1-git-send-email-eric@eukrea.com>
	<4BED67FB.1060900@eukrea.com>
To: =?iso-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
X-Mailer: Apple Mail (2.1078)
X-SA-Exim-Connect-IP: 74.125.78.150
X-SA-Exim-Mail-From: koen@dominion.thruhere.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC][PATCH] module-base.bbclass: keep PR if MACHINE_KERNEL_PR is not set
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 May 2010 15:56:00 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 14 mei 2010, om 17:10 heeft Eric B=E9nard het volgende geschreven:

> Hi Koen,
>=20
> I was told you are the person to contact about MACHINE_KERNEL_PR so =
may you please have a look to the patch below - also available here : =
http://patchwork.openembedded.org/patch/2012/
>=20
> Actually, when compiling modules (out of tree), we loose PR if =
MACHINE_KERNEL_PR is not set.

I don't believe that when MACHINE_KERNEL_PR isn't set people care about =
PR.

regards,

Koen=


