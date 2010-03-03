Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NmoyV-0007mW-Je
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Mar 2010 14:51:08 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o23Dm4FJ018227
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 3 Mar 2010 13:48:04 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17897-07 for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Mar 2010 13:47:49 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o23DlirE018221
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 3 Mar 2010 13:47:45 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ac9c93b11003030459h499fa3ban6f6884910ef785a@mail.gmail.com>
References: <1267616149.2259.4.camel@rex>
	<ac9c93b11003030459h499fa3ban6f6884910ef785a@mail.gmail.com>
Date: Wed, 03 Mar 2010 13:47:42 +0000
Message-ID: <1267624062.2259.58.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,BAYES_00,RDNS_DYNAMIC,
	TVD_RCVD_IP autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: TSC Meeting 2010/03/02
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
X-List-Received-Date: Wed, 03 Mar 2010 13:51:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2010-03-03 at 13:59 +0100, Frans Meulenbroeks wrote:
> 2010/3/3 Richard Purdie <rpurdie@rpsys.net>:
> > Developer Effort
> > ================
> >
> > Rather than discussions such as the above, how about injecting that
> > energy into adopting the new staging, BBCLASSEXTEND and -nativesdk code?
> 
> Ehm. there was already a similar remark in the recent pango thread
> (angstrom: sync pango and pango-native versions)
> 
> I'd say the tone in that email and in the two lines above does not
> really meet the 'be considerate" and 'be respectful' as described in
> the ubuntu code of conduct.

The wording could perhaps be better but I don't think its bad enough
that it falls foul of the CoC.

The TSC fully appreciates the work people put into OE and is just
frustrated so much energy gets lost on what amount to relatively minor
issues where there are many other things that need work.

Put things into context - is whether a variable name has the word
angstrom in the name really a massive insurmountable problem stopping
people from using OE?

> Also note that most of the work is done by
> volunteers/hobbyists/whatever you want to name them.
> I feel it is not really for the TSC (or for me) to say what others
> should do. Suggestions could be made but I think it could be worded
> more polite.

The above is simply a suggestion. The TSC in no way controls what
volunteers/hobbyists/employees/companies or anyone else working on OE
actually works on. We can make a suggestion of where we feel effort
would be well spent which is what the above states.

No matter how many policies, groups or anything else we put into place
this is an open source project which by the nature anyone is free to do
pretty much anything. This can and does lead to friction at times and
people do have strong opinions which there are no plans to censor. What
we do need to stop is the personal attack side of things. "Attacking"
someone's proposal on technical grounds is perfectly fair game IMO as
long as it has a constructive and/or reasoned basis. The one thing it
should never be is personal.

> And wrt the new staging/BBCLASSEXTEND/nativesdk topic:
> In my opinion it is useful to clean up the existing recipes (or move
> them to 'obsolete' or whatever).
> That way less recipes need to be adopted, and no energy is wasted on
> adopting legacy recipes.
> (apart from the fact that having lots of recipes for lots of variants
> does not really give a professional and mature impression).

Legacy recipes are a source of contention. We're bad at tracking who
needs them and why. There some some factions of OE who'd like to never
see any recipe deleted and there are some who feel any old recipe should
be removed.

We do have a problem in that the people who use old recipes use them as
they don't like change and the staging changes are change and hence we
either don't convert them (and hence never complete the transition we
*need* to make) or we convert them and cause those people pain anyway.

I could see a case for having a mass clear out of old recipes in OE to
get the new staging changes in. Anyone wanting old versions could either
add them back specifically (converted), make sure they were converted by
a deadline or use an older tree. Someone would have to take an effort
like that on, announce it and lead it but I suspect it could actually be
made to work. It will need some time commitment though, any
volunteers? :)

> BTW: The recipes I feel responsible for are all converted to both new
> staging and BBCLASSEXTEND.

Great, thanks for doing that!

> I have considered converting some of the others to new staging.
> Actually I even started it, but soon stopped with it for the following
> reasons:
> - the actual verification process is fairly cumbersome. (5) diff the 2
> packaged-staging recipes (which I read as packaged-staging packages as
> there are no packaged-staging recipes) is imho a pita)

It would be better to have some kind of automated way of doing this I
agree. Its technically possible, just nobody has found the time needed
to implement it. We're all volunteers as you point out.

> - i have no idea what recipes are actually used and worthwhile my effort

Ultimately its desirable to convert everything.

> - some people seem to be picky if you touch their recipes (although
> some are a lot less considerate when it comes to recipes of others :-(
> )

There are ways of handling this (RFC the patches, delay the commit for a
few days. If no answer, then make the changes).

> Together for me that has lead to the conclusion that this is work with
> low satisfaction and high chance of getting negative feedback (e.g.
> because despite your efforts something breaks, or because by accident
> you step on someones toes), and that I'd better work on something
> else.

Well, we all feel like this at times. If I took all the negative stuff I
see about my work to heart, I'd not be doing it. Hopefully people do
feel some of the things I've done are some kind of benefit to OE. I have
broken things before, I probably will again despite my best efforts but
its how you deal with these things the people ultimately judge you on.

I have yet to see a "thank you for helping set up the TSC, getting
involved in the nastiest arguments OE has and putting your neck on the
line all the time email" and don't expect one either. I doubt the e.V.
board has either but for the record I do appreciate what they do and am
trying to do my bit through the TSC.

> PS: and wrt the remark "we have been discussed this before and the
> conclusion then was...": great, but if you do not document those
> decisions they will pop up every once in a while (e.g. by someone who
> is not aware of the decision; e.g. I for me, was unaware that angstrom
> initially had its own directory).

Document where? How? Do you document the outcome of every email
discussion you have on the OE list? It was a "decision" that came about
as the result of an email discussion on this mailing list, nothing more,
nothing less. Volunteers doing this would be very welcome...

Cheers,

Richard







