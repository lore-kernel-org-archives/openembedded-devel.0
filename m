Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpurdie@rpsys.net>) id 1PhUQj-0005h3-Gs
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Jan 2011 22:58:33 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p0OLvmv9005798
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jan 2011 21:57:48 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02770-10 for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jan 2011 21:57:44 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p0OLvfOh005788
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jan 2011 21:57:42 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ihkrpo$uft$1@dough.gmane.org>
References: <4D36F9BE.1010601@xora.org.uk> <4D3DAB2A.3070303@balister.org>
	<ihkrpo$uft$1@dough.gmane.org>
Date: Mon, 24 Jan 2011 21:57:28 +0000
Message-ID: <1295906248.14388.46605.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: openembedded-core git repository
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
X-List-Received-Date: Mon, 24 Jan 2011 21:58:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-01-24 at 22:43 +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 24-01-11 17:39, Philip Balister wrote:
> > On 01/19/2011 06:48 AM, Graeme Gregory wrote:
> >> Hi, this email is sent as an ordinary member of OE.
> >>
> >> It seems to be on a technical level we are agreed that we should split
> >> parts of OE out into the so called openembedded-core which will have a
> >> stricter commit access and higher QA requirements on changes.
> >>
> >> I therefore think it is time to actually create the repository and let
> >> the people who are interested in merging the good stuff from poky with
> >> the good stuff from openembedded to create our "core". I don't think
> >> there is any need to wait on the political part of the Yocto/OE
> >> collaboration as its something we have agreed in principal to do anyway.
> >>
> >> I would request then that the TSC drive this forward with the server
> >> admins and create this repo so work can happen.
> > 
> > 
> > Has anything happened on this email? Has the TSC had a meeting to
> > discuss? I know it has only been a week, but people are starting to do
> > work based on these ideas and need some support from the TSC.
> 
> At this point I'm going to call for a vote of non confidence in the TSC.
> If they can't be bothered to speak up in an important matter like this,
> we'd be better of without them.

I've kept a low profile on this issue since I'm obviously heavily
involved with Yocto and hence it could be argued I'm not impartial. I
had hoped someone else on the TSC would therefore pick up this
discussion but that hasn't happened. I have driven issues in the past,
this is one I really can't drive alone.

The TSC have been having trouble managing to organise meetings,
organising minutes and have not been very responsive recently. There are
a whole spectrum of reasons for that but at a time when OE really needs
technical guidance this is a problem.

The message here isn't to the oe-members list in the correct form so
this isn't an official vote at this time but if it were, I think I'd
find myself in the unusual position of voting in favour of a vote of no
confidence for a group I'm actually part of :/.

I'd actually like to see people with the technical understanding and
time to spend help guiding OE such Koen and Khem on the TSC.

Cheers,

Richard



