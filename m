Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1QlbVA-0006lw-2h
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Jul 2011 08:52:24 +0200
Received: by ewy5 with SMTP id 5so130906ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jul 2011 23:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=YjZqQh90c9ZMmAhPpPl0gGF2naYLvNcgSHAh6BuzxZ8=;
	b=eZKRREyWGKFZm57+shxWWKbkFjfs7J2b3fvlBABFzmEQzvxz4uaz85/Bsq8Cjf5Krf
	oMw8/qTL/zRsEJE+z2pDhzY1+a/ytWHcHFMuqWz8bMRJoEgHOol43BAIRRRRM15JAxAB
	a6fVcysTMbKUDB7Uis2uFBZCmExT1XRxCtZnI=
MIME-Version: 1.0
Received: by 10.213.15.69 with SMTP id j5mr611722eba.98.1311662891255; Mon, 25
	Jul 2011 23:48:11 -0700 (PDT)
Received: by 10.213.105.210 with HTTP; Mon, 25 Jul 2011 23:48:11 -0700 (PDT)
In-Reply-To: <j0lhht$s8o$2@dough.gmane.org>
References: <1311642479-11502-1-git-send-email-agnel.joel@gmail.com>
	<j0lhht$s8o$2@dough.gmane.org>
Date: Tue, 26 Jul 2011 01:48:11 -0500
Message-ID: <CAD=GYpbC38vkZJoWc80DJaC-++wzw+UyJrphcLWzi2hx2dVccg@mail.gmail.com>
From: Joel A Fernandes <agnel.joel@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] beagleboard-test-scripts: userbutton state detection: Remove userspace scripts
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
X-List-Received-Date: Tue, 26 Jul 2011 06:52:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jul 25, 2011 at 11:58 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 26-07-11 03:07, Joel A Fernandes schreef:
>> Have U-boot detect if user button was pressed and set a boot argument so that user space can use this information
>
> Where's the matching u-boot patch?

There's no U-boot patch, the user.txt file installed by this recipe
will contain the extra boot argument.

Thanks,
Joel

[1]


