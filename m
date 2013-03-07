Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UDd2W-0001hM-6G for openembedded-devel@lists.openembedded.org;
	Thu, 07 Mar 2013 16:47:31 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r27FcvEI030617; Thu, 7 Mar 2013 15:38:57 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id jUMSoqdZhoZl; Thu,  7 Mar 2013 15:38:57 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r27FcnGF030604
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 7 Mar 2013 15:38:52 GMT
Message-ID: <1362670239.9443.97.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 07 Mar 2013 15:30:39 +0000
In-Reply-To: <E780D109-3D15-488F-8CC9-F6829BEE90F1@dominion.thruhere.net>
References: <1362649839-9160-1-git-send-email-koen@dominion.thruhere.net>
	<1362649839-9160-3-git-send-email-koen@dominion.thruhere.net>
	<CAGiJk9fvW_5jNScu23YvC81i-R481ykNMRaj8aHM92etym8m1g@mail.gmail.com>
	<20130307130435.GI32228@jama.dyndns-home.com>
	<E780D109-3D15-488F-8CC9-F6829BEE90F1@dominion.thruhere.net>
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [meta-kde][PATCH 3/3] README: update contributor list
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
X-List-Received-Date: Thu, 07 Mar 2013 15:48:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-03-07 at 15:03 +0100, Koen Kooi wrote:
> Op 7 mrt. 2013, om 14:04 heeft Martin Jansa <martin.jansa@gmail.com> het volgende geschreven:
> 
> > On Thu, Mar 07, 2013 at 01:09:38PM +0100, Samuel Stirtzel wrote:
> >> 2013/3/7 Koen Kooi <koen@dominion.thruhere.net>:
> >>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> >>> ---
> >>> README | 2 +-
> >>> 1 file changed, 1 insertion(+), 1 deletion(-)
> >>> 
> >>> diff --git a/README b/README
> >>> index 0635e10..cab1e21 100644
> >>> --- a/README
> >>> +++ b/README
> >>> @@ -10,7 +10,7 @@ Samuel Stirtzel <s.stirtzel@googlemail.com>
> >>> Contributors:
> >>> Copyright 2012 - Kai Kang
> >>> Copyright 2013 - Khem Raj
> >>> -Copyright 2012 - Koen Kooi
> >>> +Copyright 2012, 2013 - Koen Kooi
> >>> Copyright 2012 - Robert Yang
> >>> Copyright 2011, 2012 - Samuel Stirtzel
> >>> 
> >>> --
> >>> 1.8.1.4
> >>> 
> >> 
> >> Thanks for your patches,
> >> I applied them all.
> >> 
> >> 
> >> Unrelated to your patches:
> >> There are some upcoming changes, but they don't fit into yocto 1.4
> >> (assumed that yocto is the orientation point for third-party OE-layer
> >> releases).
> >> So there will be a yocto-1.4 branch in advance and the development
> >> will continue on master.
> > 
> > It would be nice to know yocto-1.4 release name in advance and name it
> > the same as branch in oe-core/meta-oe will be (denzil, danny, ...), but
> > I guess it can be renamed later.
> 
> For angstrom I'm going to use 'yocto-1.4' in the branch name, I have
> trouble remembering which names maps to which release. And the Yocto
> compliance program talks about 1.3, .14 etc, not about codenames.

That is just going to cause even more confusion. That branch is for
Angstrom 1.4, right?

It was never intended to inflict any specific version onto any specific
project which is why the names are versionless. We do need to show what
is compatible with what hence the codenames. I've long since decided
this is a topic there is no one right answer to though so we'll just
have to live with where we are and make the most of it. I've sent out
emails about this before too.

If we need to know the name of the branch more in advance, that is
straight forward to arrange, I just need to pick the next one.

Cheers,

Richard






