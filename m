Return-Path: <andrei@gherzan.ro>
Received: from mail-we0-f182.google.com (mail-we0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id 5979F6A463
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Dec 2013 18:32:09 +0000 (UTC)
Received: by mail-we0-f182.google.com with SMTP id q59so6966785wes.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Dec 2013 10:32:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=B/XoKeomZ04FS2CO3vgLRImmloH73LV5pQn4TqSKWxw=;
	b=FvbvQhtkY6PC4ET6DHudYVyTQyCmQ+Bu8ymI9SzVDOH85vPputarVA4QEDTtj20wTE
	gpyed3+TS5gQk1y6WBHIG1EZWKzWyR16z8tbgoE9MRXfFl88283nu2JP/lj+LncethBk
	IiO1UnUhZmqjScSUxFdd0WlE+uLnR1tbnO8ZT6tvca6EPcnybl3q1M6WchUS3jhKxqza
	AZA9CLsbOAfwRj6xymDMU8K9Mp7zZZO+jA+j3Su8Ysu0mXHPxSKSSBzIVJNo7Wv99jWK
	9f4dvK2h0kJPjFZoaTQ0muRycTwMfxr0miUFCFzgB0/0ViNYxl/y5GBIwQ4J3UBwmZfo
	fx0Q==
X-Gm-Message-State: ALoCoQlCh3b3YT14AhUSQA8fMrl2tg6y67HEuJWOf3hWV9qx4gYHpHtd8fofaS1+I1ZRt2MAu14+
X-Received: by 10.194.48.74 with SMTP id j10mr2691828wjn.41.1386786728186;
	Wed, 11 Dec 2013 10:32:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.217.150.199 with HTTP; Wed, 11 Dec 2013 10:31:48 -0800 (PST)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <l84k1k$skh$1@ger.gmane.org>
References: <1386522214-7407-1-git-send-email-andrei@gherzan.ro>
	<l84k1k$skh$1@ger.gmane.org>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Wed, 11 Dec 2013 20:31:48 +0200
Message-ID: <CAK18fxFP3Cr=VZ8ZY45yhJM++TNWCdfnf-GVsrwoTFuueoLkUw@mail.gmail.com>
To: openembedded <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-multimedia][PATCH] xbmc: Update to v12.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Dec 2013 18:32:10 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Dec 9, 2013 at 4:31 PM, Koen Kooi <koen@dominion.thruhere.net>wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Andrei Gherzan schreef op 08-12-13 18:03:
> > * added missing dependency on taglib * remove already merged patches *
> > define PACKAGECONFIG for sdl, airplay and ssh configuration * have above
> > PACKAGECONFIG values activated by default * use internal ffmpeg - there
> > are some known issues while compiling with external libav * define
> > use_arch to be passed to internal ffmpeg configuration script
> >
> > Signed-off-by: Andrei Gherzan <andrei@gherzan.ro> Change-Id:
> > I538f4907a9d1dd5df31648bfb60a18cacfed9d69
>
> Looks OK to me, but I haven't tried to build it yet.
>
>
Please put it on hold. I will push another version of this.


-- 
*ag*

