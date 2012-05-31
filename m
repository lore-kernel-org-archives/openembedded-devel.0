Received: from mail-gh0-f178.google.com ([209.85.160.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Sa4CW-0003Zc-9q
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 May 2012 14:10:00 +0200
Received: by ghbf1 with SMTP id f1so902872ghb.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 May 2012 04:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=xxukl6Wy3fSFzcXHArYirxxNZ7kqSNgtpeiLYPmRyI0=;
	b=BV6PDHIYoFE4kHLeJAbSsC1X0WqqyLjUOGs9Y2GAhR39Y7tiPM3EBOrorQ8DH2JPFt
	rHn5IRA9XCta1hsWDoxyHFBrH7i2LP5tHaBe8fEzkR0JpUxCm+s91SLPkY+NPyGUYJ4p
	TjncoebU3lsK0M8nA7q6QVAzq3s6/ME3+CIzdVIKWYzMIXDl0sySZIeVBlpeC73Xh6z6
	Sxy5XiHHL6gaX5Ga4nhnkB4BurRCvfVYfenIrXppCFmJmbWcHWNC80lOKc4D8g/RsdIu
	j2ZEMnjqeE1y3+GDroyPoAt1CDCeNBx3jQpbzgluBMNhCGLpPVb7GcHVjnqvNku1D4ul
	FBvA==
MIME-Version: 1.0
Received: by 10.50.149.170 with SMTP id ub10mr13211183igb.38.1338465579647;
	Thu, 31 May 2012 04:59:39 -0700 (PDT)
Received: by 10.64.18.10 with HTTP; Thu, 31 May 2012 04:59:39 -0700 (PDT)
In-Reply-To: <1337075267-9817-1-git-send-email-schnitzeltony@googlemail.com>
References: <1337075267-9817-1-git-send-email-schnitzeltony@googlemail.com>
Date: Thu, 31 May 2012 13:59:39 +0200
Message-ID: <CALbNGRSaFZS-q8-Qm-kZFS2NQ1KVRHfucZpsdSX+AdFRniCOOg@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-gnome] gnome-settings-daemon: fix staticdev QA warnings
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
X-List-Received-Date: Thu, 31 May 2012 12:10:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, May 15, 2012 at 11:47 AM, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
>
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
> =A0.../gnome-settings-daemon_2.32.1.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 =A06 ++++--
> =A01 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-setting=
s-daemon_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-s=
ettings-daemon_2.32.1.bb
ping?


