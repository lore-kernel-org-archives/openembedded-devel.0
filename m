Received: from nm11.bullet.mail.ac4.yahoo.com ([98.139.52.208])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <brett.mcmillian@crossfieldtech.com>)
	id 1RULsQ-0004V5-8y for openembedded-devel@lists.openembedded.org;
	Sat, 26 Nov 2011 18:17:22 +0100
Received: from [98.139.52.195] by nm11.bullet.mail.ac4.yahoo.com with NNFMP;
	26 Nov 2011 17:08:14 -0000
Received: from [98.139.52.165] by tm8.bullet.mail.ac4.yahoo.com with NNFMP;
	26 Nov 2011 17:08:14 -0000
Received: from [127.0.0.1] by omp1048.mail.ac4.yahoo.com with NNFMP;
	26 Nov 2011 17:08:14 -0000
X-Yahoo-Newman-Id: 95617.81039.bm@omp1048.mail.ac4.yahoo.com
Received: (qmail 8080 invoked from network); 26 Nov 2011 17:08:14 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024;
	t=1322327294; bh=wxGGDQeU+2IbOVaqh9eju702BsQoxqoDP8I+JvW2Xo0=;
	h=X-Yahoo-Newman-Property:X-YMail-OSG:X-Yahoo-SMTP:Received:Subject:References:From:Content-Type:X-Mailer:In-Reply-To:Message-Id:Date:To:Content-Transfer-Encoding:Mime-Version;
	b=ouKM85+TJeMNgnDcCx+OV3YIBc3ltK+51nA7yYiLUq8EjVvS09X6Xz8au1JBqJPsi390lZcbZIAMXcvJk+qznVKpEA43sEqPRRDZxMPgU/EimPjO48vpEJcYsHGArLiangNUFQvmy66+brSPecscPEurxHj/xSIbj0wi9Wqdu4k=
X-Yahoo-Newman-Property: ymail-3
X-YMail-OSG: xFePZEUVM1nuWbFudHif2ZuPyG4DpZCn4b2WTJLOw5uy4B7
	yyzvdJx1rbBj.tY8mhbWwTQuFl1sd.pa.2heO7ScnjeKHs1.wX0G7f1lNVqn
	t8ns9ujYxqbSAdra3hYchlKcR945nMD7gy6c3U9n8j93r2XbFJ6BDTMjhYdU
	8nGye3q4SNWbuFDu2ood0wM2wUjCZaV_xBljHxipNtEHZX6NrkV4p9pTppGr
	VYQu5b8WVuh2uF7wtC2b.wb6JINvAZzmm0ATUhFVM1zeVioZTOJ2mZA.88kY
	StVoBkpqIfBvNS8qI4CzklxTod5jkbZiebgQWcslgQB1aDNHWlaBR_moRJM4
	3gWsxcMUnJkoJoqwN7kMsU5OwYW9ALhk.Ibov4AiQOAA1ubQRCQCz2zr_rRr
	.dXZVhoxCaWOf.yPi95kIR__uvQQzFhcy8Ae.dCs.kaAmcpENyzvtoAfY9SO
	dukITZdfLKqKA1oz438SvM14Km_u7V9HLB_rjioFSiRUTRwhthY5EtOt865u
	xBOvdtV57G8iYdRtQjreV1xhaGBzOjqeuQHAZNEwVpBQwgUk1uNTNKifXTmD
	jHGCP.ddOhevCWl6s_Lq3uR4nCgtm_5CpsjYJkaMb8u5vtOG7fWiCFgnBe0E
	Ho0sElOy78MjmabK6KU94D7RZzcPFKwZFBnM-
X-Yahoo-SMTP: nnexsE.swBBZP0MgcFjP5wxnkPNXJHJOx4o.w1x4bFR9C0hTX2Q-
Received: from [192.168.1.111] (brett.mcmillian@66.25.190.109 with xymcookie)
	by smtp123-mob.biz.mail.ac4.yahoo.com with SMTP;
	26 Nov 2011 09:08:13 -0800 PST
References: <1322247176.91444.YahooMailRC@web5703.biz.mail.ne1.yahoo.com>
	<CAEsOVNchsOnDwZhadFHUHDz98oLrXm0fk-gV=WHWf-iWCS2xGA@mail.gmail.com>
	<CA+M6bXkH28ymg+CC+6bffS-KDHgpwaCneDZ_ezeThs7=ku7xNw@mail.gmail.com>
From: Brett McMillian <brett.mcmillian@crossfieldtech.com>
X-Mailer: iPhone Mail (9A334)
In-Reply-To: <CA+M6bXkH28ymg+CC+6bffS-KDHgpwaCneDZ_ezeThs7=ku7xNw@mail.gmail.com>
Message-Id: <C18C0503-C64F-4C86-818E-69656C62DF6C@crossfieldtech.com>
Date: Sat, 26 Nov 2011 11:08:12 -0600
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (1.0)
Subject: Re: Mac OS X & redhat-lsb
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
X-List-Received-Date: Sat, 26 Nov 2011 17:17:22 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

I tried both 2.6 and 2.7.  Same result.

Brett



On Nov 25, 2011, at 7:29 PM, Tom Rini <tom.rini@gmail.com> wrote:

> On Fri, Nov 25, 2011 at 12:19 PM, McClintock Matthew-B29882
> <B29882@freescale.com> wrote:
>> On Fri, Nov 25, 2011 at 12:52 PM, Brett McMillian
>> <brett.mcmillian@crossfieldtech.com> wrote:
>>> Here are the steps I have run successfully so far.
>>> 1) ./scripts/rhel5-oe.sh
>>> 2) Edited the first line of ./scripts/create-config.py to read:
>>> #!/usr/bin/python2.7
>>> 3) ./scripts/create-config.py --config-file=3Dfsl-p1022ds/sample-create-=
config.ini
>>> --features=3D"native-development" -j 4 -t 2
>>> 4) source build_p1022ds_release/bitbake.rc
>>> 4) bitbake devel-image
>>=20
>> Just for everyone's information, some of this stuff is specfic to the
>> Freescale SDK. But, I think the rest should be valid.
>=20
> OS X isn't a supported (nor functional) build environment today nor in
> the snapshot that SDK is built from.  The first bit of problems sound
> like a "well, try python 2.6 instead" but once you overcome that,
> other things will fail.
>=20
> --=20
> Tom
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


