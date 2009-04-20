Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1LvvOG-0006cV-Ik
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Apr 2009 17:26:37 +0200
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id 2258416DFDD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Apr 2009 17:22:32 +0200 (CEST)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id D84D82A421B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Apr 2009 17:22:17 +0200 (CEST)
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Mon, 20 Apr 2009 17:21:46 +0200
Message-ID: <69E6C70090A0A14498CC98FAE5E06B6E3CF767@hiob.intern.dresearch.de>
In-Reply-To: <20090417183927.GU17629@smtp.west.cox.net>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] initramfs howto?
Thread-Index: Acm/oKOI/3OB//LDT8anRZWUg/qdUgCKo8BA
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF763@hiob.intern.dresearch.de>
	<20090417183927.GU17629@smtp.west.cox.net>
From: "Sledz, Steffen" <sledz@DResearch.DE>
To: <openembedded-devel@lists.openembedded.org>
Subject: Re: initramfs howto?
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
X-List-Received-Date: Mon, 20 Apr 2009 15:26:39 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> I don't think that out of the box, "load some modules" can work.  The
> current initramfs stuff, if I read it right, makes use of a premade
> cpio.  It should however, be possible to fix this up, with the hardest
> part being fixing up of the dev nodes.  What follows is a=20
> hack I've done to a specific kernel's do_compile:

Would be really nice if you can send me the complete bb as an example =
(or is it in the git repo?). Some things are not fully clear to me.

> This should somehow be generalized a bit and put into kernel.bbclass,
> quite probably.

That would be a great thing! :)

Steffen


