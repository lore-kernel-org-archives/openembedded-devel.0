Received: from [74.125.92.148] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1KyuOJ-00010e-PU
	for openembedded-devel@lists.openembedded.org;
	Sat, 08 Nov 2008 21:26:43 +0100
Received: by qw-out-1920.google.com with SMTP id 5so1023422qwf.36
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 Nov 2008 12:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=OnSzfLyFclE+otBKl+NvxEF5gCHG8rIXMa4xaUCzhuI=;
	b=jBneuuR9T3a7Phv+sJkBR08w5lz3CQhCCxQgeFHLXZ0UzwITP4AbfVWl/FjK/NQLXv
	vktO0Nt5yO1gKk80vDvoa0NCSlz0GnHsflnA3DNa0SCmnQ6rLeN0FdmU/Hey9VGu6Pdl
	WX2Oau+rj4ivkgZ3/mOwF9V/5nE4NJNzNEqOw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=q7HauAimkFJZ2R4KsPOXWGJ0UqOctyXy0YPpTOE5xS9sT50qaJzJevTwSSK+cCLWOC
	i9vPnh2q5h4P81/Vlc23d56yrb8PXDtQMaec3VagjZHKsGCRpsxCJRxOQjMawb8rzN7E
	d2jimK58/DUA7hCcJtFoH2nS7dXRmx6L0k5nA=
Received: by 10.214.113.11 with SMTP id l11mr5417950qac.190.1226174661474;
	Sat, 08 Nov 2008 12:04:21 -0800 (PST)
Received: by 10.214.12.10 with HTTP; Sat, 8 Nov 2008 12:04:21 -0800 (PST)
Message-ID: <c384c5ea0811081204j6edb237aw69afe7163277a84e@mail.gmail.com>
Date: Sat, 8 Nov 2008 21:04:21 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1226099101.6034.5.camel@utx.utx.cz>
MIME-Version: 1.0
References: <1226099101.6034.5.camel@utx.utx.cz>
Subject: Re: [patch review] bitbake.conf: Introduce STAGING_BINDIR_CROSS_BASEPKG
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
X-List-Received-Date: Sat, 08 Nov 2008 20:26:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

On Sat, Nov 8, 2008 at 12:05 AM, Stanislav Brabec <utx@penguin.cz> wrote:
> It introduces STAGING_BINDIR_CROSS_BASEPKG pointing to
> STAGING_BINDIR_CROSS of base packages and adds it to PATH (after
> STAGING_BINDIR_CROSS).
>
> It fixes highly base package cross bindir lookup while compiling highly
> optimized packages. Actually it's mplayer and sdl-config lookup.
>
I do not understand what exactly you fix.

Could you explain more elaborately?

Thanks,
-- 
Leon


