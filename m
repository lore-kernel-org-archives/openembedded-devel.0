Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NY5wz-0004X5-LV
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jan 2010 23:56:35 +0100
Received: from 88-109-44-56.dynamic.dsl.as9105.com ([88.109.44.56]
	helo=[192.168.2.155])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NY5ue-0000Tu-Ua
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jan 2010 22:54:06 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hj21vd$32h$1@ger.gmane.org>
References: <1263760344-26105-1-git-send-email-eric@eukrea.com>
	<hivtt3$v2r$1@ger.gmane.org>
	<1263763723.5353.16.camel@mattotaupa.wohnung.familie-menzel.net>
	<hj09k8$km$1@ger.gmane.org>
	<1263820243.3675.560.camel@mill.internal.reciva.com>
	<1263824896.26227.112.camel@dax.rpnet.com> <hj21vd$32h$1@ger.gmane.org>
Date: Thu, 21 Jan 2010 22:53:34 +0000
Message-ID: <1264114415.457.1069.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: include default PR or not (was: [PATCH] barebox: Add recipe for this new bootloader)
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
X-List-Received-Date: Thu, 21 Jan 2010 22:56:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2010-01-18 at 17:24 +0100, Rolf Leggewie wrote:
> Richard Purdie wrote:
> > On Mon, 2010-01-18 at 13:10 +0000, Phil Blundell wrote:
> [...]
> >> only way we will get a definitive answer would be to have the TSC hand
> >> down a judgement on the matter.
> > 
> > That would seem sensible if only to lay this matter to rest once and for
> > all! It would also be good to test the TSC processes...
> 
> I would think this is too minor for the TSC to bother.  But if you want
> to take it on, why should I object?  It does take up bandwidth on this
> list from time to time, so much is true.  Personally, I don't think the
> best option would be to rule in favor of one or the other faction,
> because that's what it would be seen for.  I don't think the TSC can
> really win and resolve this issue.

I'm not entirely sure what point you are making about it being
undesirable for the TSC to "rule in favour of one or the other faction".
One of the primary roles of the TSC is to resolve or adjudicate disputes
between developers and, since such disputes are often binary issues by
their nature, it seems likely that in a lot of cases this is going to
boil down to having the TSC accept the viewpoint of one party and reject
the viewpoint of the other.  It would certainly be a shame for the TSC
to shy away from making a decision just because it might be seen to
agree with one group and disagree with another.

A large part of the reason for having the TSC in the first place was to
establish a group of people who were empowered (and, indeed, obliged) to
make decisions, and I think this is a fairly good example of a situation
where simply having a decision of some kind is more important than the
detail of what exactly that decision is.  

This particular issue is clearly somewhat trivial and, whichever
viewpoint prevails, the impact in the real world is going to be fairly
small.  But it has cropped up on this list several times now and it
seems equally clear that, so long as it remains unresolved, it will
continue to waste everybody's time and contributors will continue to be
baffled as to what exactly they should put in their patches in order to
get them applied.

p.




