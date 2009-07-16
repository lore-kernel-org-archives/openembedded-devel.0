Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1MRRZQ-0007tH-KD
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Jul 2009 16:04:24 +0200
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id E803416DE84
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jul 2009 15:54:44 +0200 (CEST)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id 1B6572A4227
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jul 2009 15:50:53 +0200 (CEST)
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Thu, 16 Jul 2009 15:50:16 +0200
Message-ID: <69E6C70090A0A14498CC98FAE5E06B6E3CF92C@hiob.intern.dresearch.de>
In-Reply-To: <h3n7jb$il3$1@ger.gmane.org>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] Baking coreutils-native-7.2-r0 fails
Thread-Index: AcoGF6uf1i6njldVSj6YPkc9lLeNIAABI5QA
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF928@hiob.intern.dresearch.de>
	<h3n7jb$il3$1@ger.gmane.org>
From: "Sledz, Steffen" <sledz@DResearch.DE>
To: <openembedded-devel@lists.openembedded.org>
Subject: Re: Baking coreutils-native-7.2-r0 fails
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
X-List-Received-Date: Thu, 16 Jul 2009 14:04:24 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> Sounds like your builddir is either on nfs or contains a symlink.

You're right. Buildir path contained a symlink.

Thx



