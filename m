Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>)
	id 1PppdG-0001XZ-Uy; Wed, 16 Feb 2011 23:13:59 +0100
Received: by pzk12 with SMTP id 12so256022pzk.6
	for <multiple recipients>; Wed, 16 Feb 2011 14:12:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=sRV8+kXBkj3g74Zp1krSbBcEecKTDr7ZZhNh0fT51zg=;
	b=W2UUAiVvLeXZoAlboPLcJqTMVi6pHE+BdN9QGj5+9ahsDHGmEsiTq87VQsBksbuR1E
	QqXKpi9BA9E+wwuOlft2B5/WrkwDThm8xDFmZntxqnuiLS9jungswvw0mKWGbcf2q78F
	ZepO4LDMnh8+E7qVOu6iKj1VxtIa+AEOTfHzY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	b=trURcfQdeZ22EGFQ7IJcm4tvsAT9X6KEF9JYyL1Aj+Mfi2xDNJIIGmTB8rlu15MbJQ
	6LfJiCuA8Q9d72b8JZN59zpIysolvPzK6ML1DB8yP7/5Vt+4r8anYNsD8zIgUpvS7RGP
	6qjnVtrdcL0U1jDahtG75I3wwtlk1qBYjh1zI=
Received: by 10.142.49.16 with SMTP id w16mr886553wfw.218.1297894365386;
	Wed, 16 Feb 2011 14:12:45 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id f5sm272519wfo.16.2011.02.16.14.12.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Feb 2011 14:12:43 -0800 (PST)
Date: Wed, 16 Feb 2011 14:12:41 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-members@lists.openembedded.org
Message-ID: <20110216221241.GA14525@sakrah.homelinux.org>
Mail-Followup-To: openembedded-members@lists.openembedded.org,
	Philip Balister <philip@balister.org>, tsc <tsc@www.linuxtogo.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-devel@lists.openembedded.org
References: <1297794731.4945.312.camel@rex>
	<AANLkTimD+Cbd-CYCDYRAcEBHdMWW9Q9sEU-WoA6cBB2q@mail.gmail.com>
	<4D5BF1A9.5040809@balister.org>
	<AANLkTimmnQpEb1zoD5vN97kokNYpLOLNZg7hg0gheHEZ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTimmnQpEb1zoD5vN97kokNYpLOLNZg7hg0gheHEZ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: tsc <tsc@www.linuxtogo.org>, openembedded-devel@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: OE TSC Meeting 2011/02/14 Minutes
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
X-List-Received-Date: Wed, 16 Feb 2011 22:13:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (16/02/11 22:09), Frans Meulenbroeks wrote:
> 2011/2/16 Philip Balister <philip@balister.org>:
> > On 02/16/2011 10:05 AM, Frans Meulenbroeks wrote:
> >>
> >> Richard,
> >>
> >> Thanks for the excellent minutes.
> >>
> >> There are two things I would like to mention though, wrt this comment:
> >>
> >>> (21:13:55) _koen_: if people really wanted to be involved, they should
> >>> have stepped up
> >>
> >> 1. The board never asked for people to step up.
> >> 2. I have informed the board on Feb 1 by email that I was available.
> >> Literally quoting: "If desired by the board I am available to
> >> participate in the interim
> >> TSC". As such I feel I have stepped up. Unfortunately my email has
> >> apparently been ignored by the board. That is: no action has been
> >> taken based upon it and I never got a reply.
> >>
> >> Just want to avoid the impression that I (and perhaps others) were not
> >> willing to get involved.

Its a good sign and everyones involvement is appreaciated and I dont
think there is any impression that no one stepped up at all. There is lot
of work we need to do that is irrespective of TSC and I would encourage
every one on community to participate in the project and contribute to
its future. There were lot of action items from the meeting and someone
owning to those action items would be a cohesive step.

> >
> > Before this gets any further, the email Frans is referring to was sent to
> > the board. It was a long email and the line he is referring was after my
> > patience reading email expired (note, in my case, the email was received
> > during travel and I was reading email fast).
> 
> I'm not really sure what you want to say here. I already mentioned
> that the email was to the board.
> And I  just ran wc on the email. 736 bytes making 128 words and 23
> lines, (of which 7 were empty)
> Not really what I consider long.And there were 3 more board members
> that got the email (5 or 6 days before the FOSDEM meeting).
> >
> > Florian, Graeme, and myself met at FOSDEM to make a decision on the TSC
> > situation. We had 5 strong candidates who had publically shown interest. The
> > meeting location was outside a building, without access to a computer, so we
> > could not review Frans' email. We already had one too many candidates and
> > needed to make a decision so we did.
> 
> That tells a lot about the care taken by the board in important
> matters like this. :-(

I think decisions board makes are for betterment of OE and in its interest 
One doesnt have to agree to every decision however its more important that one
agrees to disagree and participate in the project with the value add one
brings to it and focus on it that way help the board, TSC and project as
a whole

> 
> Anyway, I'm not complaining that I am not invited for the interim TSC.
> I really don't care. I have indicated I am available and if it was
> decided not to accept this offer, fine with me.
> However I do oppose to the suggestion that outside the current TSC
> people did not want to be involved (as was suggested on IRC by Koen).
> 
I did not get this impression, thats one downside of interpretation
sometimes contexts are different in what statements are made and then
its left upto interpretation.

As far as I can acertain everyone on TSC is fully committed to cause of
OE and are spending their efforts to make the project successful from
technical standpoint

-- 
-Khem


