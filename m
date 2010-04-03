Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tux.jens@googlemail.com>) id 1Ny42k-00075U-6K
	for openembedded-devel@lists.openembedded.org;
	Sat, 03 Apr 2010 16:09:47 +0200
Received: by gwj21 with SMTP id 21so1687296gwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Apr 2010 07:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:sender:user-agent;
	bh=XkBRtU1Q+8aLoFQefA+eiiMCbSXJ1bKJE9LNm9/uvdI=;
	b=oNbUw0xInjlf/EhDXG76P+dBsxYUC9r0Oqe59+mZ+pakq3cVDHJp5GHstdZHWDDO/a
	Hbrr5tqNU6MSBBY73zcC6dlwiHqqmgipi2Acn8TyHlw6/U4707StxeSzWGTdeInp9UKI
	niKLJlNzFqIXJKVqLAAjF/0gLglzdzRigiVkk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=googlemail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to:sender
	:user-agent;
	b=vPv5BeosxHUegzXlN6bbLB1VBgWdrlXkRCXbGqJNQUoE92LdigCq+r96J/4fQeNMep
	9KLL+4UZkVujsxtS5rMljO+VV2FfSGzlGh/KksSMwBzg3U0DzPxp913VrwzOlypPE2hU
	TtBAk9Ck7ZHmgoeNRU+LcSqcdGiLuXWHo6CCo=
Received: by 10.100.25.34 with SMTP id 34mr8410576any.187.1270303586867;
	Sat, 03 Apr 2010 07:06:26 -0700 (PDT)
Received: from merkur.sol.de ([72.14.241.51])
	by mx.google.com with ESMTPS id 4sm2747174ywd.58.2010.04.03.07.06.25
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 03 Apr 2010 07:06:25 -0700 (PDT)
Received: from jens by merkur.sol.de with local (Exim 4.69)
	(envelope-from <tux-master@web.de>) id 1Ny3kg-0001hu-Pb
	for openembedded-devel@lists.openembedded.org;
	Sat, 03 Apr 2010 15:51:06 +0200
Date: Sat, 3 Apr 2010 15:51:06 +0200
From: Jens Seidel <jensseidel@users.sf.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100403135105.GA6475@merkur.sol.de>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1269796691.8018.74.camel@mattotaupa>
	<1269955259.4103.51.camel@mattotaupa>
	<1270223959.3873.29.camel@mattotaupa>
	<l2s19c1b8a91004021128sa6116ab2p62cec8cd78c4db43@mail.gmail.com>
	<1270237489.3714.11.camel@mattotaupa>
	<1270293620.3692.33.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1270293620.3692.33.camel@mattotaupa>
Sender: Jens Seidel <tux.jens@googlemail.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: tux.jens@googlemail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: autopoint || touch config.rpath (was: [PATCH v3] enna:	Move to own recipe folder and update to new Enna hg repository.)
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
X-List-Received-Date: Sat, 03 Apr 2010 14:09:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Apr 03, 2010 at 01:20:20PM +0200, Paul Menzel wrote:
> Am Freitag, den 02.04.2010, 21:44 +0200 schrieb Paul Menzel:
> > Am Freitag, den 02.04.2010, 11:28 -0700 schrieb Khem Raj:
> > > On Fri, Apr 2, 2010 at 8:59 AM, Paul Menzel <paulepanter@users.sourceforge.net> wrote:
> > > > +do_configure_prepend() {
> > > > +       autopoint || touch config.rpath
> > > > +}
> > > 
> > > empty config.rpath would build it wrongly isnt it. Probably this
> > > should be removed

Right.
 
> > That is the work around Koen suggested [1]. Koen, can you comment
> > please.
> 
> Is
> 
>         do_configure_prepend() {
>                 autopoint || automake --add-missing
>         }
> 
> a viable solution [2]?

No, it isn't. I really wonder about all these guesses. I agree that the
autotools stuff is not very easy to understand but one should only provide
patches if one knows it.

Let me short summarize:

automake is a tool to generate Makefile templates (called Makefile.in) from
Makefile.am files. Normally a tgz ball ships already these generated files
(that's dictated by GNU). Nevertheless these files are often not committed
into version control systems and a script autogen.sh or better autoreconf is
used to generate Makefile.in by calling automake. But autoreconf calls even
more: e.g. autoconf (which generated configure) and now also autopoint.
autopoint generated the gettext infrastructure (the translation system to
support foreign languages) by copying all non config dependent gettext files
(such as Makefile.in.in, some scripts, ...) into po and m4 macros. That's
also a good thing as this avoids committing generated files.

But why do you want to call either autopoint or automake? The belong
together and autoreconf should care about it. If this doesn' work it could
be a bug in the package.

If you send me the project source and the command which fails (without
bitbake stuff as I never used it up to now) together with the
autoconf/automake versions I can try to inspect it. Since the error seems to
happen in configure or even before there should be no difficult relationship to
bitbake and recipes, right?

Jens


