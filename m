Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1PuQdB-0006Tz-8C
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Mar 2011 15:32:53 +0100
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 0ABA2491278;
	Tue,  1 Mar 2011 15:31:29 +0100 (CET)
Received: from [10.32.10.2] ([10.32.10.2]) by exchange.intern.dresearch.de
	with Microsoft SMTPSVC(6.0.3790.4675); 
	Tue, 1 Mar 2011 15:31:29 +0100
Message-ID: <4D6D0340.9090109@dresearch.de>
Date: Tue, 01 Mar 2011 15:31:28 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.2.13) Gecko/20101207 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 01 Mar 2011 14:31:29.0088 (UTC)
	FILETIME=[5A4DA400:01CBD81D]
Cc: Koen Kooi <koen@openembedded.org>
Subject: Release-2011.03 gupnp-0.13.4-r0: task do_compile: Failed
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
X-List-Received-Date: Tue, 01 Mar 2011 14:32:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Clean build: bitbake gupnp

| make[3]: Entering directory `/SCRATCH/SSZ/HydraIP/OE/tmp.6/work/armv5te=
-angstrom-linux-gnueabi/gupnp-0.13.4-r0/gupnp-0.13.4/libgupnp'
|   CC     http-headers.lo
|   CC     gupnp-context-manager.lo
|   CC     gupnp-unix-context-manager.lo
|   CC     gupnp-context.lo
|   CC     gupnp-control-point.lo
|   CC     gupnp-device.lo
|   CC     gupnp-device-info.lo
|   CC     gupnp-device-proxy.lo
|   CC     gupnp-error.lo
|   CC     gupnp-resource-factory.lo
|   CC     gupnp-root-device.lo
|   CC     gupnp-service.lo
|   CC     gupnp-service-info.lo
|   CC     gupnp-service-proxy.lo
|   CC     gupnp-service-introspection.lo
|   CC     gupnp-xml-doc.lo
|   CC     gupnp-types.lo
|   CC     gvalue-util.lo
|   CC     xml-util.lo
|   CC     gupnp-marshal.lo
|   CCLD   libgupnp-1.0.la
|   GEN    GUPnP-1.0.gir
| Couldn't find include 'Soup-2.4.gir' (search path: ['/SCRATCH/SSZ/Hydra=
IP/OE/tmp.6/sysroots/armv5te-angstrom-linux-gnueabi/usr/share/gir-1.0', '=
/SCRATCH/SSZ/HydraIP/OE/tmp.6/sysroots/x86_64-linux/usr/share/gir-1.0', '=
/usr/share/gir-1.0', '/SCRATCH/SSZ/HydraIP/OE/tmp.6/sysroots/x86_64-linux=
/usr/share/gir-1.0'])
| make[3]: *** [GUPnP-1.0.gir] Error 1

Build Configuration:
BB_VERSION        =3D "1.10.2"
METADATA_BRANCH   =3D "testing-release-2011.03"
METADATA_REVISION =3D "62bf073"
TARGET_ARCH       =3D "arm"
TARGET_OS         =3D "linux-gnueabi"
MACHINE           =3D "hipox"
DISTRO            =3D "angstrom"
DISTRO_VERSION    =3D "2010.7-test-20110301"
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


