Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <embedded@gmx.net>) id 1QZIIW-000894-RF
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Jun 2011 09:56:29 +0200
Received: (qmail invoked by alias); 22 Jun 2011 07:52:35 -0000
Received: from mx.3alitydigital.de (EHLO gport016linuxx64.localnet)
	[212.144.240.82]
	by mail.gmx.net (mp072) with SMTP; 22 Jun 2011 09:52:35 +0200
X-Authenticated: #118086913
X-Provags-ID: V01U2FsdGVkX1/V6ppgPvbVQtxUMK09KMMB/irHoxIxiZUDMKvIEU
	D9IXZhcwdP2IGf
From: "A. Schallenberg" <embedded@gmx.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Jun 2011 09:51:18 +0200
User-Agent: KMail/1.13.5 (Linux/2.6.35-28-generic; KDE/4.5.5; x86_64; ; )
References: <201106211432.22700.embedded@gmx.net>
	<1308660560.21613.16.camel@phil-desktop>
	<201106211519.23045.embedded@gmx.net>
In-Reply-To: <201106211519.23045.embedded@gmx.net>
MIME-Version: 1.0
Message-Id: <201106220951.18472.embedded@gmx.net>
X-Y-GMX-Trusted: 0
Subject: Re: openssl-native-1.0.0d-r14.0 compile fails
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
X-List-Received-Date: Wed, 22 Jun 2011 07:56:29 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,

thank you, Henning, for pointing me to the correct directory.

Its contents are:
openssl-1.0.0d> ls
ACKNOWLEDGMENTS
apps
bugs
certs
CHANGES
CHANGES.SSLeay
config
Configure
crypto
demos
doc
engines
e_os2.h
e_os.h
=46AQ
include
INSTALL
install.com
INSTALL.DJGPP
INSTALL.MacOS
INSTALL.NW
INSTALL.OS2
INSTALL.VMS
INSTALL.W32
INSTALL.W64
INSTALL.WCE
libcrypto.a
LICENSE
MacOS
Makefile
Makefile.org
Makefile.shared
makevms.com
ms
Netware
NEWS
openssl.doxy
openssl.ld
openssl.spec
os2
patches
perl
PROBLEMS
README
README.ASN1
README.ENGINE
shlib
ssl
test
times
tools
util
VMS

I tried "touch"ing this Makefile (like Robert suggested
on his mail on this list in March) but it didn't help.

So it seems that the files are downloaded and extracted.
The message
"make: *** No targets specified and no makefile found.  Stop."
is a bit strange, since here is a Makefile.

Best,
Andreas
=2D-=20
=46irmware developer
=2D-------------------------------------------
=46ON:+49-(0)8233-78994-18
=46AX:+49-(0)8233-78994-28
mailto:Andreas.Schallenberg@3alitydigital.de
http://www.3alitydigital.de
=2D-------------------------------------------

3ality Digital Systems GmbH
Gut Mergenthau
D-86438 Kissing / Bavaria / Germany
=2D-------------------------------------------

Gesch=E4ftsf=FChrer/CEO: Steve Schklair
Sitz der Gesellschaft: Kissing
Registergericht Augsburg, HRB 16421


