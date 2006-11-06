Received: from [89.149.200.90] (helo=mail.kynisk.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <repvik@kynisk.com>) id 1Gh619-0002ci-7f
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Nov 2006 16:04:07 +0100
Received: from localhost (mail.kynisk.com [89.149.200.90])
	by mail.kynisk.com (Postfix) with ESMTP id D2F449A9EB
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Nov 2006 16:02:44 +0100 (CET)
MIME-Version: 1.0
Date: Mon, 6 Nov 2006 16:02:43 +0100
From: =?ISO-8859-1?Q?=C3=98yvind?= Repvik <repvik@kynisk.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: 454EEA21.7050108@dominion.kabel.utwente.nl
Message-ID: <38b0b82df67844c51f0670adaa5be8a1@mail.kynisk.com>
X-Sender: repvik@kynisk.com
User-Agent: RoundCube Webmail/0.1-20051021
Subject: Re: [RFC] New MACHINE_FEATURe: 'screen'
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Nov 2006 15:04:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit



On Mon, 06 Nov 2006 08:54:09 +0100, Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Hi,
> 
> I was building an Ångström bootstrap image for my loft[1]
> and noticed it was building
> psplash. Since the loft lacks support for graphical output (except usb-vga
> adaptors), it
> would be nice to leave out stuff like bootsplashes. What do you think
> about adding
> 'screen' to MACHINE_FEATURES?
> 

I think it is a good idea, considering the available devices that does not have screen (eg. dsmg600, nas100d, nslu2, n2100)

Regards,
Øyvind




