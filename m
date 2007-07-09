Received: from [62.169.194.61] (helo=memova2.tellas.gr)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <skoroneos@digital-opsis.com>) id 1I7lwB-0002md-LT
	for openembedded-devel@openembedded.org; Mon, 09 Jul 2007 07:37:32 +0200
Received: from dias (62.169.211.226) by memova2.tellas.gr (7.3.118.8)
	id 4638635B016A5012 for openembedded-devel@openembedded.org;
	Mon, 9 Jul 2007 07:30:55 +0200
From: "Stelios Koroneos" <skoroneos@digital-opsis.com>
To: <openembedded-devel@openembedded.org>
Date: Mon, 9 Jul 2007 08:31:53 +0300
Message-ID: <HOECLKEKOHLAMMGDLLBHOEKELJAA.skoroneos@digital-opsis.com>
MIME-Version: 1.0
X-Priority: 3 (Normal)
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook IMO, Build 9.0.2416 (9.0.2911.0)
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.3138
Importance: Normal
In-Reply-To: <46918727.60103@whitby.id.au>
Subject: Re: [RFC] Adding screen dimensions to machine configs
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
X-List-Received-Date: Mon, 09 Jul 2007 05:37:33 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

> > We can add those without adding formfactor. But what will those
> setting be for e.g. an
> > nslu2 or efika board?
>
> Since those MACHINES will not have the 'screen' machine_feature enabled,
> it doesn't really matter, does it?
>

As i see it there are 3 types of "machines"
1) Those without a screen (i.e nslu)
2) Those that can be with or without a screen (efika, a pc) depending on
configuration
3) Those with screen (all the rest) :)

The "problem" might be with those on category 2 as you can't know in advance
if they have screen or what the size of that will be.
But one could always specify these parameters later (local.conf or distro
settings)

Other than that i am also in favour of the proposued naming

Stelios S. Koroneos

Digital OPSiS - Embedded Intelligence
http://www.digital-opsis.com


> -----Original Message-----
> From: openembedded-devel-bounces@openembedded.org
> [mailto:openembedded-devel-bounces@openembedded.org]On Behalf Of
> Rod Whitby
> Sent: Monday, July 09, 2007 3:54 AM
> To: openembedded-devel@openembedded.org
> Subject: Re: [oe] [RFC] Adding screen dimensions to machine configs
>
>
> >>> MACHINE_DISPLAY_WIDTH_PIXELS=
> >>> MACHINE_DISPLAY_HEIGHT_PIXELS=
> >>>
> >>> to machine configs.
> >
> -- Rod
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>




