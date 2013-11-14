Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vb0-f51.google.com (mail-vb0-f51.google.com
	[209.85.212.51])
	by mail.openembedded.org (Postfix) with ESMTP id B0E3B6D59C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2013 21:48:43 +0000 (UTC)
Received: by mail-vb0-f51.google.com with SMTP id w5so2191218vbf.38
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2013 13:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=O7dnesXpFJOdMoHf0fRtjFrkA4Yoy8+fUxnDt8YWEfc=;
	b=apbevi+38/s0sGwWeBwxOgcjFf/TKDyjRxrp30qY8WEXkypS+k2HuyrtutiGFjLnxM
	a02UkRniRbuahncILMkwBeTje2DYTaCMyHFcfCUQrN3xxkcTqVlLIqg6seyDkVx57Su1
	h5S4rOAvZuGxzYctUQRsndIGFTBEr91u3lO+p7jdHh5+MDJo/Ope4rVbwj0aQ3dYHkBF
	BkXouGraCoQLYxFDDTDYoKBXQQ9MVpbuSg4TWXakEhjB0OJB9vbpQob9v2DVejhe2YQj
	xqmQBDPiGsink5H8wlQMhBRINVd8VoXtOBF0hIecWICeb3k56DyfeDQqAvwCN9T8U9l5
	OtuA==
MIME-Version: 1.0
X-Received: by 10.58.151.3 with SMTP id um3mr19859veb.97.1384465725033; Thu,
	14 Nov 2013 13:48:45 -0800 (PST)
Received: by 10.52.106.202 with HTTP; Thu, 14 Nov 2013 13:48:44 -0800 (PST)
In-Reply-To: <CAFeBWL7fDEJtkHosrJJUx76ssMiau+bb3EtATWoybNWyb=1FGA@mail.gmail.com>
References: <CAFeBWL4xeq+4cL9gvnCDSU1Va8edf+1zT+G7BfYto7Yvp8HXXQ@mail.gmail.com>
	<CAFeBWL4R46JrAhCfe8GZXTipHAp_i+Fcu_BTTTuopfdfKf9r5g@mail.gmail.com>
	<11078227.Ap2jLt1X9L@helios>
	<CALbNGRSiUdEzPLoP5Le58QDV1cqKcLRRyWxxTGyG4dKu7tqB3Q@mail.gmail.com>
	<CAFeBWL4YZ-izwN-3oaqfoaPSi=h=WQ+M0=BU_eGOXtx=q6AfPw@mail.gmail.com>
	<CAP9ODKpMTNOWRkHTv2gWEattq1Bhj-jvbBk80NLt23eV5UzUuw@mail.gmail.com>
	<CAFeBWL7fDEJtkHosrJJUx76ssMiau+bb3EtATWoybNWyb=1FGA@mail.gmail.com>
Date: Thu, 14 Nov 2013 22:48:44 +0100
Message-ID: <CALbNGRQcVwRpqKvWpgnNBpN-4bn+kJSj6m8j=eV0zme0md8j9w@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: libmpd-11.8.17 gets 404 Not Found
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
X-List-Received-Date: Thu, 14 Nov 2013 21:48:44 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 14, 2013 at 8:41 PM, Adam Lee <adam.yh.lee@gmail.com> wrote:
> Thanks Otavio. Quick question - is there a reason not to use the upstream?
> - http://www.musicpd.org/download/mpd/stable/
>
> Thanks,
>
> Adam
>
patches welcome - but please check for xfce4-mpc-plugin and xfmpc are
still building with mpc.

Andreas

