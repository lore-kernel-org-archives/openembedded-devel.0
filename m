Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1Lwvg1-0000Tr-RA
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Apr 2009 11:57:05 +0200
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id 140E816DFDC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Apr 2009 11:52:51 +0200 (CEST)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id A0AD52A421B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Apr 2009 11:52:29 +0200 (CEST)
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Thu, 23 Apr 2009 11:51:59 +0200
Message-ID: <69E6C70090A0A14498CC98FAE5E06B6E3CF76F@hiob.intern.dresearch.de>
In-Reply-To: <gspddj$ctn$1@ger.gmane.org>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] deploy multiple kernel image types
Thread-Index: AcnD+LKSrkc/yUUJROKqTpL4dWdPWgAADRAA
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF76D@hiob.intern.dresearch.de>
	<gspddj$ctn$1@ger.gmane.org>
From: "Sledz, Steffen" <sledz@DResearch.DE>
To: <openembedded-devel@lists.openembedded.org>
Subject: Re: deploy multiple kernel image types
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
X-List-Received-Date: Thu, 23 Apr 2009 09:57:06 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> > Is it possible to deploy multiple kernel image types (e.g.=20
> > zImage and uImage) at the same time? As i understand it right=20
> > KERNEL_IMAGETYPE allows just one argument.
>=20
> At the moment: no, but I would be interested in such=20
> functionality for boards using kexecboot initramfs inside
> a uImage that will load a zImage from disk.

That's exactly the scenario i need it for. ;-)


