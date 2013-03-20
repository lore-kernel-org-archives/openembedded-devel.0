Received: from mail-pb0-f41.google.com ([209.85.160.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UIJsT-0003Oz-Ee
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Mar 2013 15:20:32 +0100
Received: by mail-pb0-f41.google.com with SMTP id um15so1394071pbc.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Mar 2013 07:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=sTK3rk63aK+Avm7t/zOmCcarBDVqxOVucOUivLTxKr0=;
	b=ZPSQtNOT2/au3IJfb3cgoL9Lh8qXtG7kBrE6gI3bkJe8QEcHpuz+4fXjUDkAtFgdgJ
	vc9GaudSFb7bSg+2yh499JVEm7rs2OARfyzAPwS2fFfMCCoCjQCCMGitwpU4SV+y8WtO
	nqbi45LKBkvET6buuGXmmErz4UO2rEEL/d/JJi7Mc/NFE5/gsmdMywIbzbK/43gSI4ob
	b+sZjFZjWERiMSVI+wI9Rt8KYxu2onu0UrNBA3sdI2X21k3xRG338NpeU/Isi+ZuoRus
	EjOkXI4h6lCQXGJwfPSBOdvgvUc/1nuHJYFe7VvaCT8oL5xJ0awLefkKJXRkyFpkgCIg
	8FlQ==
X-Received: by 10.68.197.4 with SMTP id iq4mr9216905pbc.96.1363788217950;
	Wed, 20 Mar 2013 07:03:37 -0700 (PDT)
Received: from sa-nc-ipg-172-23-0-104.static.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id ab1sm2227286pbd.37.2013.03.20.07.03.37
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 20 Mar 2013 07:03:37 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAGiJk9ejLAdb3LWpTDpbVaPaDMsGNsX26yB3gHOExA46XW5L1g@mail.gmail.com>
Date: Wed, 20 Mar 2013 07:03:36 -0700
Message-Id: <BA6A16F2-4CE4-41E6-90C4-834A96CF246B@gmail.com>
References: <1363769468-20321-1-git-send-email-raj.khem@gmail.com>
	<51497DC8.5090006@linaro.org>
	<CAGiJk9ejLAdb3LWpTDpbVaPaDMsGNsX26yB3gHOExA46XW5L1g@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1503)
Subject: Re: [meta-kde][PATCH] cyrus-sasl: Make pkg_postinst/rm package specfic
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
X-List-Received-Date: Wed, 20 Mar 2013 14:20:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Mar 20, 2013, at 2:32 AM, Samuel Stirtzel <s.stirtzel@googlemail.com> =
wrote:

> Hi, it seems there are some differences in the recipes, maybe we can
> work through them.
>=20
> Is BDB 5 working correctly with this version, without the patch [1]?
>=20
>=20
> [1] =
https://gitorious.org/openembedded-core-layers/meta-kde/blobs/c9bac7d55796=
e0f88e6950dfff2adbb186b0df7a/recipes-misc-support/cyrus-sasl/Fix-for-berke=
ley-db-5.patch
>=20

Samuel

Post an update to meta-networking. I think meta-oe one should be removed =
too.=


