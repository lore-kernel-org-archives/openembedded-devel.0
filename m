Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RjJSY-0001gu-TC
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Jan 2012 00:44:31 +0100
Received: by dake40 with SMTP id e40so1018858dak.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Jan 2012 15:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=LXEpMFvWrFFIIHcMlDhQHaKGqi4C+I9NvfNpG50+mt0=;
	b=hkzZD63uIMEdMCqZtqP/E7TC+tGFzWYE9yG0k2x73+oa2MPn8kkxs2mA6TPVI6o0bz
	E5hSGYnKW/pQpo5LUBifCdhycDxCm8TORnTqUxj/TadCpEdpOfPDUWhONc8Tj59BYMXv
	PtPjYC60G+40136qiqpgOO0HnUioVfC+yrX98=
MIME-Version: 1.0
Received: by 10.68.72.69 with SMTP id b5mr18728239pbv.120.1325893025352; Fri,
	06 Jan 2012 15:37:05 -0800 (PST)
Received: by 10.142.213.7 with HTTP; Fri, 6 Jan 2012 15:37:05 -0800 (PST)
In-Reply-To: <cover.1325806595.git.andrea.adami@gmail.com>
References: <cover.1325806595.git.andrea.adami@gmail.com>
Date: Sat, 7 Jan 2012 00:37:05 +0100
Message-ID: <CAAQYJAvmm==283LMot6GSoJ=_NXQQYrQfYYYhA3OoF0C-b4Dpg@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 0/2] xserver minor cleanings and commit of fbdev driver
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
X-List-Received-Date: Fri, 06 Jan 2012 23:44:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 7, 2012 at 12:32 AM, Andrea Adami <andrea.adami@gmail.com> wrot=
e:
> Andrea Adami (2):
> =A0x11-common: remove extraneous BSP customizations
> =A0xorg-driver: add xf86-video-fbdev from meta-openembedded
>
> =A0.../x11-common/x11-common/etc/X11/Xserver =A0 =A0 =A0 =A0 =A0| =A0 24 =
--------------------
> =A0.../xorg-driver/xf86-video-fbdev_0.4.2.bb =A0 =A0 =A0 =A0 =A0| =A0 =A0=
8 ++++++
> =A02 files changed, 8 insertions(+), 24 deletions(-)
> =A0create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-fbdev_=
0.4.2.bb
>
> --
> 1.7.3.4
>

please ignore

Andrea


