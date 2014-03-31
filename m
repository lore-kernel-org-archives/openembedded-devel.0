Return-Path: <Daniel.MONDON@lpgsystems.com>
Received: from antispam.lpg.priv (mail.lpgsystems.com [46.18.228.1])
	by mail.openembedded.org (Postfix) with ESMTP id 82BA06AB50
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Mar 2014 07:58:36 +0000 (UTC)
Received: from SEXCHANGE0100.lpg.priv (unknown [10.1.1.25])
	by antispam.lpg.priv (mail.lpgsystems.com) with ESMTP id EF6A73300C4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Mar 2014 09:58:36 +0200 (CEST)
Received: from SEXCHANGE0100.lpg.priv ([::1]) by SEXCHANGE0100.lpg.priv
	([::1]) with mapi id 14.03.0174.001; Mon, 31 Mar 2014 09:58:29 +0200
From: MONDON Daniel <Daniel.MONDON@lpgsystems.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: USB wifi configuration
Thread-Index: AQHPSq02nxZ52wcuh0uJO2yPO3D9e5r6tx+w
Date: Mon, 31 Mar 2014 07:58:28 +0000
Message-ID: <F48900D76F0D8349918584FEEFEB4BCA060CBB48@SEXCHANGE0100.lpg.priv>
References: <45034856.Fj98ikVczS@localhost.localdomain>
	<F48900D76F0D8349918584FEEFEB4BCA060CB696@SEXCHANGE0100.lpg.priv>
In-Reply-To: <F48900D76F0D8349918584FEEFEB4BCA060CB696@SEXCHANGE0100.lpg.priv>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.5.36]
MIME-Version: 1.0
X-VRSPAM-SCORE: 0
X-VRSPAM-STATE: legit
X-VRSPAM-CAUSE: ú
Subject: Re: USB wifi configuration
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
X-List-Received-Date: Mon, 31 Mar 2014 07:58:37 -0000
Content-Language: fr-FR
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

I have a 3.2.30 kernel.
With DISTRO =3D "angstrom" and DISTRO_VERSION =3D "v2012.05"

I want to use USB wifi dongle.

I do "bitbake -c menuconfig virtual/kernel" modifications and put the outpu=
t file .config in the required directory (renamed in defconfig).
/networking support / Wireless / ...
And /Device Drivers/Network device support/Wireless LAN/...
(I've got RTL8287L (and a netgear WG111v2) waiting for Belkin surf N150 rec=
eption).

But I have the error to "iw list" --> "nl80211 not found."

What am I forgetting.

Thanks
Daniel.
---------------------------------------------------------------------------=
-----------------
Hi,

I've just cleansstate the kernel. Have I anything else more to rebuild ?

Thanks
Daniel.

