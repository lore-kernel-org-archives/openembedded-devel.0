Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1Ppeaw-0000gv-Ok
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 11:26:50 +0100
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 9A2AB491282
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 11:25:41 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 16 Feb 2011 11:25:41 +0100
Message-ID: <4D5BA625.1000209@dresearch.de>
Date: Wed, 16 Feb 2011 11:25:41 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.2.13) Gecko/20101207 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D5A3098.8060102@dresearch.de>
In-Reply-To: <4D5A3098.8060102@dresearch.de>
X-OriginalArrivalTime: 16 Feb 2011 10:25:41.0614 (UTC)
	FILETIME=[DCC0F0E0:01CBCDC3]
Subject: Re: do_rootfs failure (angstrom-x-image testing-release-2011.03)
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
X-List-Received-Date: Wed, 16 Feb 2011 10:26:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Am 15.02.2011 08:51, schrieb Steffen Sledz:
> | Collected errors:
> |  * check_data_file_clashes: Package xfce4-notifyd wants to install fi=
le /var/lib/jenkins/jobs/OE-testing/workspace/tmp/rootfs/angstrom-x-image=
/usr/share/dbus-1/services/org.freedesktop.Notifications.service
> | 	But that file is already provided by package  * notification-daemon
> |  * opkg_install_cmd: Cannot install package task-xfce46-extras.
> |  * resolve_conffiles: Existing conffile /var/lib/jenkins/jobs/OE-test=
ing/workspace/tmp/rootfs/angstrom-x-image/etc/device_table is different f=
rom the conffile in the new package. The new conffile will be placed at /=
var/lib/jenkins/jobs/OE-testing/workspace/tmp/rootfs/angstrom-x-image/etc=
/device_table-opkg.
> NOTE: package angstrom-x-image-1.0-r0: task do_rootfs: Failed
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of /var/lib/jenkins/jobs/OE-testing/workspace/openembedded=
/recipes/images/angstrom-x-image.bb do_rootfs failed
>=20
> Build Configuration:
> BB_VERSION        =3D "1.10.2"
> METADATA_BRANCH   =3D "testing-release-2011.03"
> METADATA_REVISION =3D "af8541c"
> TARGET_ARCH       =3D "arm"
> TARGET_OS         =3D "linux-gnueabi"
> MACHINE           =3D "hipox"
> DISTRO            =3D "angstrom"
> DISTRO_VERSION    =3D "2010.7-test-20110214"
> TARGET_FPU        =3D "soft"

Ping!

Would be nice to fix this before Tom updates the testing-release-2011.03 =
branch.

Steffen

--=20
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@DResearch.de
Fax: +49 30 515932-299
Gesch=E4ftsf=FChrer: Dr. Michael Weber, Werner M=F6gle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058



