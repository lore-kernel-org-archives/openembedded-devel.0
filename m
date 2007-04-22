Received: from [62.169.194.2] (helo=fesscrpp1.tellas.gr)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <skoroneos@digital-opsis.com>) id 1Hfid5-0007Hc-MC
	for openembedded-devel@openembedded.org; Sun, 22 Apr 2007 22:25:51 +0200
Received: from dias (62.169.211.226) by fesscrpp1.tellas.gr (7.3.117)
	id 462338C400107F52 for openembedded-devel@openembedded.org;
	Sun, 22 Apr 2007 23:04:11 +0300
From: "Stelios Koroneos" <skoroneos@digital-opsis.com>
To: "Using the OpenEmbedded metadata to build Distributions"
	<openembedded-devel@openembedded.org>
Date: Sun, 22 Apr 2007 23:05:04 +0300
Message-ID: <HOECLKEKOHLAMMGDLLBHAEOAKMAA.skoroneos@digital-opsis.com>
MIME-Version: 1.0
X-Priority: 3 (Normal)
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook IMO, Build 9.0.2416 (9.0.2911.0)
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.3028
In-Reply-To: <HOECLKEKOHLAMMGDLLBHOENHKLAA.skoroneos@digital-opsis.com>
Importance: Normal
Subject: Re: RFC: U-Boot package clean up
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
X-List-Received-Date: Sun, 22 Apr 2007 20:25:52 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

An update on that.

I have added a new powerpc machine (actually its for 2 boards) that is using
uboot 1.1.2 as the bootloader
I have contacted the board makers if they plan to switch to a newer version
of uboot but the reply was that there was no time to do it at this stage.
So i would suggest to keep 1.1.2 also.
I hope to find some free time and patch a more recent uboot for the specific
the boards but currently i have no firm timetable on that

Stelios S. Koroneos

Digital OPSiS - Embedded Inteligence
http://www.digital-opsis.com


> -----Original Message-----
> From: openembedded-devel-bounces@openembedded.org
> [mailto:openembedded-devel-bounces@openembedded.org]On Behalf Of
> Stelios Koroneos
> Sent: Monday, April 16, 2007 9:09 AM
> To: openembedded-devel@openembedded.org
> Subject: Re: [oe] RFC: U-Boot package clean up
>
>
> dht-walnut is also using 1.1.4 so here is another vote to stay
>
> Stelios S. Koroneos
>
> Digital OPSiS - Embedded Inteligence
> http://www.digital-opsis.com
>
>
> > -----Original Message-----
> > From: openembedded-devel-bounces@openembedded.org
> > [mailto:openembedded-devel-bounces@openembedded.org]On Behalf Of
> > Florian Boor
> > Sent: Friday, April 13, 2007 2:50 AM
> > To: openembedded-devel@openembedded.org
> > Cc: openembedded-devel@openembedded.org
> > Subject: Re: [oe] RFC: U-Boot package clean up
> >
> >
> > Hi,
> >
> > Vitus Jensen wrote:
> > > We are using u-boot 1.1.4 on our devices.  So if it's not too
> > much hassle I
> >
> > I would vote for keeping 1.1.4 as well, it seems to be still
> > quite popular.
> >
> > Greetings
> >
> > Florian
> >
> > --
> > The dream of yesterday                  Florian Boor
> > is the hope of today                    Tel: +49 271-771091-14
> > and the reality of tomorrow.            Fax: +49 271-771091-19
> > [Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de
> >
> > 1D78 2D4D 6C53 1CA4 5588  D07B A8E7 940C 25B7 9A76
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>




