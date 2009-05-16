Received: from [93.97.173.237] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1M5GcV-0002xq-DB
	for openembedded-devel@openembedded.org; Sat, 16 May 2009 11:55:55 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n4G9mqs5018584
	for <openembedded-devel@openembedded.org>;
	Sat, 16 May 2009 10:48:52 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18117-08 for <openembedded-devel@openembedded.org>;
	Sat, 16 May 2009 10:48:48 +0100 (BST)
Received: from [192.168.1.30] (dynamic0.rpnet.com [192.168.1.30])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n4G9mkTv018578
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Sat, 16 May 2009 10:48:46 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <200905160037.25213.mickey@vanille-media.de>
References: <f96d234e0904300544g4f933c15x1abaa430373868fa@mail.gmail.com>
	<4A0DBCAC.5000403@balister.org>
	<1242424484.4514.117.camel@lenovo.internal.reciva.com>
	<200905160037.25213.mickey@vanille-media.de>
Date: Sat, 16 May 2009 10:48:44 +0100
Message-Id: <1242467324.5206.35.camel@ted>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: progress on OE organization issues
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
X-List-Received-Date: Sat, 16 May 2009 09:55:55 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2009-05-16 at 00:37 +0200, Michael 'Mickey' Lauer wrote:
> I agree with pb's suggestion here. In fact some days ago I talked to RP about 
> the state of OE and me, the failure of the original coreteam, the e.V. etc.

Its worth trying to work out what "failed" with the coreteam.
Personally, I was unaware there was actually a problem until too late,
despite being a member of said team so that puts communication issues on
the list. I think other factors were:

* Lack of transparency. This was *not* intentional and people should
understand that. People wanted vendors to be able to talk to people
representing "OE" with some degree of privacy hence the existence of a
private mailing list. Associating it with the core team was was a
spectacular failure in hindsight. I can still see a role for some form
of non-public contact being useful but I'd like to see a small panel of
people elected to a team which specifically handles this.

* Unelected board. The core team was created from the people active on
the project at the time, trying to reflect a diverse spectrum of the
users but it was self elected. I'd like to see the wider OE userbase
decide who was on any team in future.

* Communication. With all the patches flowing through the OE list its no
longer possible to be able to easily recognise important technical
direction threads compared to more trivial issues. At the very least we
need some kind of documenting about when the technical board gets
involved in something. In the existing coreteam, we managed to agree a
decision process but we never wrote down at what point a decision had to
be made.

> My view on that is: The ideal situation would be that everyone interested in 
> OE -- no matter on which level, technically, supportive, or administrative, 
> becomes a member of the e.V.  This is relatively straightforward and does not 
> require any financial commitments per se as our status include that a member 
> can chose its own membership fee.

This seems to be the way the e.V. is designed to work and looks like a
good plan to me.

> The e.V. (remember, this should now include all stakeholders, so everyone who 
> is interested in OE is allowed to vote -- not only the committers, but also 
> the bug wizards, doc folks, etc.) then votes two boards, an administrative and 
> a technical.
> 
> A) The administrative one takes care about the legal status, donations, taxes, 
> granting access to servers, etc. This one we have already voted on our initial 
> meeting in Brussels. It consists of 4 positions. For this year it consists of 
> Florian, Robert, Holger, and me -- at least until the next elections...

I agree with this although I'd consider an odd number of people in
future. 

Are people on this board just making decisions or actually implementing
them as well? I worry about the number of people who can actually do
legal/financial things in Germany not least due to language skills.

> B) The technical one is probably more interesting to most people on the list 
> here. The technical board is responsible for keeping the project on track as a 
> whole, helping us staying focused, improving BitBake and OpenEmbedded, trying 
> to recruit more committers, and -- most important to me due to the recent 
> series of events -- resolving conflicts.
> This one should contain 7 positions, preferably filled with people having 
> different areas of expertise, e.g. toolchain, system level stuff, higher level 
> stuff, multimedia, mobile, etc.

I'd also like to see new and older developers both represented on the
board.

Using myself as an example, I've not been very active in the OE world in
the past few months. This doesn't mean I'm not interested in OE anymore,
far from it. If anyone had come to the coreteam asking for help with an
issue, I would have made time to look into that and act on it and that
is what I was expecting to happen.

I have what I'd hope are some valuable contributions I can make to OE
technical decisions since I know details of the deep inner workings,
have some idea why things are as they are and have experience of
improving OE, sometimes in invasive ways meaning I know what works and
what causes problems. I'd really like to provide these contributions to
the project but I don't know where in the structure I can do that? In a
board of 5 or 7 people, is there room for the various people with
experiences who still wish to help the project but also allowing new
blood in and leaving room for the people who are more active on the
project currently?

> All votes and discussions would be open and carried out on public mailing 
> lists, wiki, etc. oe-private would be closed for good, since what we need most 
> is transparency.
> 
> If we can pull such an organization off, I'd be willing to run for a position. 

Me too, but we need to make sure the organisation that results is
actually going to work. Is one technical board going to work and how
many people are on it are key questions...

Cheers,

Richard



