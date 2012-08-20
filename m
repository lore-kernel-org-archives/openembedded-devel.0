Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T3Uew-0002yG-EB
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Aug 2012 18:16:58 +0200
Received: from mail-gg0-f180.google.com ([209.85.161.180])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 20 Aug 2012 09:04:54 -0700
Received: by ggmi2 with SMTP id i2so4618974ggm.25
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2012 09:04:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=aJi+Iz7yueQckyUJ0N4+BU5ZFZqiZpy/FMC0dzJxOtU=;
	b=Fp8ch8w4CFycH0hUoKR1ODP43HZOQ9FlJqkvKT9ML1WIksAuz7+5NXG/lojmRo5nbF
	tcqS7q9Fo7GSo6pjRuFg6rrArsgTPim+/dKSOuXVDj+78JEpqAB9hloN7TrbilTn+fs5
	RhrddlMFeSCl+Oo3IQFsmSTEYQRmLYRF+DLXJVYSXzIjglpnRWskDv/2yJoCL3j2dslq
	Y2THSOd2LQqfmYyv1pOXc4bsqaGIcjsI7j+UEmqqQ4FqhvqNeX2JdkfNbAC6ctvdnt2Q
	jdfp4jBD17c1WgFQrBZQX2wDdgot5HRwFesB4rXYph0Wj4S86HOLbFlB6W3KDvMxC6zu
	j7Kw==
Received: by 10.60.29.72 with SMTP id i8mr10529767oeh.26.1345478693259; Mon,
	20 Aug 2012 09:04:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.158.3 with HTTP; Mon, 20 Aug 2012 09:04:32 -0700 (PDT)
In-Reply-To: <CAJTo0LaVNaSuB+fydETP1MLaZvUZ-zTFFJfbqDav9SYEhimZRA@mail.gmail.com>
References: <1345056951-14036-1-git-send-email-ross.burton@intel.com>
	<1345056951-14036-3-git-send-email-ross.burton@intel.com>
	<20120817115300.GF3625@jama.jama.net>
	<CAJTo0LZdQ_fNkxZ0CthJHKS4ciVr7wRGw1UCYUedKoAuTR4bKg@mail.gmail.com>
	<20120819193538.GA3063@jama.jama.net>
	<CAJTo0LaVNaSuB+fydETP1MLaZvUZ-zTFFJfbqDav9SYEhimZRA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 20 Aug 2012 17:04:32 +0100
Message-ID: <CAJTo0LZcc81EL+yY9iL9VT8hRoVd-p6yEnX3_zEmSq-i1=zhGw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQmn2VS/aOKS3+5C4k5joOC6m6riWDRuNwEHME09BGk/DxNNw1wOInzElR4FqUqdHmGEyeLJ
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
X-List-Received-Date: Mon, 20 Aug 2012 16:16:58 -0000
Content-Type: text/plain; charset=UTF-8

On 20 August 2012 16:59, Burton, Ross <ross.burton@intel.com> wrote:
> In replying to this mail I remembered about this.  I'll send another
> patch with the poky overrides removes but the variables still in place
> in case someone else builds a matchbox-based system that supports the
> owl menu tricks.

Sent again.  Merging these would be much appreciated, I'm trying to
clear the cruft in oe-core. :)

Ross


