Received: from [209.172.120.180] (helo=skymoon.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ckamas@finesse.com>) id 1MBXZB-0004IZ-Jn
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Jun 2009 19:14:26 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Tue, 2 Jun 2009 10:05:32 -0700
Message-ID: <C62896630644CE43BF64B0FF0AC27F0E05B52C@mail.ad.skymv.com>
In-Reply-To: <1243956322.2611.11.camel@mill.internal.reciva.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] bitbake virtual/kernel -c menuconfig
Thread-Index: Acnjls3zeZyyKwt7RWOJL5/1RXiI1wADG70g
References: <C62896630644CE43BF64B0FF0AC27F0E05B4D2@mail.ad.skymv.com><1243929198.5049.45.camel@lenovo.internal.reciva.com><C62896630644CE43BF64B0FF0AC27F0E05B514@mail.ad.skymv.com>
	<1243956322.2611.11.camel@mill.internal.reciva.com>
From: "Chuck Kamas" <ckamas@finesse.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: Re: bitbake virtual/kernel -c menuconfig
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
X-List-Received-Date: Tue, 02 Jun 2009 17:14:26 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> I just did "bitbake -c menuconfig
> -b ../org.openembedded.dev/recipes/linux/linux_2.6.28.bb"=20
> using DISTRO=3Dminimal, MACHINE=3Dat91sam9263ek and it seemed to=20
> apply the patches
> correctly:
>=20

Interesting.  I must have something configured incorrectly (no
kidding!). =20
Are you working on the STABLE/2009 branch?=20
Did you remove the tmp directory between builds?

Thanks for the help.
Chuck


