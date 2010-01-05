Received: from mail-pw0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1NSCHN-0007I5-Ms
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Jan 2010 17:29:13 +0100
Received: by pwi18 with SMTP id 18so10238070pwi.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Jan 2010 08:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:message-id:subject:to
	:content-type; bh=PxFiGIl3NaAXUTT/2q1HI23rUb2D6x2PFWHPXW/ecVw=;
	b=D/QNKQuGPPTDjpivWhX04sZ+IW8CXnBRMJefPgwbs7EM106vbmUUJtIYG+oTlwuZcb
	z2USh68aruMp+L/obkX9i6V/+sbITOpI+G9kgFriHHubiSDBOHZHdhh7Q8EkoPiALbjB
	Vvin7/qNUXNG0TvmkXRptI1yBxbotSmbcrcOg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=hRJbsuwDjhMyQjde/f763oiCqTZIt17MkCvXaok3fv8O9dlTNBpCnQGGJ9WGsgqBZN
	ZFDhd7mrj3U78LEdtc3qYjP5RWZ/f90E0BpIue940o6CiVVC5zUdbJVs09exPtXTetoD
	nACfYw+7SdCFdJQ+QwvRCiIvpg59QYn28AAEo=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.142.4.17 with SMTP id 17mr187067wfd.85.1262708825148; Tue, 05 
	Jan 2010 08:27:05 -0800 (PST)
In-Reply-To: <1262702588.8748.466.camel@dax.rpnet.com>
References: <20091222140029.GF10910@xora.vm.bytemark.co.uk> 
	<hhdikl$25q$1@ger.gmane.org> <1262118637.8748.173.camel@dax.rpnet.com> 
	<hhf42m$n7h$1@ger.gmane.org>
	<20091230144538.6a171e4e@xora-desktop.xora.org.uk> 
	<1262602007.8748.206.camel@dax.rpnet.com>
	<20100104110233.GA2017@xora-vm2.xora.org.uk> 
	<1262629172.22868.4.camel@andromeda>
	<20100105111128.GB1983@xora-vm2.xora.org.uk> 
	<1262702588.8748.466.camel@dax.rpnet.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 5 Jan 2010 09:26:45 -0700
X-Google-Sender-Auth: c0d1ca1b16a8226d
Message-ID: <b6ebd0a51001050826t3bd42641g925c023c706d5ca0@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.53
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
X-List-Received-Date: Tue, 05 Jan 2010 16:29:13 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jan 5, 2010 at 7:43 AM, Richard Purdie <rpurdie@rpsys.net> wrote:

> On Tue, 2010-01-05 at 11:11 +0000, Graeme Gregory wrote:
> > On Mon, Jan 04, 2010 at 07:19:32PM +0100, Michael 'Mickey' Lauer wrote:
> > > Am Montag, den 04.01.2010, 11:02 +0000 schrieb Graeme Gregory:
> > > > If people can tell me there jabber login I can create a TSC private
> room and invite
> > > > people to it.
> > >
> > > mickey@totalueberwachung.de
> > >
> > > Apart from today and Friday, I'm pretty open towards a date.
> > >
> > Putting together everyones free times unless I misread it seems
> > the only day this can happen now is thursday.
>
> Looks like it - assuming no objections, lets meet on Thursday evening
> GMT, say 8pm.
>

That'd work for me.
-- 
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.

