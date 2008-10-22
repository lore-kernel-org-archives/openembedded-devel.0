Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1KsZCw-0006pH-5V
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Oct 2008 10:36:46 +0200
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id B76BF16DEFE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Oct 2008 10:43:53 +0200 (CEST)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id 09FA62A420E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Oct 2008 10:44:59 +0200 (CEST)
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Wed, 22 Oct 2008 10:36:23 +0200
Message-ID: <69E6C70090A0A14498CC98FAE5E06B6E3CF485@hiob.intern.dresearch.de>
In-Reply-To: <gdmocs$97j$1@ger.gmane.org>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] support another hardware
Thread-Index: Ack0IQMG5KpCAH/7Sg2oqlrmxDWO5AAACTWA
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF480@hiob.intern.dresearch.de>	<gdknoe$186$2@ger.gmane.org><69E6C70090A0A14498CC98FAE5E06B6E3CF484@hiob.intern.dresearch.de>
	<gdmocs$97j$1@ger.gmane.org>
From: "Sledz, Steffen" <sledz@DResearch.DE>
To: <openembedded-devel@lists.openembedded.org>
Subject: Re: support another hardware
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
X-List-Received-Date: Wed, 22 Oct 2008 08:36:46 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> Looks like a package arch problem, could you show the oxe810.conf?

#@TYPE: Machine
#@NAME: OXE810(D)SE NAS devices
#@DESCRIPTION: Machine configuration for Oxford OXE810(D)SE NAS devices =
http://www.oxsemi.com/products/storage/nas.html

TARGET_ARCH =3D "arm"

MACHINE_FEATURES =3D "kernel26 ext2 pci ethernet serial"

PREFERRED_PROVIDER_virtual/kernel =3D "linux"

require conf/machine/include/tune-arm926ejs.inc


