Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com
	[209.85.218.48])
	by mail.openembedded.org (Postfix) with ESMTP id 363267503E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Aug 2018 23:46:24 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id p84-v6so6033985oic.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Aug 2018 16:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eLhhJIIMur/kVNndq1otpCTfggAOLFqoxOVpWl5Q8eY=;
	b=Dmadcb+xVV2WAChqjZgqn63GwL4fUdYVER/M+bedTfoh33kg4YXQ4q0xcsT+0KAYAE
	CQJQNuJROlRDaVng/4Xns4MmenmgH+foORrOil+XRPXjqCHZSZpw9jDmMFAoYMcsAHh+
	RdBLKlQ6ig5SjaoIHOWPcQXKhEDsx0Amz+NLqQwMFdDUV54LQxTh6La6YbNEDL3uEe3N
	znOAQuycqk2es6W/jpuAOPDBCTIm5mD1ijxtS42f6+z8NFIUxg4VeBDKO9lExdBq/faT
	89gM51BEoVip+KPUVAwLaCe6JikTkjiDtvpm/vI/UBH+j8Mrv/bp4SdumP2il3A3/wBw
	Unbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eLhhJIIMur/kVNndq1otpCTfggAOLFqoxOVpWl5Q8eY=;
	b=pZ+ntSkdRMzxib3apLXlghFIcJhRf3m2RHJZuC4WoHX+WGsISVc3bT99OL9n8bFong
	4aV5rzNpMUmMDsyLMoipCMQEsDTcM2n5E9WA7GxxOwywD2FeI3jbJ8btdvgE0nw4psuJ
	bFulR8bXTEOh+/xYe2qZ1al96LAhrHWdwzTw6Po8eLI72Kez2v/JuQSPr9QXWnOPiL+F
	RoWOQH1sXTFPS3HMUhAZtvsOvsLTsDctMXIcCdLPJN4kJYFDirab55RnBAVr1F1dFi2+
	kRdSzVLOAryiZY4MQUarvKTLj6d7FTm1A6lvP+i2p1TDa5tGPNA8FtgiO0QgCTtUMHda
	89Aw==
X-Gm-Message-State: APzg51DrjAXtlGZfXIMHgD2adX3FNP4WG26Obl33aRVdIaXq7VtAGRCr
	8Iu9Hjsg5mnYCiYDryyVQR3hsotqX7tHwzc8RP0=
X-Google-Smtp-Source: ANB0VdYOLqI/bpFcRN2DIaoSle0y4r7K+kWN1El4AGSqFkCKm0CKG9Qn/SRAXHeR19R297GQyKMi/+YvMG8nQWo14GA=
X-Received: by 2002:aca:f488:: with SMTP id
	s130-v6mr326735oih.269.1535499985162; 
	Tue, 28 Aug 2018 16:46:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:454b:0:0:0:0:0 with HTTP; Tue, 28 Aug 2018 16:46:24
	-0700 (PDT)
In-Reply-To: <6811474E739E4AD599463CACAD2CDF1B@ThinkpadOdile>
References: <6811474E739E4AD599463CACAD2CDF1B@ThinkpadOdile>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 29 Aug 2018 01:46:24 +0200
Message-ID: <CALbNGRRBM_7qdfJwr8=j-diPX--W8hE9iFtuVtfVB6D5mauZ=g@mail.gmail.com>
To: raiatea <raiatea@ymail.com>
Cc: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: meta-gnome
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
X-List-Received-Date: Tue, 28 Aug 2018 23:46:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 28, 2018 at 1:46 PM, raiatea <raiatea@ymail.com> wrote:
> Hello,
Hi Raiatea,

I put meta-openembedded mailing list in CC - there are more people who
might help you.
>
> I'm a beginner so the question might be stupid.
Don't think so :)
> I found your email in the readme of meta-openembedded-sumo as layer
> maintainer.
As far as I can remember, I am maintainer on meta-xfce a layer within
meta-openembedded - but never mind.
>
> I'm using an Ultra96 board with a Xilinx Zynq, Xilinx provides the tool
> Petalinux based on Yocto.
> I would like to use a window manager but things are evolving:
>  - Sato/Matchbox is too simple for my need
>  - elf (Enlightenment) has been removed
>  - Xfce could be fine
My personal favourite - use it most: A classic desktop with many
features/plugins/configurations. It is fast on weak hardware and does
not need graphic acceleration.
>  - Gnome : I don't clearly see if all required files are present
>
> In pyro: 49 recipes including gnome-session/-settings...
> I don't know if this is enought for a complete install, but it is more than
> what is present in rocko and sumo:
>
> In rocko : 35 recipes, without session...
> In sumo: 25 recipes, without session...
>
> I think the last Xilinx tool of 2018.2 is using sumo, so meta-gnome is
> uncomplete (a previous version used pyro and had efl, but I would like to
> use the last tools if possible). Maybe things are elsewhere.
>
> Could you tell me how I can manage meta-gnome for a complete install ?
> Are there packagegroup files for gnome, or should I create them ?
To build a Gnome3 desktop many recipes missing in meta-gnome. Few
years ago we had Gnome2 desktop working but it never made it to
Gnome3. Many recipes were removed meanwhile - old sources turned into
maintenance burden. Left over are applications and libraries.

If you are looking for desktop environments and have no problem in
building/using Qt5 [1]: In [2] you find

* kde5/plasma: Very beautiful but hungry of resources of all kinds -
no way without accelerated OpenGL(ES) or on weak machines (CPU/RAM).
* lxqt: Very fast / low memory consumption but a bit lightweight in
features (my opinion)
* lumina: Interesting but appears a bit unfinished to me

All of them work perfectly fine on sumo.

[1] https://github.com/meta-qt5/meta-qt5
[2] https://github.com/schnitzeltony/meta-qt5-extra
>
> Best regards,
> Raiatea
>
Hope that helps,

Regards

Andreas

