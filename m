Return-Path: <Daniel.MONDON@lpgsystems.com>
Received: from antispam.lpg.priv (mail.lpgsystems.com [46.18.228.1])
	by mail.openembedded.org (Postfix) with ESMTP id 3C6D37024A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jul 2014 15:59:02 +0000 (UTC)
Received: from SEXCHANGE0100.lpg.priv (unknown [10.1.1.25])
	by antispam.lpg.priv (mail.lpgsystems.com) with ESMTP id 7F3B13300D1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jul 2014 17:59:02 +0200 (CEST)
Received: from SEXCHANGE0100.lpg.priv ([::1]) by SEXCHANGE0100.lpg.priv
	([::1]) with mapi id 14.03.0195.001; Fri, 11 Jul 2014 17:59:00 +0200
From: MONDON Daniel <Daniel.MONDON@lpgsystems.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] Building openjdk-7-jre
Thread-Index: AQHPkhQeLjZyUdCn6Uq67T0LrV6O+5uFCFuA///nGgCAACU5gIAJcK6QgAXa8UCABLNnwIAB4g8g///oqwCAAC0REP//4qaAAAVybhA=
Date: Fri, 11 Jul 2014 15:59:00 +0000
Message-ID: <F48900D76F0D8349918584FEEFEB4BCA0614BF9B@SEXCHANGE0100.lpg.priv>
References: <20140627141915.GA23711@mail.itconsulting-heinold.de>
	<F48900D76F0D8349918584FEEFEB4BCA0612C6A6@SEXCHANGE0100.lpg.priv>
	<20140627151503.GB23711@mail.itconsulting-heinold.de>
	<F48900D76F0D8349918584FEEFEB4BCA0612C6D6@SEXCHANGE0100.lpg.priv>
	<F48900D76F0D8349918584FEEFEB4BCA0612EC9F@SEXCHANGE0100.lpg.priv>
	<F48900D76F0D8349918584FEEFEB4BCA0612F212@SEXCHANGE0100.lpg.priv>
	<F48900D76F0D8349918584FEEFEB4BCA0614A7C3@SEXCHANGE0100.lpg.priv>
	<F48900D76F0D8349918584FEEFEB4BCA0614BE8C@SEXCHANGE0100.lpg.priv>
	<20140711141150.GB6407@mail.itconsulting-heinold.de>
	<F48900D76F0D8349918584FEEFEB4BCA0614BF19@SEXCHANGE0100.lpg.priv>
	<20140711150805.GC6407@mail.itconsulting-heinold.de>
In-Reply-To: <20140711150805.GC6407@mail.itconsulting-heinold.de>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.5.34]
MIME-Version: 1.0
X-DRWEB-SCAN: ok
X-VRSPAM-SCORE: 0
X-VRSPAM-STATE: legit
X-VRSPAM-CAUSE: gggruggvucftvghtrhhoucdtuddrfeejfedrvdehucetufdoteggodetrfcurfhrohhfihhlvgemuceonhhonhgvqeenuceurghilhhouhhtmecufedttdenuc
Subject: Re: Building openjdk-7-jre
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
X-List-Received-Date: Fri, 11 Jul 2014 15:59:03 -0000
Content-Language: fr-FR
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


I change g++ from 4.6 to 4.8.

http://askubuntu.com/questions/372248/downloaded-g-4-8-but-cant-set-it-as-d=
efault

both errors are ok now!

It is currently running openjdk-7-jre compilation :)

It is necessary under Ubuntu 12.04 ...

Thanks
Daniel.

On Fri, Jul 11, 2014 at 02:56:05PM +0000, MONDON Daniel wrote:
> Hi,
>=20
> I apt-get install libstdc++-4.8-dev.
> Is it the right version ?
>=20
> Thanks
> Daniel.
>=20

Sorry I can not look at your computer, but it should match the g++ you are =
using.

g++ has a nice option which is called --version, which will tell you the ve=
rsion.

Bye Henning
--=20


