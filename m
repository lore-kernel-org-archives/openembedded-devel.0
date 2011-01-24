Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PhOaM-0004fw-MW
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Jan 2011 16:44:06 +0100
Received: by gwaa12 with SMTP id a12so1456521gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jan 2011 07:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=G3zFGUhjiFedlMRdXC7RpC2QZ4VsXq1qyBzNF+t7PhI=;
	b=HaTOojN4d7Gwr7VGERAOvjBskD7wCkn1yZEzCanI7NXcOA9KvDyR44ta/xL9RSgGyQ
	ggmKD14r5EE6H4s3d75llq6i65nr8ekM4Q/uuHzRGNUcJGa5QJQZbrKLw7m6WhAkYvY1
	LX/ocYv982ytOFko3DzVNAWlJfOz8l0sZB8zs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=aZe0p/RkPsRry4Ib3gTfR0TMV6mSOmi2xiID7hAYH6LFZJKdbW3IeM9mEEFv44eqUD
	1gw5ogs7rZhgqSFCQStMegk6vDe3UUxTrCDLopspyzYjjgqvmB6s2g3dDCkjY6fvbhHq
	HAOHmwlC1BxXdGqNHEa6oqbJYLO9UwGtcxCqY=
Received: by 10.42.165.71 with SMTP id j7mr4960544icy.474.1295883799788; Mon,
	24 Jan 2011 07:43:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.42.230.71 with HTTP; Mon, 24 Jan 2011 07:42:59 -0800 (PST)
In-Reply-To: <4D3D9AA4.9030608@mentor.com>
References: <1295834629-3974-1-git-send-email-raj.khem@gmail.com>
	<ihjf6u$c5u$1@dough.gmane.org>
	<AANLkTin6h0bLj=s=ngGQrJMEQx2PBfK3hbm54nsmXari@mail.gmail.com>
	<ihjhd3$n1e$1@dough.gmane.org>
	<AANLkTikqMQ8_xZZUjrm3Cu2GVJ5COM0u5PFuGAvyst+2@mail.gmail.com>
	<4D3D9777.6060109@balister.org> <4D3D9AA4.9030608@mentor.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Jan 2011 07:42:59 -0800
Message-ID: <AANLkTim0D=m=j2i3TAxnAgUFAvEBwYdjYwzh97Jj-jei@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] angstrom-2010.x.conf: Prefer binutils 2.21 and uclibc-git
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
X-List-Received-Date: Mon, 24 Jan 2011 15:44:06 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 24, 2011 at 7:28 AM, Tom Rini <tom_rini@mentor.com> wrote:
>
> Not to put too many words into Khem's mouth, but I imagine it was that he
> checked this in on the same branch as the other changes he pushed last night
> and forgot (time for some 'git stash'ing Khem :))
>
>

yeah in order to send the review thru git format-patch/git send-email
you need to commit it somewhere
and this has bitten me more than once plus it was too late in the
night so I will forgive myself but look
for some pre-push hooks to show me what its pushing before it finally
does so. If anyone knows
of such a hook please lemme know


