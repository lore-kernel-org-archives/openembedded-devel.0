Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T3UZm-0002lE-HQ
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Aug 2012 18:11:38 +0200
Received: from mail-gg0-f180.google.com ([209.85.161.180])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 20 Aug 2012 08:59:34 -0700
Received: by ggmi2 with SMTP id i2so4613827ggm.25
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2012 08:59:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=VB6gNGOaBDlhBlniSuQmvt8RX9j8N5bbr2pQKxvDg9M=;
	b=Oq5ZeLQusJoRePpapbYVkxirV+nIh53xPvU8us/ijROQLWPrhLc/DdAIpt+xhteuTl
	QawX3oIp07CN6Adi9C+qxyY4Dc339uEwvEOxUWt7QBfn8n6+/+XRRzVvx7VtKmRasuzq
	et3Th02bMkDoHJTIbHejK/qX2a2UYPIOf3Qf8kaLbOVjoiKOjm9WOUzHr1HeQQI8Vxjs
	VrfGupd1EAvh7hkMfCptu+nHKVOMG4F9shTNJ6EJ8EhRothA53q43pnLL7taLzcdR8CO
	Z+c/qSNtL/qYhW72C6omvABf2x8sZH2zGpw/C8gy6SivsBHLcpyzg7zcMAQGRmZjywl+
	/ulw==
Received: by 10.60.29.229 with SMTP id n5mr10426252oeh.103.1345478373162; Mon,
	20 Aug 2012 08:59:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.158.3 with HTTP; Mon, 20 Aug 2012 08:59:12 -0700 (PDT)
In-Reply-To: <20120819193538.GA3063@jama.jama.net>
References: <1345056951-14036-1-git-send-email-ross.burton@intel.com>
	<1345056951-14036-3-git-send-email-ross.burton@intel.com>
	<20120817115300.GF3625@jama.jama.net>
	<CAJTo0LZdQ_fNkxZ0CthJHKS4ciVr7wRGw1UCYUedKoAuTR4bKg@mail.gmail.com>
	<20120819193538.GA3063@jama.jama.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 20 Aug 2012 16:59:12 +0100
Message-ID: <CAJTo0LaVNaSuB+fydETP1MLaZvUZ-zTFFJfbqDav9SYEhimZRA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQnVokm5a5fQwltjGC/fBbFxfLDXaotJ+RJ0Dcsj9hD/Db3xMBuNDE5GuUbM9Piy4XXPJN+J
Subject: Re: [PATCH 2/2] meta-gnome: add evolution-data-server
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
X-List-Received-Date: Mon, 20 Aug 2012 16:11:38 -0000
Content-Type: text/plain; charset=UTF-8

On 19 August 2012 20:35, Martin Jansa <martin.jansa@gmail.com> wrote:
> Please do, so this bug doesn't became valid again :)
> http://www.shr-project.org/trac/ticket/2052

Sent.

> It can be without those poky overrides and at least it can be used to
> demonstrate how bad upstream version is (I never used it), but it
> probably doesn't have any good alternatives at least in OE metadata.

In replying to this mail I remembered about this.  I'll send another
patch with the poky overrides removes but the variables still in place
in case someone else builds a matchbox-based system that supports the
owl menu tricks.

Ross


