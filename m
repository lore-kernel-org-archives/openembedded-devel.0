Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1Ksa6k-0005MP-VR
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Oct 2008 11:34:27 +0200
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id 7C10216DEFE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Oct 2008 11:41:34 +0200 (CEST)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id C88972A420E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Oct 2008 11:42:39 +0200 (CEST)
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Wed, 22 Oct 2008 11:34:04 +0200
Message-ID: <69E6C70090A0A14498CC98FAE5E06B6E3CF486@hiob.intern.dresearch.de>
In-Reply-To: <gdmqut$htk$1@ger.gmane.org>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] support another hardware
Thread-Index: Ack0J8mDkVVZnGVNRrCyaX3gbYPkuAAAWKjg
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF480@hiob.intern.dresearch.de>	<gdknoe$186$2@ger.gmane.org><69E6C70090A0A14498CC98FAE5E06B6E3CF484@hiob.intern.dresearch.de>	<gdmocs$97j$1@ger.gmane.org><69E6C70090A0A14498CC98FAE5E06B6E3CF485@hiob.intern.dresearch.de>
	<gdmqut$htk$1@ger.gmane.org>
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
X-List-Received-Date: Wed, 22 Oct 2008 09:34:27 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> Try adding PACKAGE_EXTRA_ARCHS =3D "armv4 armv4t armv5te"

Thx, that works. ;-)

Steffen

PS: What's the exact meaning of these settings?


