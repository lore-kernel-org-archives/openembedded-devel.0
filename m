Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NmpbO-0004oO-Jj
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Mar 2010 15:31:11 +0100
Received: by gwj17 with SMTP id 17so619456gwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Mar 2010 06:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=zCcXfJUePO63vnvMycKeiJi1pUg5/hxDh/B6OhaqfPA=;
	b=ZtBAbLxrpaJVP1tEKAHJXZqHq/ci+SNgigv7Aq3QRvr207Dz17kLVFafXfnpAlSQ9U
	lFBCV7MYPyNQmrOtSJ0iM4fZ81Gzt/0kZUl+KdMcruswKRBbVfD/s/lKS8gm4xP5b0iv
	qsd8ENgF3rnf7Q8MaurosdkKN9gI5/wOZ5ih8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=kHYkLJeb0YfGGN9CZ71Ux9KNRSjSGBvNGtq/NkcU5hAT+BXooKHh9zkYUgVEYxClqP
	Xvcjl3qmfVNbs8r+A13LmiF53OTHrGeuOfLkCs1TKlv3uy/lvncRA3GbOyQ+tL7xg2rc
	YMaBC1dlL7u/oXx2G4hugp9RCi+bwr6GUXjmY=
MIME-Version: 1.0
Received: by 10.101.206.1 with SMTP id i1mr2363797anq.80.1267626494675; Wed, 
	03 Mar 2010 06:28:14 -0800 (PST)
In-Reply-To: <1267624062.2259.58.camel@rex>
References: <1267616149.2259.4.camel@rex>
	<ac9c93b11003030459h499fa3ban6f6884910ef785a@mail.gmail.com>
	<1267624062.2259.58.camel@rex>
Date: Wed, 3 Mar 2010 15:28:14 +0100
Message-ID: <ac9c93b11003030628n357a820elede742097eafee42@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
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
X-List-Received-Date: Wed, 03 Mar 2010 14:31:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/3/3 Richard Purdie <rpurdie@rpsys.net>:
> On Wed, 2010-03-03 at 13:59 +0100, Frans Meulenbroeks wrote:
>> 2010/3/3 Richard Purdie <rpurdie@rpsys.net>:
>> > Developer Effort
>> > ================
>> >
>> > Rather than discussions such as the above, how about injecting that
>> > energy into adopting the new staging, BBCLASSEXTEND and -nativesdk code?
>>
>> Ehm. there was already a similar remark in the recent pango thread
>> (angstrom: sync pango and pango-native versions)
>>
>> I'd say the tone in that email and in the two lines above does not
>> really meet the 'be considerate" and 'be respectful' as described in
>> the ubuntu code of conduct.
>
> The wording could perhaps be better but I don't think its bad enough
> that it falls foul of the CoC.

For the wording above I agree.
The message in the pango thread, I felt as a snide remark directed
directly to me (as I initiated the discussions).
>
> The TSC fully appreciates the work people put into OE and is just
> frustrated so much energy gets lost on what amount to relatively minor
> issues where there are many other things that need work.
>
> Put things into context - is whether a variable name has the word
> angstrom in the name really a massive insurmountable problem stopping
> people from using OE?

I have not too much problems with the variable name as is.
My intention was sincere and I felt that I was just following the procedure.
Then someone started to claim that as author of the recipe he was not
consulted and claimed he had the final say in it.
Fine with me, but then please make clear what recipes you "own" and
move them out of the common area.
>
>> Also note that most of the work is done by
>> volunteers/hobbyists/whatever you want to name them.
>> I feel it is not really for the TSC (or for me) to say what others
>> should do. Suggestions could be made but I think it could be worded
>> more polite.
>
> The above is simply a suggestion. The TSC in no way controls what
> volunteers/hobbyists/employees/companies or anyone else working on OE
> actually works on. We can make a suggestion of where we feel effort
> would be well spent which is what the above states.
>
> No matter how many policies, groups or anything else we put into place
> this is an open source project which by the nature anyone is free to do
> pretty much anything. This can and does lead to friction at times and
> people do have strong opinions which there are no plans to censor. What
> we do need to stop is the personal attack side of things. "Attacking"
> someone's proposal on technical grounds is perfectly fair game IMO as
> long as it has a constructive and/or reasoned basis. The one thing it
> should never be is personal.

I fully agree.
However this is a community project so I find statements like
"If you're touching a recipe at least make sure the creator/maintainer
agrees with your changes"
like happened in a recent commit somewhat against the open source policy.

