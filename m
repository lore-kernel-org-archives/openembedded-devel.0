Received: from [62.169.194.61] (helo=memova2.tellas.gr)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <skoroneos@digital-opsis.com>) id 1Hns7F-0003CW-6e
	for openembedded-devel@openembedded.org; Tue, 15 May 2007 10:10:42 +0200
Received: from dias (62.169.211.226) by memova2.tellas.gr (7.3.118.8)
	id 4638635B0036F202 for openembedded-devel@openembedded.org;
	Tue, 15 May 2007 10:09:33 +0200
From: "Stelios Koroneos" <skoroneos@digital-opsis.com>
To: <openembedded-devel@openembedded.org>
Date: Tue, 15 May 2007 11:10:29 +0300
Message-ID: <HOECLKEKOHLAMMGDLLBHGEIBLAAA.skoroneos@digital-opsis.com>
MIME-Version: 1.0
X-Priority: 3 (Normal)
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook IMO, Build 9.0.2416 (9.0.2911.0)
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.3028
In-Reply-To: <f277n0$i00$2@sea.gmane.org>
Importance: Normal
Subject: Re: minimal-image.bb
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
X-List-Received-Date: Tue, 15 May 2007 08:10:50 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

> -----Original Message-----
> From: openembedded-devel-bounces@openembedded.org
> [mailto:openembedded-devel-bounces@openembedded.org]On Behalf Of
> Rolf Leggewie
> Sent: Sunday, May 13, 2007 5:35 PM
> To: openembedded-devel@openembedded.org
> Subject: Re: [oe] minimal-image.bb
>
>
> Stelios Koroneos wrote:
> > In my opinion if angstrom-minimal-image is not distro specific should be
> > renamed to minimal-image
>
> I agree with Stelios that the belief that angstrom-minimal-image is a
> distro-specific image is a reasonable assumption.  If that is not the
> case, I am in favor renaming.


There is a bigger issue here than the name of package and that the reason i
brought this matter up.
Angstrom without any dough is the biggest distro supported by OE, but its
not the only one.
No one should also dough that Koen has done a lot of work (and is still
doing) and credits should go to him for a lot of the things in OE, including
the angstrom-minimal-image.bb, but i believe the real issue goes beyond the
developer/distro thing.

Actions like that, give the wrong signals to the people who are looking at
OE for incorporation/support of their products(and believe me there are
*alot* that do that as we speak)
If a distro maintainer (or any OE developer in that fact) comes with a way
of handling things better for his distro that could be used as a generic
framework for others it should be done so and not discouraged.

I am firm believer in community work and that things that could benefit the
OE community should be handled as such and not as distro-specific.





