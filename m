Received: from goliath.siemens.de ([192.35.17.28])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Fabrice.Aeschbacher@siemens.com>) id 1Pn6JQ-0005vP-Ly
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Feb 2011 10:26:12 +0100
Received: from mail2.siemens.de (localhost [127.0.0.1])
	by goliath.siemens.de (8.13.6/8.13.6) with ESMTP id p199PBCN008281
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 9 Feb 2011 10:25:11 +0100
Received: from DEMCHP99ET0MSX.ww902.siemens.net
	(demchp99et0msx.ww902.siemens.net [139.25.131.181])
	by mail2.siemens.de (8.13.6/8.13.6) with ESMTP id p199PBIH031080
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 9 Feb 2011 10:25:11 +0100
Received: from DEMCHP99E35MSX.ww902.siemens.net ([169.254.2.227]) by
	DEMCHP99ET0MSX.ww902.siemens.net ([139.25.131.181]) with mapi;
	Wed, 9 Feb 2011 10:25:11 +0100
From: "Aeschbacher, Fabrice" <Fabrice.Aeschbacher@siemens.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 9 Feb 2011 10:25:10 +0100
Thread-Topic: [oe] 2011.03 release testing, starts soon!
Thread-Index: AcvHyNmr7RcRmmGYSnWN2ZFgaWL8TgAbtOtQ
Message-ID: <09D9BE2AC4AA764DABAA8C91E48D819E011A79A329@DEMCHP99E35MSX.ww902.siemens.net>
References: <4D519C83.9060502@mentor.com>
In-Reply-To: <4D519C83.9060502@mentor.com>
Accept-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: de-DE
MIME-Version: 1.0
Subject: Re: 2011.03 release testing, starts soon!
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
X-List-Received-Date: Wed, 09 Feb 2011 09:26:13 -0000
Content-Language: de-DE
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi all,=20

There are two things which could be useful (IMO) for OE users:

1. a small README file (or wiki page) just highlighting the main
   changes since last release (2010.12), e.g. something like
   "Prominent features (the cool stuff)" on http://kernelnewbies.org/LinuxC=
hanges
   This would help us OE users to decice whether it is worth rebasing on th=
e latest
   release now, or if it can wait=20

2. Do not delete the release branch after 2011.03 will be released (just li=
ke
   it was done for 2010.12), but let it live and allow developpers committi=
ng
   bug-fixes (backporting choosen things?) reported back by OE users (some =
would
   would be happy to contribute this way)
  =20
With kind regards,
Fabrice Aeschbacher


> -----Urspr=FCngliche Nachricht-----
> Im Auftrag von Tom Rini
> Gesendet: Dienstag, 8. Februar 2011 20:42
> Betreff: [oe] 2011.03 release testing, starts soon!
>=20
> Hey all,
>=20
> I'd like to start getting a testing branch for the 2011.03=20
> release going=20
> in place of the usual testing-next branch.  My plan is to use the=20
> testing-release-2011.03 branch for this and go weekly for the=20
> 10th and=20
> 17th and then "play it by ear" and see if we need to update=20
> maybe twice=20
> a week until early march.
>=20
> As I just mentioned in another email, I've created=20
> http://wiki.openembedded.org/index.php/Release-2011.03 which=20
> is where we=20
> can store who tested what (and against what hash).
>=20
> Thanks all!
>=20
> --=20
> Tom Rini
> Mentor Graphics Corporation