And *if* we feel that creators/maintainers have a final say here, then
I'd suggest to list the name in the recipe.
Git log is only partially accurate due to the move from mtn to git and
the rename from packages to recipes.
>
>> And wrt the new staging/BBCLASSEXTEND/nativesdk topic:
>> In my opinion it is useful to clean up the existing recipes (or move
>> them to 'obsolete' or whatever).
>> That way less recipes need to be adopted, and no energy is wasted on
>> adopting legacy recipes.
>> (apart from the fact that having lots of recipes for lots of variants
>> does not really give a professional and mature impression).
>
> Legacy recipes are a source of contention. We're bad at tracking who
> needs them and why. There some some factions of OE who'd like to never
> see any recipe deleted and there are some who feel any old recipe should
> be removed.
>
> We do have a problem in that the people who use old recipes use them as
> they don't like change and the staging changes are change and hence we
> either don't convert them (and hence never complete the transition we
> *need* to make) or we convert them and cause those people pain anyway.
>
> I could see a case for having a mass clear out of old recipes in OE to
> get the new staging changes in. Anyone wanting old versions could either
> add them back specifically (converted), make sure they were converted by
> a deadline or use an older tree. Someone would have to take an effort
> like that on, announce it and lead it but I suspect it could actually be
> made to work. It will need some time commitment though, any
> volunteers? :)

I'm more than happy on converting some stuff.
And wrt the old recipes. Note that in the glib case I investigated
which ones were actually needed and proposed only to remove the ones
which were not used by any recipe or distro. (and ofc someone can have
a local overlay, then he/she takes a risk and probably should keep a
local copy and/or stick to a specific snapshot).

I am also all in favour of the suggestion from Otavio. The dev head
should use the latest version where possible. If you need stability
use the stable branch.
>
>> BTW: The recipes I feel responsible for are all converted to both new
>> staging and BBCLASSEXTEND.
>
> Great, thanks for doing that!
>
>> I have considered converting some of the others to new staging.
>> Actually I even started it, but soon stopped with it for the following
>> reasons:
>> - the actual verification process is fairly cumbersome. (5) diff the 2
>> packaged-staging recipes (which I read as packaged-staging packages as
>> there are no packaged-staging recipes) is imho a pita)
>
> It would be better to have some kind of automated way of doing this I
> agree. Its technically possible, just nobody has found the time needed
> to implement it. We're all volunteers as you point out.
>
>> - i have no idea what recipes are actually used and worthwhile my effort
>
> Ultimately its desirable to convert everything.

I beg to disagree. Converting legacy recipes seems pointless, and
converting recipes that are not touched for ages and that do not
appear in any image also might be less useful. But that is my opinion.
>
>> - some people seem to be picky if you touch their recipes (although
>> some are a lot less considerate when it comes to recipes of others :-(
>> )
>
> There are ways of handling this (RFC the patches, delay the commit for a
> few days. If no answer, then make the changes).

Agree (but on the other hand that makes it even more work).
I feel we should also have some mutual respect, and assume people do
things in good faith.
>
>> Together for me that has lead to the conclusion that this is work with
>> low satisfaction and high chance of getting negative feedback (e.g.
>> because despite your efforts something breaks, or because by accident
>> you step on someones toes), and that I'd better work on something
>> else.
>
> Well, we all feel like this at times. If I took all the negative stuff I
> see about my work to heart, I'd not be doing it. Hopefully people do
> feel some of the things I've done are some kind of benefit to OE. I have
> broken things before, I probably will again despite my best efforts but
> its how you deal with these things the people ultimately judge you on.
>
> I have yet to see a "thank you for helping set up the TSC, getting
> involved in the nastiest arguments OE has and putting your neck on the
> line all the time email" and don't expect one either. I doubt the e.V.
> board has either but for the record I do appreciate what they do and am
> trying to do my bit through the TSC.

Well then let me say a big thank you on what you did for OE.
It is indeed rarely said, but it is definitely appreciated!
>
>> PS: and wrt the remark "we have been discussed this before and the
>> conclusion then was...": great, but if you do not document those
>> decisions they will pop up every once in a while (e.g. by someone who
>> is not aware of the decision; e.g. I for me, was unaware that angstrom
>> initially had its own directory).
>
> Document where? How? Do you document the outcome of every email
> discussion you have on the OE list? It was a "decision" that came about
> as the result of an email discussion on this mailing list, nothing more,
> nothing less. Volunteers doing this would be very welcome...

I guess some of the things (like our way of working) could be
documented in the wiki.
And before you ask: sorry, no volunteer here. There are just too many
conflicting opinions outside & I feel I've opened enough cans of worms
recently.
>
> Cheers,
>
> Richard

Best regards, Frans


