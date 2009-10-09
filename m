Received: from [93.186.196.80] (helo=mis07.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mailings@hardware-datenbank.de>) id 1MwGdL-0008Cb-6w
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Oct 2009 16:39:54 +0200
Received: by mis07.de (Postfix, from userid 65534)
	id 3DBA611C64A5; Fri,  9 Oct 2009 16:39:01 +0200 (CEST)
Received: from [192.168.2.121] (p5DC8EB68.dip.t-dialin.net [93.200.235.104])
	by mis07.de (Postfix) with ESMTPA id 2349711C64A5
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Oct 2009 16:39:00 +0200 (CEST)
Message-ID: <4ACF4AF7.9070406@hardware-datenbank.de>
Date: Fri, 09 Oct 2009 16:38:47 +0200
From: Rath <mailings@hardware-datenbank.de>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <A22F8CDABC6B406EA2FC80E3109602BD@pcvirus>
	<200910082311.16084.david.lanzendoerfer@o2s.ch>
In-Reply-To: <200910082311.16084.david.lanzendoerfer@o2s.ch>
X-SA-Exim-Connect-IP: 93.186.196.80
X-SA-Exim-Mail-From: mailings@hardware-datenbank.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: build of libxrender failed
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
X-List-Received-Date: Fri, 09 Oct 2009 14:39:54 -0000
Content-Type: multipart/mixed; boundary="------------010901050800020005090909"

--------------010901050800020005090909
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

I have a config file for the beagleboard (attached). In the=20
openembedded/conf/distro/angstrom-2008.1.conf I've set=20
"PREFERRED_VERSION_linux-libc-headers" to "2.6.29"

David Lanzend=F6rfer schrieb:
> Which distro you have configured in your local.conf?
> With the wrong (eg. old openmoko or fso) it doesnt work very good eventu=
ally.
> The have different prefered versions.
> Please give me more informations over your build/conf/local.conf then I =
can=20
> help you.
>
> greatings
> =09leviathan
>  =20
> ------------------------------------------------------------------------
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>  =20

DISTRO =3D "angstrom-2008.1"
BBFILES =3D "/home/administrator/oe/stable/openembedded/recipes/*/*.bb"
TMPDIR =3D "/home/administrator/oe/stable/tmp"
MACHINE =3D "beagleboard"
ENABLE_BINARY_LOCALE_GENERATION =3D "0"

--------------010901050800020005090909--
