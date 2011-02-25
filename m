Received: from einhorn.in-berlin.de ([192.109.42.8] ident=root)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1PsxZL-0003qF-Bf
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Feb 2011 14:18:51 +0100
X-Envelope-From: sledz@dresearch.de
X-Envelope-To: <openembedded-devel@lists.openembedded.org>
Received: from mobil-400-586.intern.dresearch.de
	(p57A20011.dip0.t-ipconnect.de [87.162.0.17]) (authenticated bits=0)
	by einhorn.in-berlin.de (8.13.6/8.13.6/Debian-1) with ESMTP id
	p1PDHVfU015116
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Feb 2011 14:17:31 +0100
Received: from mobil-400-586.intern.dresearch.de (localhost [IPv6:::1])
	by mobil-400-586.intern.dresearch.de (Postfix) with ESMTP id 72B5A217B7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Feb 2011 14:17:32 +0100 (CET)
Message-ID: <4D67ABEB.5020509@dresearch.de>
Date: Fri, 25 Feb 2011 14:17:31 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.16) Gecko/20101125 SUSE/3.0.11 Lightning/1.0b1
	Thunderbird/3.0.11
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Scanned-By: MIMEDefang_at_IN-Berlin_e.V. on 192.109.42.8
X-MIME-Autoconverted: from 8bit to quoted-printable by einhorn.in-berlin.de id
	p1PDHVfU015116
Subject: Release-2011.03/5dbd8d6 libnl2-1_2.0-r1: task do_compile: Failed
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
X-List-Received-Date: Fri, 25 Feb 2011 13:18:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

First error with the latest testing-release-2011.03 while trying clean bu=
ild of console-image. :(

Build Configuration:
BB_VERSION        =3D "1.12.0"
METADATA_BRANCH   =3D "testing-release-2011.03"
METADATA_REVISION =3D "5dbd8d6"
TARGET_ARCH       =3D "arm"
TARGET_OS         =3D "linux-gnueabi"
MACHINE           =3D "hipox"
DISTRO            =3D "angstrom"
DISTRO_VERSION    =3D "2010.7-test-20110225"
TARGET_FPU        =3D "soft"

Making all in lib
make[1]: Entering directory `/var/lib/jenkins/jobs/OE-testing/workspace/t=
mp/work/armv5te-angstrom-linux-gnueabi/libnl2-1_2.0-r1/libnl-2.0/lib'
bison -y -d  -o route/pktloc_syntax.c route/pktloc_syntax.y
make[1]: *** No rule to make target `route/pktloc_grammar.y', needed by `=
route/pktloc_grammar.c'.  Stop.
make[1]: *** Waiting for unfinished jobs....
make[1]: Leaving directory `/var/lib/jenkins/jobs/OE-testing/workspace/tm=
p/work/armv5te-angstrom-linux-gnueabi/libnl2-1_2.0-r1/libnl-2.0/lib'
make: *** [all-recursive] Error 1

Steffen

--=20
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@DResearch.de
Fax: +49 30 515932-299
Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Weber, Werner M=C3=B6gle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


