Received: from [64.233.184.234] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <leon.woestenberg@gmail.com>) id 1INuZT-0007H2-CW
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Aug 2007 20:04:49 +0200
Received: by wr-out-0506.google.com with SMTP id c46so189488wra
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Aug 2007 11:03:37 -0700 (PDT)
Received: by 10.90.95.11 with SMTP id s11mr5017705agb.1187805811210;
	Wed, 22 Aug 2007 11:03:31 -0700 (PDT)
Received: by 10.90.31.16 with HTTP; Wed, 22 Aug 2007 11:03:31 -0700 (PDT)
Message-ID: <c384c5ea0708221103j55239888gf0a3ee704adaa06a@mail.gmail.com>
Date: Wed, 22 Aug 2007 20:03:31 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <c384c5ea0708221059t640c0b23lad82421cd2686784@mail.gmail.com>
MIME-Version: 1.0
References: <c384c5ea0708201339j44462d85o286bbb548b256aec@mail.gmail.com>
	<46CA0337.9050709@gmail.com>
	<c384c5ea0708201452q3b596e76j8d7623cd6907c799@mail.gmail.com>
	<1187683447.6234.4.camel@localhost.localdomain>
	<c384c5ea0708221059t640c0b23lad82421cd2686784@mail.gmail.com>
Subject: Re: Add Intel Core 2 machine support (prescott and nocona)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Aug 2007 18:04:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello Richard,

On 8/22/07, Leon Woestenberg <leon.woestenberg@gmail.com> wrote:
> > When using optimised output like that you really do need to use a
> > different TARGET_ARCH since as you say, the packages will not run on
> > standard i686/x86_64...
> >
> That's why I suggested "x86_64-nocona".
>
Whoops, I didn't actually suggest x86_64-nocona as TARGET_ARCH.

BTW, I don't understand how the *value* of a variable may not contain
underscores.

Do I misunderstand when I think bitbake overrides apply to variable names only?

Regards,

Leon


