Received: from [209.85.134.187] (helo=mu-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <shanevolpe@gmail.com>) id 1KJujE-0005hi-Th
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Jul 2008 20:30:52 +0200
Received: by mu-out-0910.google.com with SMTP id g7so540212muf.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jul 2008 11:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:cc:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=DHfD5GSq3RTZvsS97LXDYQBh/QNlNM8ewBxRoAnFY5M=;
	b=ggy1+cg5WMhZg/dk0brBc3j1T5gWR0KohXXFb5g9Tdi2Nz1bP8zh/ZXtgZA4LEu1/2
	6F8hMN2Ri1Kf27O1sWSXof7CmdbL+QPrtCAAl5VT0EaCFGhVAzTRMdSz4niaTr+XrSGu
	D2RkvmeP6NkNIhkjxpB5RYDj5NziMCLD7JDVQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:cc:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=Q7cMSNf1kXpqZBZdpX34FsF2ZOt/GJLjT3DOWqXmze61rc3my7BVkQc9Sf9aFdhGMX
	LNr24QcXbYDcaLZUquW/gkZIE5IQaW6b1VTTsBa6cbjB5j3Z8ywcSavPIRM0WKwmULkY
	c4k897VeW6si5aAJI8VkTnaq7KhaXoEfrrNco=
Received: by 10.103.137.5 with SMTP id p5mr356302mun.114.1216405802855;
	Fri, 18 Jul 2008 11:30:02 -0700 (PDT)
Received: by 10.103.225.18 with HTTP; Fri, 18 Jul 2008 11:30:02 -0700 (PDT)
Message-ID: <8c7950360807181130k23859b50s7e8768608d509d3@mail.gmail.com>
Date: Fri, 18 Jul 2008 14:30:02 -0400
From: "Shane Volpe" <shanevolpe@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1216115118.5345.30.camel@dax.rpnet.com>
MIME-Version: 1.0
References: <1213345201.13942.3.camel@dax.rpnet.com>
	<g5fge0$e5$1@ger.gmane.org> <g5g7io$mu3$1@ger.gmane.org>
	<g5gn7j$es4$2@ger.gmane.org> <1216115118.5345.30.camel@dax.rpnet.com>
Cc: openembedded-devel@openembedded.org
Subject: Re: Core team (was: Switching SCM to git and commit/review policy)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Fri, 18 Jul 2008 18:30:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

For what its worth, I think projects do much better with a core team.
It seems projects that try to appease to everyone all the time never
make much progress.  I'm not even close to being part of the core team
and I feel any view point I have had in the past has been listened to,
wether it was IRC conversations or email posts.  Quite a few times it
has been the *core* members responding to my concerns and or
questions.  I have been involved with several open source projects and
I think OE is one of the better run ones and has the most interaction
between the core developers and all other developers.
Regards,
Shane
irc: svolpe: the one with a bad network connection and always drops on/off :-)

On Tue, Jul 15, 2008 at 5:45 AM, Richard Purdie <rpurdie@rpsys.net> wrote:
> On Tue, 2008-07-15 at 01:24 +0200, Rolf Leggewie wrote:
>> Well, after this dragged on for well over half a year now and things got
>> stalled several times this was not the kind of response I was expecting.
>>  But I'll gladly pick up the ball you passed here to ask a more general
>> question or raise a more general concern I've been having lately.
>
> Several of us feel bad that this has dragged on. There are various
> reasons for that with no one thing or person being responsible. We were
> kind of hoping the OE e.V. would solve some of the problems but whilst
> that is moving forwards its not going to happen soon enough so we're
> trying to move the SCM issue forwards without it. There are also large
> time pressures on the people involved. Personally, I know I'm at risk of
> totally cracking up if I try and do too much at once so I'm moving
> slowly. I'd prefer to do that than totally burn out, sorry ;-).
>
>> Quite frankly, as of late, when it comes to OE governance, I've been
>> uneasy a lot.  For one, there's this ominous group of OE core that does
>> a lot of things behind closed doors.
>
> Firstly, there isn't that much discussion "behind closed doors". Some
> discussion did happen there simply because we couldn't reach a consensus
> on the -devel mailing list but there has been much less that you
> probably think, see the time issues mentioned above.
>
> The results of that discussion have been made clear - we want to switch
> to git, that is unanimous. The question is what kind of commit policy
> goes with the change. Even reaching that much of a decision is a major
> step forwards but we need to finish things off.
>
>> It is not completely clear when
>> and why it was established, why the communication is not open, who is a
>> member and how it relates to ordinary members of the community.  Is OE
>> still an open project?  Is anybody outside core just a little-valued
>> monkey from which we gladly take code but leave out of any kind of
>> steering decision?
>
> For the record, as I understand it, the OE core team consists of:
>
>  - Holger Freyther
>  - Marcin Juszkiewicz
>  - Koen Kooi
>  - Richard Purdie
>  - Dr. Michael Lauer
>  - Graeme Gregory
>  - Philip Balister
>
> Why was this established and when? Good questions. When, I'm not sure
> about, the above group of people are long standing devs who've tried to
> guide the project at various times. Bar the last two people that group
> of people have been guiding the project for several years. The last two
> people were "invited" more recently to try and add more opinions and
> remove any claims of bias.
>
> Why? The problem is how does OE make a decision? The above group has
> tried to guide the project a bit and put some kind of organisation and
> decicion making process in place. The plan is to hand over to the e.V.
> and maybe elect a core team properly once we're in a position to do so.
> We're not trying to grab power, steal the project or do anything else
> "evil", we just want to move OE forwards and try and resolve some
> ongoing problematic issues.
>
>> Is OE still an open project?
>
> Yes. No decisions have been made without discussion on the -devel
> mailing list.
>
>> Is anybody outside core just a little-valued
>> monkey from which we gladly take code but leave out of any kind of
>> steering decision?
>
> See above. Nobody is under valued and we do try to listen to all view
> points. The main reason the core team exists is to give some method of
> actually making a final decision.
>
> Personally, in time I expect the core team to be replaced with something
> elected by the e.V. with clear policies on what its responsible for.
> This stuff does take time though...
>
> Cheers,
>
> Richard
>
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Registered Linux User: #293401


