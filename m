Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>) id 1PuqrR-00045g-Gt
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Mar 2011 19:33:23 +0100
Received: by fxm8 with SMTP id 8so287228fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Mar 2011 10:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=9i/H6EOjzW6aAmRlRSB+O/5bnYo9uc2MSia5fBuWPYk=;
	b=DtKJtiJzmXtyMFOzyQmiBCC8q6pcCt4oVfiPW6sBfd5yl+RfnB6pwD/1fm0IFmP3BQ
	O937BdxjrvVgch1wn6vEKTFN5sVjmzA+JWgdnmf+U39v3DCh3mPbueJhErUUHom7g3wz
	mnZZBlwN25bSPhUk2yB11Jx4xbydGx1kfD5ds=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	b=LuPQctCyB0NhmPV5vlIWknfTe9kDE5hUJzNnhsEKXS2OmgLRkFMaNlQUZG1epGy5Xj
	5lQQx9vTWgjbe4NVdGzatb6XSGShPfMEiyeUYkMuDWDnAGZCILTZiu5UWh/rvlIagrfL
	pKUt43JOFL+a0AgUZPz7rH1PAuZ4Iz8+Simew=
MIME-Version: 1.0
Received: by 10.223.86.12 with SMTP id q12mr285158fal.18.1299090686209; Wed,
	02 Mar 2011 10:31:26 -0800 (PST)
Sender: jefro.net@gmail.com
Received: by 10.223.108.194 with HTTP; Wed, 2 Mar 2011 10:31:26 -0800 (PST)
In-Reply-To: <20110302160006.GB10330@denix.org>
References: <20110224231001.GC11390@denix.org> <ik7sp2$9g$2@dough.gmane.org>
	<AANLkTincPsSAJ11+Avg1mjurqzt28V5ZOtijrVYHqmA7@mail.gmail.com>
	<20110302160006.GB10330@denix.org>
Date: Wed, 2 Mar 2011 10:31:26 -0800
X-Google-Sender-Auth: EBuzuE-ZS7gMQ-0nSxm7iKGlmSM
Message-ID: <AANLkTinQvXd+RXSD28MNGVgh5Z72mNQv7eeTffb8+sqA@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: US OEDEM/OEDAM in April?
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
X-List-Received-Date: Wed, 02 Mar 2011 18:33:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Denys - OE now has a room at the conference on Sunday from 12-5,
ostensibly for a TSC meeting but I expect it to be more of a general
gathering, at least for part of the time.  There will also be a combined
Yocto/OE BoF at ELC, but the schedule has not yet been finalized.


On Wed, Mar 2, 2011 at 8:00 AM, Denys Dmytriyenko <denis@denix.org> wrote:

> On Mon, Feb 28, 2011 at 07:17:43PM -0800, Jeff Osier-Mixon wrote:
> > Hi all - I have asked the Linux Foundation if there is a conference room
> > available over the weekend between Collab and ELC in case a OEDAM
> happens.
> >  I'll report back when I hear a response.
>
> Jeff,
>
> Thanks for looking into it! Please let us know what you find out about the
> conference room.
>
> --
> Denys
>
>
> > The Yocto BoF that is planned for ELC could also be a Yocto/ELC BoF
> although
> > it would not be a working meeting.
> >
> > On Fri, Feb 25, 2011 at 1:29 AM, Koen Kooi <k.kooi@student.utwente.nl
> >wrote:
> >
> > > -----BEGIN PGP SIGNED MESSAGE-----
> > > Hash: SHA1
> > >
> > > On 25-02-11 00:10, Denys Dmytriyenko wrote:
> > > > All,
> > > >
> > > > We had previously discussed the possibility of holding US-based OEDEM
> (or
> > > is
> > > > it called OEDAM then?) in addition to our regular Fall OEDEM in
> Europe.
> > > Is
> > > > there still any interest in this?
> > > >
> > > > There is Embedded Linux Conference in San Francisco coming up in
> April,
> > > along
> > > > with few other Linux Foundation sponsored or organized events right
> > > before or
> > > > right after ELC. As some of the OE developers are planning on coming
> to
> > > ELC,
> > > > should we try to schedule a day or two for OEDEM and try to resolve
> some
> > > of
> > > > the pending organizational and technical issues face to face?
> > >
> > > The TSC is trying to plan a meetup around Collab/ELC, so a OEDAM would
> > > be good to have as well.
> > >
> > > regards,
> > >
> > > Koen
> > > -----BEGIN PGP SIGNATURE-----
> > > Version: GnuPG v1.4.5 (Darwin)
> > >
> > > iD8DBQFNZ3ZiMkyGM64RGpERAs2HAKCXZnqyUEHDM+WOcObi1pX8RiOE6ACfQwZa
> > > 3LHdOKIpzeru6xnKFaTaa38=
> > > =KDoC
> > > -----END PGP SIGNATURE-----
> > >
> > >
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> > >
> >
> >
> >
> > --
> > Jeff Osier-Mixon
> > Yocto Community Manager @Intel
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Jeff Osier-Mixon
Yocto Community Manager @Intel

