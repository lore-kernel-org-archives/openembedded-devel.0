Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1NYn5G-0002kx-IV
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 21:59:57 +0100
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id 12B411D3607A; Sat, 23 Jan 2010 21:57:32 +0100 (CET)
Date: Sat, 23 Jan 2010 21:57:32 +0100
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100123205732.GQ18793@ibawizard.net>
References: <1264273402-29910-1-git-send-email-john@soundmetrics.com>
	<1264276434.3738.53.camel@mattotaupa.wohnung.familie-menzel.net>
MIME-Version: 1.0
In-Reply-To: <1264276434.3738.53.camel@mattotaupa.wohnung.familie-menzel.net>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@mengele.ibawizard.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] socat: Add version 1.7.1.2
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
X-List-Received-Date: Sat, 23 Jan 2010 20:59:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Paul Menzel <paulepanter@users.sourceforge.net> [2010-01-23 20:53:54]:

> 1. Applying your patch gives me warnings.
> 
>         $ git am /tmp/\[oe\]_\[PATCH\]_socat\:_Add_version_1.7.1.2 
>         Applying: socat: Add version 1.7.1.2
>         /srv/filme/oe/openembedded/.git/rebase-apply/patch:29: trailing whitespace.
>          
>         /srv/filme/oe/openembedded/.git/rebase-apply/patch:38: trailing whitespace.
>          
>         /srv/filme/oe/openembedded/.git/rebase-apply/patch:46: trailing whitespace.
>          
>         /srv/filme/oe/openembedded/.git/rebase-apply/patch:54: trailing whitespace.
>          
>         /srv/filme/oe/openembedded/.git/rebase-apply/patch:60: space before tab in indent.
>          	IF_IP6    ("ipv6only",	&opt_ipv6_v6only)
>         warning: squelched 13 whitespace errors
>         warning: 18 lines add whitespace errors.

Those are warnings "only", just whitespace errors. It was applied anyway,
right? I think, it's because git don't like upstream code much.

-- ynezz


