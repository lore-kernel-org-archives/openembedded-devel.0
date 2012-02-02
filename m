Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1RstlG-00010O-Mq
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Feb 2012 11:19:27 +0100
Received: from eb-e6520 (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id D40E74B005F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Feb 2012 11:11:28 +0100 (CET)
Date: Thu, 2 Feb 2012 11:11:27 +0100
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120202111127.0b9d886a@eb-e6520>
In-Reply-To: <20120202091726.GG3697@jama.jama.net>
References: <1324624336-18713-1-git-send-email-eric@eukrea.com>
	<20120104051849.GG31275@sakrah.homelinux.org>
	<20120104090523.066ae2d7@eb-e6520>
	<CA+chaQe-XFR6XVAoept8+d8kqoZ1y2qBoVXgetEPpD2n50nYBA@mail.gmail.com>
	<20120202084000.GD3697@jama.jama.net>
	<20120202091726.GG3697@jama.jama.net>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Subject: Re: [meta-oe] gdb-cross-canadian: build gdb with python support
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
X-List-Received-Date: Thu, 02 Feb 2012 10:19:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Martin,

Le Thu, 2 Feb 2012 10:17:26 +0100,
Martin Jansa <martin.jansa@gmail.com> a =E9crit :
> OE @ ~ $ ls /OE/shr-core/tmp/sysroots/x86_64-oesdk-linux-nativesdk/usr/lo=
cal/
> oecore-x86_64-arm
> OE @ ~ $ ls /OE/shr-core/tmp/sysroots/x86_64-nativesdk-oesdk-linux/usr/lo=
cal/
> oecore-x86_64-x86_64
>=20
using Angstrom I don't have the same directories here :
[ebenard@eb-e6520 setup-scripts]$ ls
build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-nativesdk-angstromsdk-linu=
x/usr/local/
angstrom-eglibc-x86_64-armv5te

> OE @ ~ $ find /OE/shr-core/tmp/sysroots/x86_64-oesdk-linux-nativesdk/usr/=
local/ -name python2.7
> OE @ ~ $ find /OE/shr-core/tmp/sysroots/x86_64-nativesdk-oesdk-linux/usr/=
local/ -name python2.7
> /OE/shr-core/tmp/sysroots/x86_64-nativesdk-oesdk-linux/usr/local/oecore-x=
86_64-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/python2.7
> /OE/shr-core/tmp/sysroots/x86_64-nativesdk-oesdk-linux/usr/local/oecore-x=
86_64-x86_64/sysroots/x86_64-oesdk-linux/usr/include/python2.7
>=20
strange :
$ find build/tmp-angstrom_2010_x-eglibc/sysroots/ -name python2.7
build/tmp-angstrom_2010_x-eglibc/sysroots/at91sam9m10g45ek/usr/include/pyth=
on2.7
build/tmp-angstrom_2010_x-eglibc/sysroots/at91sam9m10g45ek/usr/lib/python2.7
build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-nativesdk-angstromsdk-linu=
x/usr/local/angstrom-eglibc-x86_64-armv5te/sysroots/x86_64-angstromsdk-linu=
x/usr/include/python2.7
build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-nativesdk-angstromsdk-linu=
x/usr/local/angstrom-eglibc-x86_64-armv5te/sysroots/x86_64-angstromsdk-linu=
x/usr/lib/python2.7
build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/usr/bin/python2.7
build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/usr/include/python2.7
build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/usr/lib/python2.7

Eric
--=20
http://eukrea.com/en/news/104-2012


