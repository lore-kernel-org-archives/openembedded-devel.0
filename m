Return-Path: <Daniel.MONDON@lpgsystems.com>
Received: from antispam.lpg.priv (mail.lpgsystems.com [46.18.228.1])
	by mail.openembedded.org (Postfix) with ESMTP id D919C6C735
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Mar 2014 17:43:26 +0000 (UTC)
Received: from SEXCHANGE0100.lpg.priv (unknown [10.1.1.25])
	by antispam.lpg.priv (mail.lpgsystems.com) with ESMTP id BC2133300C2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Mar 2014 18:43:24 +0100 (CET)
Received: from SEXCHANGE0100.lpg.priv ([::1]) by SEXCHANGE0100.lpg.priv
	([::1]) with mapi id 14.03.0174.001; Fri, 28 Mar 2014 18:43:22 +0100
From: MONDON Daniel <Daniel.MONDON@lpgsystems.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: USB wifi configuration
Thread-Index: AQHPSq02nxZ52wcuh0uJO2yPO3D9ew==
Date: Fri, 28 Mar 2014 17:43:22 +0000
Message-ID: <F48900D76F0D8349918584FEEFEB4BCA060CB696@SEXCHANGE0100.lpg.priv>
References: <45034856.Fj98ikVczS@localhost.localdomain>
In-Reply-To: <45034856.Fj98ikVczS@localhost.localdomain>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.5.36]
MIME-Version: 1.0
X-DRWEB-SCAN: ok
X-VRSPAM-SCORE: 0
X-VRSPAM-STATE: legit
X-VRSPAM-CAUSE: gggruggvucftvghtrhhoucdtuddrfeejuddrgeeiucetufdoteggodetrfcurfhrohhfihhlvgemuceonhhonhgvqeenuceurghilhhouhhtmecufedttdenuc
Subject: USB wifi configuration
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
X-List-Received-Date: Fri, 28 Mar 2014 17:43:29 -0000
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


