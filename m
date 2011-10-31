Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1RL0WR-0002FX-KJ
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Oct 2011 23:40:03 +0100
Received: by vcbf1 with SMTP id f1so5753804vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Oct 2011 15:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=ZqpEOOV/qQTydbS3GjYWy6mxtNU7bhmF/ozvGbriGqg=;
	b=td06cwqaxIL2/Jv5spFNyxHXhaMHyFASMUBro9sIvVItmYUgCV1a9ks9+UMJcOCfA3
	ZhKiBXS/bsr86FkyF6DTHhvWkjLUfzClSMpemNMBjNJ3QlyTobWGJoDgJBthZHZ6BezM
	JqKKUGIf/Gb8dbFTuCtaqI6K+YnAM3QWWEzhA=
MIME-Version: 1.0
Received: by 10.52.178.65 with SMTP id cw1mr3959626vdc.47.1320100437823; Mon,
	31 Oct 2011 15:33:57 -0700 (PDT)
Received: by 10.52.184.197 with HTTP; Mon, 31 Oct 2011 15:33:57 -0700 (PDT)
In-Reply-To: <j8n6fh$dvf$1@dough.gmane.org>
References: <eeffc3b2de8e5277ef3184874b88e4e382fa72c8.1319884094.git.Martin.Jansa@gmail.com>
	<3bcd2fb9e853253747293c584109ab394ba3fd4e.1319884094.git.Martin.Jansa@gmail.com>
	<1319891607.3756.18.camel@mattotaupa>
	<j8luhk$7vb$3@dough.gmane.org> <1320078283.3621.4.camel@mattotaupa>
	<j8mn18$usd$1@dough.gmane.org> <4EAF1095.2050701@balister.org>
	<j8n6fh$dvf$1@dough.gmane.org>
Date: Mon, 31 Oct 2011 23:33:57 +0100
Message-ID: <CACW_hTbbjHCOndugdCO1eKW1x4Qxz=Wgq_J9bhD1Y3T+m=gw1A@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-efl][meta-oe 05/12] id3lib: Import from openembedded classic
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
X-List-Received-Date: Mon, 31 Oct 2011 22:40:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/10/31 Koen Kooi <koen@dominion.thruhere.net>

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 31-10-11 22:18, Philip Balister schreef:
> > On 10/31/2011 01:48 PM, Koen Kooi wrote:
> >> Op 31-10-11 17:24, Paul Menzel schreef:
> >>> Am Montag, den 31.10.2011, 11:50 +0100 schrieb Koen Kooi:
> >>>> Op 29-10-11 14:33, Paul Menzel schreef:
> >>>>> Dear Martin, dear Denis,
> >>>>>
> >>>>>
> >>>>> Am Samstag, den 29.10.2011, 12:29 +0200 schrieb Martin Jansa:
> >>>>>> From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
> >>>>>>
> >>>>>> Added LIC_FILES_CHKSUM, and fixed LICENSE
> >>>>>>
> >>>>>> Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
> >>>>>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >>>>>
> >>>>> NACK.
> >>>>>
> >>>>> please add the version you import and the commit ID you import
> >>>>> from. This is all written in the guide lines [1]!
> >>>>
> >>>> And as I've said before, meta-oe is not oe-dev, so you can't use
> >>>> take the old 'rules' and apply them to meta-oe 1:1!
> >>
> >>> The guide lines I referred to [1] have been written for OE-core. ;-)
> >>
> >> Yes, and oe-core still isn't meta-oe
> >
> > Why would we need different guidelines?
>
> Different goals I guess. And I don't trust a ruleset that's in a wiki, too
> much room for people coming in and messing it up.
>
> As far as I recall the idea was that meta oe should follow the same
guidelines as oe core.
When was this changed?
Who decided this?
And if there need to be different guidelines, I feel it is useful to
document them somewhere (and probably also why it deviates from oe-core).

Anyway, I think I start to understand why so few people are willing to
contribute to meta-oe.

Have fun! Frans.

