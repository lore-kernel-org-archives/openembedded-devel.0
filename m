Received: from einhorn.in-berlin.de ([192.109.42.8] ident=root)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1PtxUF-0003Pz-UG
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Feb 2011 08:25:44 +0100
X-Envelope-From: sledz@dresearch.de
X-Envelope-To: <openembedded-devel@lists.openembedded.org>
Received: from mobil-400-586.intern.dresearch.de
	(p57A2064B.dip0.t-ipconnect.de [87.162.6.75]) (authenticated bits=0)
	by einhorn.in-berlin.de (8.13.6/8.13.6/Debian-1) with ESMTP id
	p1S7OKAb010030
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Feb 2011 08:24:20 +0100
Received: from mobil-400-586.intern.dresearch.de (localhost [IPv6:::1])
	by mobil-400-586.intern.dresearch.de (Postfix) with ESMTP id 161852338A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Feb 2011 08:24:18 +0100 (CET)
Message-ID: <4D6B4DA1.8060101@dresearch.de>
Date: Mon, 28 Feb 2011 08:24:17 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.16) Gecko/20101125 SUSE/3.0.11 Lightning/1.0b1
	Thunderbird/3.0.11
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Scanned-By: MIMEDefang_at_IN-Berlin_e.V. on 192.109.42.8
X-MIME-Autoconverted: from 8bit to quoted-printable by einhorn.in-berlin.de id
	p1S7OKAb010030
Subject: Release-2011.03/ac9745f angstrom-x-image-1.0-r0: task do_rootfs: Failed
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
X-List-Received-Date: Mon, 28 Feb 2011 07:25:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

| Collected errors:
|  * check_data_file_clashes: Package xfce4-notifyd wants to install file=
 /var/lib/jenkins/jobs/OE-testing/workspace/tmp/rootfs/angstrom-x-image/u=
sr/share/dbus-1/services/org.freedesktop.Notifications.service
| 	But that file is already provided by package  * notification-daemon
|  * opkg_install_cmd: Cannot install package task-xfce46-extras.
|  * resolve_conffiles: Existing conffile /var/lib/jenkins/jobs/OE-testin=
g/workspace/tmp/rootfs/angstrom-x-image/etc/device_table is different fro=
m the conffile in the new package. The new conffile will be placed at /va=
r/lib/jenkins/jobs/OE-testing/workspace/tmp/rootfs/angstrom-x-image/etc/d=
evice_table-opkg.
NOTE: package angstrom-x-image-1.0-r0: task do_rootfs: Failed

Build Configuration:
BB_VERSION        =3D "1.12.0"
METADATA_BRANCH   =3D "testing-release-2011.03"
METADATA_REVISION =3D "ac9745f"
TARGET_ARCH       =3D "arm"
TARGET_OS         =3D "linux-gnueabi"
MACHINE           =3D "hipox"
DISTRO            =3D "angstrom"
DISTRO_VERSION    =3D "2010.7-test-20110227"
TARGET_FPU        =3D "soft"

--=20
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@DResearch.de
Fax: +49 30 515932-299
Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Weber, Werner M=C3=B6gle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


