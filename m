Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T3P0n-0003li-KF
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Aug 2012 12:15:09 +0200
Received: from mail-ob0-f180.google.com ([209.85.214.180])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 20 Aug 2012 03:02:02 -0700
Received: by obceq6 with SMTP id eq6so8028790obc.25
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2012 03:02:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=fBZof7uNgHtEfe+1mw+M+B2I2qPlxPDf2bdhikPP5Io=;
	b=HV++AhmQHGOYLDoGQmkYgAyNkweeoficSVzystCIXR5vMy7B9xuN7AndH0uynt2gPL
	6uc7TchSnzx5ZNHGp+eR14RMiBtivtvcQvULOw4xmLqYJpLItWMqgrDaYCr7OLpDxqc0
	U2Xw1sS0fEDScp/t7IGvUCwWu23eubtPABmiO5cH+9xRQzr8hwHzp8wmdA857bAmQ/I7
	6EKZNBHf8GpeR0sgBQijPsx5Of+a637P8KW+o+Dzn/eR0pmHg9nxqRBPIXQ1CP0pVXWd
	I5hfNJGyHdyYr5MGooZvAmHKNwY/slTvTColYOJyG5PMjKKkWWBbrCju5nb8Go+uRWlP
	efmw==
Received: by 10.182.108.71 with SMTP id hi7mr10319774obb.21.1345456921446;
	Mon, 20 Aug 2012 03:02:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.158.3 with HTTP; Mon, 20 Aug 2012 03:01:41 -0700 (PDT)
In-Reply-To: <20120817121618.GH3625@jama.jama.net>
References: <CAJTo0LZpSd6LB+9W2kUcxfeU4GOVO5VOnLHMbHYT+1W6iVzcBQ@mail.gmail.com>
	<20120817121618.GH3625@jama.jama.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 20 Aug 2012 11:01:41 +0100
Message-ID: <CAJTo0LY717hPyoHqvW1nYuD2bgcRAG3JPVuYHUZy1gK1k+DZ1g@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQmNL61sEx0Cgv0DD6vB+0NUmyTBQyTpd8RVhRP/Abu7A9QOI5/DGYbC0mt2K7qkqRemqUax
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: RFC: One X Server To Rule Them All
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
X-List-Received-Date: Mon, 20 Aug 2012 10:15:09 -0000
Content-Type: text/plain; charset=UTF-8

On 17 August 2012 13:16, Martin Jansa <martin.jansa@gmail.com> wrote:
> Is it? where? I've merged it to oe-core about year ago..

You're right, I saw xserver-common and somehow ignored the "common" bit.

Ross


