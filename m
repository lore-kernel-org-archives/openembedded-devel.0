Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1LK6Sz-0003Ww-Ci
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Jan 2009 08:35:09 +0100
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id 206C016E256
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Jan 2009 08:40:11 +0100 (CET)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id 81CEB2A41E8
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Jan 2009 08:29:10 +0100 (CET)
Date: Tue, 6 Jan 2009 08:28:51 +0100
Message-ID: <69E6C70090A0A14498CC98FAE5E06B6E3CF59A@hiob.intern.dresearch.de>
MIME-Version: 1.0
In-Reply-To: <4962306D.4060008@balister.org>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] Problem with bitbake after update
x-mimeole: Produced By Microsoft Exchange V6.5
Thread-Index: AclvUXRWC6DeYGjBTIq/8IhTuuu82gAfuzXw
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF596@hiob.intern.dresearch.de>
	<4962306D.4060008@balister.org>
From: "Sledz, Steffen" <sledz@DResearch.DE>
To: <openembedded-devel@lists.openembedded.org>
Subject: Re: Problem with bitbake after update
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
X-List-Received-Date: Tue, 06 Jan 2009 07:35:09 -0000
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-class: urn:content-classes:message

> export BB_ENV_EXTRAWHITE=3D"OE_HOME"
>=20
> to the environment before running bitbake.

Thnx, export BB_ENV_EXTRAWHITE=3D"OE_HOME OE_ROOT" did it.



