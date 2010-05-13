Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1OCcw1-00080B-MT
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 May 2010 20:15:03 +0200
Received: from cpe00142a336e11-cm001ac318e826.cpe.net.cable.rogers.com
	([174.113.191.234] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1OCcsE-000074-4c for openembedded-devel@lists.openembedded.org;
	Thu, 13 May 2010 14:11:06 -0400
Date: Thu, 13 May 2010 14:11:00 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@lynx
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTikmU6fbniORwgp86_hFk9khRLDsG5BllWGVtYm8@mail.gmail.com>
Message-ID: <alpine.DEB.2.00.1005131410190.6415@lynx>
References: <alpine.DEB.2.00.1005131147350.2007@lynx>
	<4BEC241A.2090802@eukrea.com>
	<alpine.DEB.2.00.1005131212200.11789@lynx>
	<AANLkTikmU6fbniORwgp86_hFk9khRLDsG5BllWGVtYm8@mail.gmail.com>
User-Agent: Alpine 2.00 (DEB 1167 2008-08-23)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 64.235.106.9
X-SA-Exim-Mail-From: rpjday@crashcourse.ca
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: chance to document entire OE setup on ubuntu 10.04
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
X-List-Received-Date: Thu, 13 May 2010 18:15:03 -0000
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-804528964-1273774266=:6415"

--8323329-804528964-1273774266=:6415
Content-Type: TEXT/PLAIN; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 13 May 2010, Khem Raj wrote:

> On Thu, May 13, 2010 at 9:13 AM, Robert P. J. Day <rpjday@crashcourse.ca>=
 wrote:
> > On Thu, 13 May 2010, Eric B?nard wrote:
> >
> >> Le 13/05/2010 17:53, Robert P. J. Day a ?crit :
> >> >
> >> > =A0 =A0while this sounds decidedly unsexy, given that i'm just
> >> > getting into ubuntu 10.04, i have the chance to document every
> >> > step it takes to setup OE on a fresh, default 10.04 install,
> >> > including what packages are *actually* required since i suspect
> >> > some of the ones currently listed aren't technically necessary.
> >> >
> >> I tested yesterday on a 10.04 and vs the actual wiki, I think
> >> chrpath is missing from the list of what is required.
>
> this is a newly created dependency probably hasn't made into
> documents yet but sanity should complain about it if its missing.

  it does, that's the only reason i was aware i needed to install it
on my freshly-installed system.

rday

--=20

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

--8323329-804528964-1273774266=:6415--
