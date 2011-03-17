Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>) id 1Q0G8I-0002Sl-BZ
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Mar 2011 17:33:06 +0100
Received: by fxm19 with SMTP id 19so2821055fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2011 09:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=YuKcxjOJDe9hi5/oL9Dyje5CM/2pbyme1soNClUgp98=;
	b=Cg3jQzuU9FKatn18rMBcwk3FFpyt6cN+eQ6J5kOml7u9xV/3C1MEnHDbJWUDBH84Pr
	VcUunLjgN2GyLlYulEH7WYIjxftGhvVCb5g8Kd0jbZFksWY74QW6A4WmGam+ZGh6yChQ
	MFUKTN2LuZVFss5b1tOXQtvE8GzVERQajglYg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	b=IvHumPVm6xIVSiJPH3HNhSD+C/DopXDso0/xpwn5PWUZ8LP8us3NV1WwEPhUTc32z3
	2r8IiadYJtiYYRwHTUyUcvFXrrzZ6Bl/Tfv7tkjLcHy6YwK3O/bacYapHyK6AGaA2D5y
	Aj7d4PGXEbpRuiRJpphBeV5vosaFSIub/PzO8=
MIME-Version: 1.0
Received: by 10.223.143.5 with SMTP id s5mr1178531fau.14.1300379480979; Thu,
	17 Mar 2011 09:31:20 -0700 (PDT)
Sender: jefro.net@gmail.com
Received: by 10.223.125.83 with HTTP; Thu, 17 Mar 2011 09:31:20 -0700 (PDT)
In-Reply-To: <AANLkTim51F7=Jt5COph35-KpHEX0oBJwhBUh4KLhgT_W@mail.gmail.com>
References: <4D817FB9.5050404@windriver.com>
	<AANLkTim51F7=Jt5COph35-KpHEX0oBJwhBUh4KLhgT_W@mail.gmail.com>
Date: Thu, 17 Mar 2011 09:31:20 -0700
X-Google-Sender-Auth: Wo8wigNqKtGDpo3Cav7AQawPB14
Message-ID: <AANLkTi=vZMLrrk9=WBqGXxy49STP-TNeQ-_5pGm5YCR1@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Minutes, OE TSC meeting, March 10 2011
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
X-List-Received-Date: Thu, 17 Mar 2011 16:33:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Frans,

I will add this to the agenda for this week

On Thu, Mar 17, 2011 at 1:38 AM, Frans Meulenbroeks <
fransmeulenbroeks@gmail.com> wrote:

> Mark, thanks for the minutes.
>
> There is one remark I'd like to make and one agenda item i'd like to
> coin for the TSC (I'll do that here since I haven't seen an agenda and
> call for topics for the next TSC meeting)
>
> 2011/3/17 Mark Hatle <mark.hatle@windriver.com>:
>
> >
> > Further discussion of deprecation of OE bugzilla.  Yocto intends to keep
> a bug
> > tracking system for itself.  This might also be the place where OE-Core
> bugs can
> > be tracked.
> >
>
> What about the remaining parts of OE?
> Do we also stop to use bugzilla for those?
> Or will that also be done in the yocto bug tracking system?
>
> I would like to suggest that the TSC starts to discuss how to deal
> with the non-oe-core recipes that we have.
> We have meta-oe of course. It might be useful to discuss and decide on:
> - do we want to use meta-oe (and if so, how should it be
> sub-structured, e.g. similar to oe-core meta* dirs)
> - assuming it'll be meta-oe, how will we deal with it in terms of
> adding recipes, dealing with patches, retention policy, ownership etc
> etc
> - how/where to store deprecated oe-core recipes that are still
> useful/needed (and how to retire them if they are not needed any
> more).
> ...
>
> Or in a more general sense:
> How are we going to deal with the parts of OE that are not part of OE-core.
>
> Best regards, Frans.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Jeff Osier-Mixon
Yocto Community Manager @Intel

