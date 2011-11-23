Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RTGl6-0001NH-Fu
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Nov 2011 18:37:20 +0100
Received: by ywb20 with SMTP id 20so1505083ywb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2011 09:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=Xl1Q82hJYXFDkF0/tx6yOw08ui/wr9wjy1DYrX5nvzI=;
	b=AzckefF5THX/PX+TMwubSFviZ9EDMuLjzBoagBpZgPs2NPu2VkxPBC3s//bSWM2kBG
	pjpNG6w7qapFpMz8NGLcoCk5fBCgx+TYO4hNiN8WyUyt9hVIPTX3H7kXRsnAyVXatzU7
	diW1ajSjNfQJBTjcLeOQDlhzJQ0IrX4g+/IYA=
Received: by 10.152.105.226 with SMTP id gp2mr15183057lab.28.1322069445262;
	Wed, 23 Nov 2011 09:30:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Wed, 23 Nov 2011 09:30:14 -0800 (PST)
In-Reply-To: <CA+chaQdUFUswZg-aYtWdEiF0C3fVFtrmMP8uH+AMKtbH2yGkKg@mail.gmail.com>
References: <20111121131845.D1E9910337@opal>
	<CA+chaQdUFUswZg-aYtWdEiF0C3fVFtrmMP8uH+AMKtbH2yGkKg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Nov 2011 09:30:14 -0800
Message-ID: <CAMKF1soJR=CswvnzuvSeffqpbQ7Y84oLeD3BNDRCuaAaAqRxWw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] Koen Kooi : abiword: update to 2.8.6
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
X-List-Received-Date: Wed, 23 Nov 2011 17:37:20 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Nov 22, 2011 at 11:11 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Anyone seen this? Looks like missing -Wl, but I didn't look into it
> from where I get it.
>
> Maybe it's related to
> http://lists.gnu.org/archive/html/libtool/2011-03/msg00015.html and
> commiter didn't see it because is using gcc-4.5.
>

very likely the case

> Regards,
>


