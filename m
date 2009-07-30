Received: from [209.85.220.216] (helo=mail-fx0-f216.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1MWVow-0001WY-HH
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Jul 2009 15:37:24 +0200
Received: by fxm12 with SMTP id 12so39526fxm.20
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jul 2009 06:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=cA8oFl8Lgh3B/c8vO3WTCb/8QAgZPXhdSGbNGvhjXh0=;
	b=nruujT5W9XAwPYMSXAVnaeCGu110mu84dYuTDkH0xl0U8AO9XDDCxV3VVaJW3wYuOT
	6fJi4P2ep2KCPittzs7Odg1aDCzRjcLVqRy5qy5mKVSoQbcJOJf8G1I9dBPu+CwvgX/v
	PsJQ/XwxJkaj0CDmpo8arzgwu9nBs8BSS6ywY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=mWY5wQ+WqYLqx7C5NAiCYsb4XLVsoXh9NHTn9m4vA/4kvbTC+XFuyqRF9Yzbge6Gv3
	FKO6fKYdyxiaTu4zkFxlXW+cLbDksNo+8XRRW4dE797fiP7cKMPpDOg/+dXtYAMdwtJY
	0NQjdlKu/u7sGmV4ZAuA8z46bvQdF9Bbw/bgc=
MIME-Version: 1.0
Received: by 10.239.130.194 with SMTP id 2mr121907hbk.100.1248960139163; Thu, 
	30 Jul 2009 06:22:19 -0700 (PDT)
In-Reply-To: <20090730125001.GA30052@zlo.nu>
References: <BLU137-W15C50162BE2D466B2B3182D44C0@phx.gbl>
	<BLU137-W9D00E1434DB12273A400AD4480@phx.gbl>
	<1244206438.6643.46.camel@port4>
	<BLU137-W29570FDEF1300363D893E4D4450@phx.gbl>
	<1244635240.28486.7.camel@hammer.suse.cz>
	<20090730105711.GA29595@zlo.nu>
	<1248952464.21030.110.camel@hammer.suse.cz>
	<20090730114922.GA29793@zlo.nu>
	<1248956053.21030.133.camel@hammer.suse.cz>
	<20090730125001.GA30052@zlo.nu>
Date: Thu, 30 Jul 2009 15:22:19 +0200
Message-ID: <c384c5ea0907300622k5ab4bc15yeae9f448312fb887@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Commit 2e0fa4918d643ce6ec0299cd31cfe1c346e4bce3 breaks libtool's do_configure [PATCH]
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
X-List-Received-Date: Thu, 30 Jul 2009 13:37:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, Jul 30, 2009 at 2:50 PM, Marc Olzheim<zlo@zlo.nu> wrote:

> My /bin/sh is a dash, I should have known, my apologies. =A0I have a patc=
h
>
Testing with dash rather than bash is GOOD due to it adhering to POSIX
without much of the bash-specifics.

So please do not introduce 'bashisms'  (dependencies on bash behaviour).

Regards,
--=20
Leon


