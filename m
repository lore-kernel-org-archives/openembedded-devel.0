Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8045E73064
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2017 15:07:30 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id t8so2737640vke.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2017 07:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=FZ0vVAkA/3ZzRknOxYGAkviilgeai6RPzMG7rQtg8Ng=;
	b=UaJ8sieb/3S/iIDhiRx/2KnT9yZDahzFf6jEyBv3lAnSDX1TjSdAl80Om37GLCAW9R
	vOTK8j20WGmS2k+V7cg2JLtlWHSpOtmJDqoMtUYVKtEIHb+UbWRf72pz84hJitrhF4NA
	zBhdn00KIQ8qP1b4ppzVmFDZxScumKWFHzvn1KKPXtrFTJ71vUKFfiyJjPfLBcLFjn5C
	J7dcXiGCWKzQ3qzS6NcmvVUyqmQQszNddHVeJVwizevf1218B6wrVK4IzYhuNxl8W8eJ
	mdbJ0FtmyR8DBxTlBW/pSW6iX9IocpkwULapu7bbdLetQU1OBI3zwEPHBms+/1c/wy4K
	dSBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=FZ0vVAkA/3ZzRknOxYGAkviilgeai6RPzMG7rQtg8Ng=;
	b=P73P+30BPItdd3LtAXcO4oGWdtcdAK5vC8i9QlVU8dE2trnVHUjcL9yiCdzchU8D7g
	qlOjTfPhyISAItRLKEC6bzM1MWuS1/4VxiF8ZT+YpkA1W/aLSRk8ChMBysza2WqWa/sI
	vCYgajxa157TFN8vuhk8Xv8iZHbEP48t5x0aSk3lZn0bcbBF5nUIdbJ3AHc0eN7g1xRR
	f3Y+62E8xMD/IuyH1k034rjvuH6RJnjAk4YdvqrN2ylNAtiEFWZcNEgCgLM8nZ4Nzu/j
	hn/Xqmwq7la9sz81/NgNSYZ996x5+qI9OhNKxfG04/VEFbbL1qf49+JyybQCcfBl7f1V
	44LQ==
X-Gm-Message-State: AMke39k+gDDRNcIj5qPxtx3t2eoZSc7UXSTvWnJDoytmbS+vf8B8m0qFsc+W0DBfa2za4uw3vFj9d508P+9x8g==
X-Received: by 10.31.8.147 with SMTP id 141mr19625833vki.111.1487862451622;
	Thu, 23 Feb 2017 07:07:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.71.65 with HTTP; Thu, 23 Feb 2017 07:07:31 -0800 (PST)
In-Reply-To: <20170223143238.GC3300@jama>
References: <20170222230250.30288-1-schnitzeltony@googlemail.com>
	<20170222230250.30288-6-schnitzeltony@googlemail.com>
	<20170223105259.GA3300@jama>
	<CALbNGRSr2VNR6P=u23u=ecchFCOs=cNwPmDYGz92fwbtmB-xLw@mail.gmail.com>
	<20170223125901.GB3300@jama>
	<CALbNGRQ3rfUFAhKqpMhT9yGhWJ3RPDSn9cGtVUhoMvuFNvyvBQ@mail.gmail.com>
	<20170223143238.GC3300@jama>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Thu, 23 Feb 2017 16:07:31 +0100
Message-ID: <CALbNGRR7+C+HchBmzuxZjSXjVmeyqhrQ+87eWikfe5Fuu9Z0sQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 05/11] abiword: unblacklist - gtkmathview is back
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Feb 2017 15:07:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 23, 2017 at 3:32 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Thu, Feb 23, 2017 at 02:31:37PM +0100, Andreas M=C3=BCller wrote:
>> On Thu, Feb 23, 2017 at 1:59 PM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
>> > On Thu, Feb 23, 2017 at 01:20:05PM +0100, Andreas M=C3=BCller wrote:
>> >> On Thu, Feb 23, 2017 at 11:52 AM, Martin Jansa <martin.jansa@gmail.co=
m> wrote:
>> >> > On Thu, Feb 23, 2017 at 12:02:44AM +0100, Andreas M=C3=BCller wrote=
:
>> >> >> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>> >> >
>> >> > Thanks for another round of fixes!
>> >> >
>> >> > All looks good except this one, see:
>> >> > http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.report.2017=
0223_005128.log
>> >> >
>> >> The link does not tell why abiword's do_configure fails - can you giv=
e details?
>> >
>> > The link shows:
>> > http://errors.yoctoproject.org/Errors/Build/32829/
>> > which leads to:
>> > http://errors.yoctoproject.org/Errors/Details/133989/
>> >
>> > configure: error: Package requirements (
>> >   fribidi >=3D 0.10.4
>> >   glib-2.0 >=3D 2.6.0 gthread-2.0 >=3D 2.6.0 gobject-2.0 >=3D 2.6.0
>> >   libgsf-1 >=3D 1.14.18
>> >   wv-1.0 >=3D 1.2.0
>> >   libxslt
>> >   gio-2.0
>> >   cairo-pdf cairo-ps pangocairo
>> >   gtk+-2.0 >=3D 2.12.0 gtk+-unix-print-2.0 librsvg-2.0 >=3D 2.16.0 cai=
ro-fc
>> >  x11) were not met:
>> >
>> > No package 'libxslt' found
>> >
>> Thanks - have overseen the links. This is the 'fedora is useless
>> without libxslt' problem - will send out V2 for abiword.
>
> Thanks!
>
> Isn't this the libxslt for target? I wonder why you're having issues
> reproducing these failures when our builds should be very similar with
> RSS.
>
> Of course missing glib-2.0-native dependency is different case, but
> target libxslt? Does it silently fallback to host's libxslt?
>
You are right - this is different - wonder what made me build without
errors. In configure.ac libxslt is searched by PKG_CHECK_MODULES
(->pkg-config). I ran on my build machine:

| pkg-config --cflags libxslt
| -> Package libxslt was not found in the pkg-config search path.

And the recipe has pkgconfig in inherit - strange.

Have morty-like environment active at the moment - so I cannot check
now. But this needs further investigation.

Andreas

