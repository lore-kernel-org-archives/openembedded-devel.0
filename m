Received: from mail-px0-f183.google.com ([209.85.216.183])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1NRos6-0005Ze-IE
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Jan 2010 16:29:33 +0100
Received: by pxi13 with SMTP id 13so7099133pxi.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jan 2010 07:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:message-id:subject:to
	:content-type; bh=SfDq4ZbPhHQfpDFGV4LylSVYMU/0PUqdup9/DcMQEd4=;
	b=Y5p4pCijI/4yqegd63PN2K2F8rfbAMsqFXYajcl4uPb6Ar7j6sy2Ad1RmDKBdGV7Mk
	f+zrbclIPgZ2TC2rEeVzVCjNCKncCEfdqxaSwSklS0bi6hInXaPv/yX9rYUZbiilPbTP
	0P90ZsWQtvFSMFiJlFA0DsIspx/pQgGa2hxXE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=L9llmCHDpssQw178iZCKB0CbffWPJQjBkKUvhjse14o7JeWbyw5MCC6gE0Jgv8EFsR
	wkAYw6E78FOjeVqccWO7Q/wj9CUeqfs1pbKuZUgPx9NrIK9xUudtwG6vXpCc4NrH5H0X
	AF9mBfs4bx9eg4hErKcJAXI0cOL2gxjMd8zcw=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.142.8.38 with SMTP id 38mr15389852wfh.58.1262618847085; Mon, 
	04 Jan 2010 07:27:27 -0800 (PST)
In-Reply-To: <1262605954.8748.214.camel@dax.rpnet.com>
References: <20091222140029.GF10910@xora.vm.bytemark.co.uk> 
	<1261596258.8748.156.camel@dax.rpnet.com>
	<20091229155215.00006145@unknown> 
	<hhdikl$25q$1@ger.gmane.org> <1262118637.8748.173.camel@dax.rpnet.com> 
	<hhf42m$n7h$1@ger.gmane.org>
	<20091230144538.6a171e4e@xora-desktop.xora.org.uk> 
	<1262602007.8748.206.camel@dax.rpnet.com>
	<20100104110233.GA2017@xora-vm2.xora.org.uk> 
	<1262605954.8748.214.camel@dax.rpnet.com>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 4 Jan 2010 08:27:07 -0700
X-Google-Sender-Auth: 14f1f556327990ce
Message-ID: <b6ebd0a51001040727h7b420bdew783599a7c55e4b8c@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.183
X-SA-Exim-Mail-From: kergoth@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [TSC] First Meeting
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
X-List-Received-Date: Mon, 04 Jan 2010 15:29:34 -0000
Content-Type: text/plain; charset=UTF-8

My schedule is usually fairly open, other than the occasional meeting.
 Either IRC or Jabber are fine with me, and can do them from either work or
home (I doubt I'll get any complaints about doing it on work's time, given
we use bitbake in MVL6).  Today is mostly meeting free, but I do have some
training from around 9pm UTC to 11:30pm UTC.

On Mon, Jan 4, 2010 at 4:52 AM, Richard Purdie <rpurdie@rpsys.net> wrote:

> On Mon, 2010-01-04 at 11:02 +0000, Graeme Gregory wrote:
> > On Mon, Jan 04, 2010 at 10:46:47AM +0000, Richard Purdie wrote:
> > > On Wed, 2009-12-30 at 14:45 +0000, Graeme Gregory wrote:
> > > > > Jabber conference rooms?
> > > > >
> > > > I can organize one of these on my jabber server I have tested that
> > > > functionality with koen before.
> > >
> > > I'm ok with this, are there any objections?
> > >
> > > Are we going to give public access to the discussions or post logs of
> > > what was discussed somewhere? (or something else?).
> >
> > I would do the same as what we do for board meetings. A summary of
> > decisions.
>
> Lets run with that for now and put this on the agenda for discussion.
>
> > For public meetings I guess just have a public jabber chat.
>
> Ok.
>
> > > We need to get something up and running sooner than later :/.
> > >
> > Yes, but so far 2 out of 5 TSC members are not replying to email. If
> people
> > can tell me there jabber login I can create a TSC private room and invite
> > people to it.
> >
> > This is especially urgent to do it this week if possible as from friday
> > morning I shall be not available for 1.5 weeks.
>
> Right, so we *need* to do something this week. I can't make Wednesday
> evening, most other times work although I have occasional meetings
> scheduled during the working day.
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
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.

