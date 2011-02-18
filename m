Received: from einhorn.in-berlin.de ([192.109.42.8])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1PqTeZ-00056G-Is
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Feb 2011 17:58:13 +0100
X-Envelope-From: sledz@dresearch.de
X-Envelope-To: <openembedded-devel@lists.openembedded.org>
Received: from mobil-400-586.intern.dresearch.de
	(p57A21F70.dip0.t-ipconnect.de [87.162.31.112])
	(authenticated bits=0)
	by einhorn.in-berlin.de (8.13.6/8.13.6/Debian-1) with ESMTP id
	p1IGujwf024421
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Feb 2011 17:56:45 +0100
Received: from mobil-400-586.intern.dresearch.de (localhost [IPv6:::1])
	by mobil-400-586.intern.dresearch.de (Postfix) with ESMTP id 5A25D23634
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Feb 2011 17:56:43 +0100 (CET)
Message-ID: <4D5EA4CA.7090205@dresearch.de>
Date: Fri, 18 Feb 2011 17:56:42 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.16) Gecko/20101125 SUSE/3.0.11 Lightning/1.0b1
	Thunderbird/3.0.11
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Scanned-By: MIMEDefang_at_IN-Berlin_e.V. on 192.109.42.8
X-MIME-Autoconverted: from 8bit to quoted-printable by einhorn.in-berlin.de id
	p1IGujwf024421
Subject: Release-2011.03 - package acl contains bad RPATH
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
X-List-Received-Date: Fri, 18 Feb 2011 16:59:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

First negativ test result :(

NOTE: Running task 963 of 1217 (ID: 668, /var/lib/jenkins/jobs/OE-testing=
/workspace/openembedded/recipes/udev/acl_2.2.49.bb, do_package)
NOTE: package acl-2.2.49-r3: task do_package: Started
ERROR: QA Issue with acl: package acl contains bad RPATH /var/lib/jenkins=
/jobs/OE-testing/workspace/tmp/sysroots/armv5te-angstrom-linux-gnueabi/us=
r/lib in file /var/lib/jenkins/jobs/OE-testing/workspace/tmp/work/armv5te=
-angstrom-linux-gnueabi/acl-2.2.49-r3/packages-split/acl/usr/lib/libacl.s=
o.1.1.0
ERROR: QA Issue with acl: package acl contains bad RPATH /var/lib/jenkins=
/jobs/OE-testing/workspace/tmp/sysroots/armv5te-angstrom-linux-gnueabi/us=
r/lib in file /var/lib/jenkins/jobs/OE-testing/workspace/tmp/work/armv5te=
-angstrom-linux-gnueabi/acl-2.2.49-r3/packages-split/acl/usr/lib/libacl.s=
o.1
ERROR: Task 668 (/var/lib/jenkins/jobs/OE-testing/workspace/openembedded/=
recipes/udev/acl_2.2.49.bb, do_package) failed with 256
FATAL: QA run found fatal errors. Please consider fixing them.

Build Configuration:
BB_VERSION        =3D "1.10.2"
METADATA_BRANCH   =3D "testing-release-2011.03" (72a088f7e1cf2eb0b50f2853=
01478278c616c1cd)
METADATA_REVISION =3D "72a088f"
TARGET_ARCH       =3D "arm"
TARGET_OS         =3D "linux-gnueabi"
MACHINE           =3D "hipox"
DISTRO            =3D "angstrom"
DISTRO_VERSION    =3D "2010.7-test-20110218"
TARGET_FPU        =3D "soft"

Steffen

--=20
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@DResearch.de
Fax: +49 30 515932-299
Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Weber, Werner M=C3=B6gle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


