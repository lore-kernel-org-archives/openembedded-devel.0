Received: from [62.169.194.61] (helo=memova2.tellas.gr)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <skoroneos@digital-opsis.com>) id 1IlMeC-0000F6-Up
	for openembedded-devel@openembedded.org; Fri, 26 Oct 2007 12:42:37 +0200
Received: from dias (62.169.211.226) by memova2.tellas.gr (7.3.118.8)
	id 4638635B04984C5E for openembedded-devel@openembedded.org;
	Fri, 26 Oct 2007 12:33:53 +0200
From: "Stelios Koroneos" <skoroneos@digital-opsis.com>
To: <openembedded-devel@openembedded.org>
Date: Fri, 26 Oct 2007 13:35:09 +0300
Message-ID: <HOECLKEKOHLAMMGDLLBHIEEKMKAA.skoroneos@digital-opsis.com>
MIME-Version: 1.0
X-Priority: 3 (Normal)
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook IMO, Build 9.0.2416 (9.0.2911.0)
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.3138
In-Reply-To: <471F981E.30909@linux.it>
Importance: Normal
Subject: Re: different hosts, different OE images
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
X-List-Received-Date: Fri, 26 Oct 2007 10:42:37 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Well to answer your question in a quick way
it should not be happening

We have seen from time to time differences between 32bit hosts and 64bit
hosts but not anything like the thing you mention.

Could you prvide some additional info (what distro, machine, host tools
versions etc)

Stelios S. Koroneos

Digital OPSiS - Embedded Intelligence
http://www.digital-opsis.com


> -----Original Message-----
> From: openembedded-devel-bounces@openembedded.org
> [mailto:openembedded-devel-bounces@openembedded.org]On Behalf Of
> Filippo Basso
> Sent: Wednesday, October 24, 2007 10:08 PM
> To: openembedded-devel@openembedded.org
> Subject: Re: [oe] different hosts, different OE images
>
>
> Hi,
>     can someone tell me if this is an important point, or if I'm just
> missing something ?!?
> I've seen that 3 host machines (with different linux distros) gave me 3
> different OE results (for i586), one is okay, one is not compiling, one
> the image has a big problem at login...
>
> I want to investigate a bit, some hints ? Just a starting point.....
> I think that one of the most important points of OE is that is largely
> independent of host machine, right?!?
>     thank you, phy
>
>
>
>
>
> >> I understood that the results should be highly independent from host
> >> system, so I begun debugging a bit.
> >>
> >>
> > Hi everybody,
> >     my investigation is going ahead...
> > The main point is: an image should be highly independent from the host
> > system, but seems that I've some problem in this regards... maybe my
> > mistake, but should be understood.
> >
> > Another machine (Ubuntu) gave even another different runtime
> result... :-(
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>




