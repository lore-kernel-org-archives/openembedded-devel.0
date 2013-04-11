Received: from mail-ve0-f170.google.com ([209.85.128.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UQEZ7-0003Z9-3m
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Apr 2013 12:17:29 +0200
Received: by mail-ve0-f170.google.com with SMTP id 15so1269614vea.29
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Apr 2013 02:59:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=0mByjNbr/SNum5rogYJgcHP3idGcZUEsLIAYiEnbZ3Q=;
	b=ZuL9TvayaNyJIJpXNSuO7S7bkIYP+3hj8fl+iQNlftJfIqkhLeh4SkaTiStElwnhV8
	oWYdNwCrrjBt0WILUGow/crWSl0l2CXVyqTljgw3l74Ajdjlkm/MaXYISgFjL8+n5hue
	I4zh/xokt2hrTwRK0ukL3fl1k6gdgxOou9U33yWydG76wvH2Hn1Q0RbuKm1rJ0ntL0s7
	0t7EmzA1bnAzPw677ozwefH93/Wrx3Y/Rujf2iXKkbv4cWsvMEGcWDfkAjbkSZwZS1NI
	iJTHUF0C4L+Fsw/qWLCWYoJ+yg29L+ATHznZBK//GcTFMQHJuSWWTosEzji0eA7HU6Wk
	gvkA==
X-Received: by 10.58.188.48 with SMTP id fx16mr4455293vec.22.1365674390009;
	Thu, 11 Apr 2013 02:59:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Thu, 11 Apr 2013 02:59:29 -0700 (PDT)
In-Reply-To: <20130410211711.GG2471@jama>
References: <1360776335-21633-1-git-send-email-raj.khem@gmail.com>
	<20130305221857.GA14869@jama>
	<CALbNGRRZFt3FgMCjyB8JN8Be1w_-Vdgnq=2nZy3tyUM0TxdFpA@mail.gmail.com>
	<20130305225907.GB14869@jama> <20130409200127.GF2474@jama>
	<F52AA45C-FB86-4749-95C0-0DA24BC50DFB@dominion.thruhere.net>
	<CAJTo0LZga4SoPiHOCVTQizutkcfe-417jx+fuHxCira--QWiGQ@mail.gmail.com>
	<20130410211711.GG2471@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 11 Apr 2013 10:59:29 +0100
Message-ID: <CAJTo0LYRTeois4APOwo4ezwDUXH2vK1QOP9B6gagTxnZinKCRQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQmXBrfoO89WqTovfpmyv+Iu4oN2wOcDnWzNQGRsyhGnO5h9aKNzW0Q6T6WKqxBrO/yzr4mi
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: meta-systemd future vote Was: [meta-systemd][PATCH 1/2] Delete systemd class.
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
X-List-Received-Date: Thu, 11 Apr 2013 10:17:31 -0000
Content-Type: text/plain; charset=UTF-8

On 10 April 2013 22:17, Martin Jansa <martin.jansa@gmail.com> wrote:
> I should have asked which Monday he meant.. it's still not fixed
> connman:
> http://lists.linuxtogo.org/pipermail/openembedded-core/2013-March/037355.html
>
> util-linux:
> http://permalink.gmane.org/gmane.comp.handhelds.openembedded.core/34410
>
> and I can find a lot more in my sent folder if I really care :/.

Thanks Martin, I'll chase those.  Probably too late for 1.4.0 but
obviously we can fix in master and add to 1.4.1.

Ross


