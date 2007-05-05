Received: from [89.149.220.217] (helo=mail.kynisk.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <repvik@kynisk.com>) id 1HkKaW-00006N-GT
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 May 2007 15:46:16 +0200
Received: from ximinez-laptop (44.84-48-58.nextgentel.com [84.48.58.44])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.kynisk.com (Postfix) with ESMTP id E4DC51BF27D
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  5 May 2007 15:46:10 +0200 (CEST)
From: =?iso-8859-1?q?=D8yvind_Repvik?= <repvik@kynisk.com>
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
Date: Sat, 5 May 2007 15:46:45 +0200
User-Agent: KMail/1.9.6
References: <002a01c78e37$9d165360$38f21b9d@kai>
	<c384c5ea0705050535i1c13cc5ase333da9be4d6cf8e@mail.gmail.com>
In-Reply-To: <c384c5ea0705050535i1c13cc5ase333da9be4d6cf8e@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200705051546.46019.repvik@kynisk.com>
Subject: Re: OE on Kontron eb425
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 05 May 2007 13:46:16 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Saturday 05 May 2007 14:35:22 Leon Woestenberg wrote:
> Hello Stefano,
>
> On 5/4/07, Stefano Cailotto <cailotto@sci.univr.it> wrote:
> > Hi all,
> > I'm trying to build something usable for a kontron eb425 board, based on
> > an intel ixp425.
> > I tried to compile using a generic ixp4xxbe, but when loading, the kern=
el
> > stops after uncompressing reporting a CRC error.
> > It seems that Kontron EmbeddedLinux development kit performs something =
on
> > the kernel before making zImage in order to load it in a specifed memory
> > location.
>
> There are some IXP42x users on OE, mostly for the NSLU device from
> Linksys/Cisco, the Intel dev board (IXDP425) and some custom boards,
> but I have not see the Kontron board yet.
>
> With the reported problem, it would help if you understand or at least
> could tell where to find the details on the boot loader.

A very important detail is which MACH ID the bootloader passes via ATAG.

Regards,
=D8yvind


