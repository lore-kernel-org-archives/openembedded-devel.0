Received: from mail-vb0-f44.google.com ([209.85.212.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Tlf2C-0000pC-Qd
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Dec 2012 13:15:32 +0100
Received: by mail-vb0-f44.google.com with SMTP id fc26so3606339vbb.31
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Dec 2012 04:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=utmL4NxgxjLUED+O7nJSzf1ebWYJvXBWP3fdbs6wEHA=;
	b=dEuSa8skTiNUsECHtdbOxWHFJSsKKbz4JhnNHAlCYlYlreMBQmb+LglOlV97Cw5Yh2
	rvZazB/NzCRGvddCTB3SzlkgUevk3ICOYe7i9ok4pY0PT2eOlKUJDUiPa2z326RCMSeV
	Tc40oFggM+lJwv1GBx2P1fIKWs2dX/aKInVq62hzNn7cyNoLA2oLJBTj0jPaocVqdecU
	9URKh/84uRdTtSmDXLpojrdQ68VXGnP6kDIKObyBogCmpqY/5SNlDtAT8q//7ofaLy3H
	RbXX7pYHWxRtIt1nLSmxcLwTD373oIbo/lUXYGoa1NlcQy2gGuIdCdttBsCJPEC1q+DI
	kJqQ==
MIME-Version: 1.0
Received: by 10.220.108.142 with SMTP id f14mr13998641vcp.9.1356004848087;
	Thu, 20 Dec 2012 04:00:48 -0800 (PST)
Received: by 10.52.95.243 with HTTP; Thu, 20 Dec 2012 04:00:47 -0800 (PST)
In-Reply-To: <20121218153311.GB3331@jama.palm1.palmone.com>
References: <1355312146-24370-1-git-send-email-schnitzeltony@googlemail.com>
	<CALbNGRT1HUF5RcEwRcCrT_XRJzHE+qA5HgeJO-smuymz90JxzQ@mail.gmail.com>
	<20121218153311.GB3331@jama.palm1.palmone.com>
Date: Thu, 20 Dec 2012 13:00:47 +0100
Message-ID: <CALbNGRSpX154UsyMo1G29G1nJ2qwvfyavO20qto5eT22YPEYnA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-gnome] gvfs-gdu-volume-monitor: avoid double packaging gvfs locale
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
X-List-Received-Date: Thu, 20 Dec 2012 12:15:33 -0000
Content-Type: text/plain; charset=UTF-8

> Btw meta-guacamayo is using newer gvfs-1.12.3 and maybe they also
> resolved
> http://patchwork.openembedded.org/patch/16755/
This one was fixed in 211c2ba382d921519761bc0d241942f927cf692e
>
> Can you check if such upgrade would be usefull for meta-gnome too?
> I'm not using gnome..
Will do that hopefully before Xmas..

Andreas


