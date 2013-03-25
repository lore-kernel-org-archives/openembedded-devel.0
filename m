Received: from mail-la0-f48.google.com ([209.85.215.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UK7AW-0005d8-LJ
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Mar 2013 14:10:41 +0100
Received: by mail-la0-f48.google.com with SMTP id fq13so11138218lab.21
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Mar 2013 05:53:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=/zVFDeDSFaXJ/Yb2CMh2j4SDqlq8SIgznB6iwYPn7wE=;
	b=mL+9LGqRHgrJ+bNTV+wN+cqlbtIYhesKBk00tHMMoyqMf/4orgiteE+suBGd7W5qjo
	OvLxG6HuXYMnLWWAzIvAjPZ/QJRlCiSGJHnkIsDevWcMLveTTCNhNufSJxmuEL1+vidx
	OVPXQtiqYl0mppbTfuA3gKOp5CNcTpFk08jmHTsfcMEwDP6kHffqxkTxM+GiNg73VWy0
	9xfNauHqQdXTI6TZ+3653LX8pMueQ1oZzZQQ7pYiKqxHPca8vq3Sg3z71+ZqXG4N54HH
	0CFwxxc3XgN6lXcjIr8pd59a/OxJZlsCZ2AD4MX0X/U7l9iOQT0GZht3YhdjoYlKrU15
	0vRw==
X-Received: by 10.112.82.164 with SMTP id j4mr6048032lby.112.1364216014463;
	Mon, 25 Mar 2013 05:53:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.114.81.231 with HTTP; Mon, 25 Mar 2013 05:53:14 -0700 (PDT)
In-Reply-To: <CALbNGRQ7B6x55wvuwSkZy6TwMV73VLAMbKJFS+f1D-dr6Rkfpg@mail.gmail.com>
References: <cover.1363973088.git.ross.burton@intel.com>
	<9ef1ee1552757f3cf5cb979a9df7cf45f38b2f7a.1363973088.git.ross.burton@intel.com>
	<CALbNGRQ7B6x55wvuwSkZy6TwMV73VLAMbKJFS+f1D-dr6Rkfpg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 25 Mar 2013 12:53:14 +0000
Message-ID: <CAJTo0LZ9+bq9_SZAWziKoDeRw0kJMCjwR=-m7FTCOqT3wuaUSA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQlDupeAK4/CLo76/QlEXU1+K8qXuYyFYRKLANv0JGAm1WTH8bujr+Jvq14lp3EK377Qat18
Subject: Re: [PATCH 01/22] busybox: enable systemd integration for syslogd
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
X-List-Received-Date: Mon, 25 Mar 2013 13:10:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Andreas,

On 25 March 2013 12:47, Andreas M=C3=BCller <schnitzeltony@googlemail.com> =
wrote:
> Wanted to give patches 01 & 02 a test - to fix tmp.mount issue. patch
> 01 does not appear in patchwork and in gmail 'Show original' I see
> only binary data garbage. Did something go wrong on transmission?

The patch has UTF-8 content (your name, ironically) which must be
setting patchwork.

There's a branch in poky-contrib, ross/systemd.

Ross


