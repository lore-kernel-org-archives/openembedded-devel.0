Received: from mail-qw0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lamiaposta71@gmail.com>) id 1RSnh8-0003ul-30
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Nov 2011 11:35:19 +0100
Received: by qabj40 with SMTP id j40so46887qab.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Nov 2011 02:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=/C/Srtb0DH5Xb/lRQpNeutVY/4Zx5IP5Q3pkrKzWH4E=;
	b=SaiMxw0jbUdAqsxfrN6bimPp2/891P+HXBhAsJ0SiQVlajGS02UhdgPZ+nki2Op1mV
	CwQxdr7b4jNNl7fZP27fi4SCQ/iAhqUV2lE/Fw60JM7zl/ooQDmVgrtZjN2rFvec7Bxe
	BxR6XloEKXxuxz5nBVMUUgUx8nA92n4+yhMiQ=
MIME-Version: 1.0
Received: by 10.224.73.19 with SMTP id o19mr7224703qaj.61.1321948342328; Mon,
	21 Nov 2011 23:52:22 -0800 (PST)
Received: by 10.229.2.80 with HTTP; Mon, 21 Nov 2011 23:52:22 -0800 (PST)
In-Reply-To: <CAPOJ94PYDr0MF8C4s4no6d6hrW_sd8_GRioPrnsmxdQf0QyVJA@mail.gmail.com>
References: <CAFU7RzPxXLOA2FUQC7v-VuOmZ_G6_5gwokHy4vNt_WB-pcOn7g@mail.gmail.com>
	<6297782.2EN2Ceo0kI@helios> <jae01t$scs$1@dough.gmane.org>
	<2451003.Qx4lekPWFq@helios>
	<CAPOJ94PYDr0MF8C4s4no6d6hrW_sd8_GRioPrnsmxdQf0QyVJA@mail.gmail.com>
Date: Tue, 22 Nov 2011 08:52:22 +0100
Message-ID: <CAFU7RzNgSSHEGchnv2cJ1HtHrCa=QsOBivBfdqtybjqGCLKDEw@mail.gmail.com>
From: Raffaele Recalcati <lamiaposta71@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: dm3730
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
X-List-Received-Date: Tue, 22 Nov 2011 10:35:19 -0000
Content-Type: text/plain; charset=UTF-8

Hi,
it seems really better the oe-core architecture.

> oe-core+meta-ti will not support dsp for new developers either, at
> least not until ti-cgt6x is updated to correspond to the
> ti_cgt_c6000_6.1.17_setup_linux_x86.bin currently available from TI,
> or somebody makes the old binary available.

I hope it will be fixed.
I'm starting now and I find this message:

MACHINE=beagleboard ./oebb.sh bitbake virtual/kernel
..
Layers present in repository:
openembedded-core/meta-skeleton
openembedded-core/meta
..
Using /home/sources/.oe/environment-oecore to setup needed variables.
It is recommended to do '. /home/sources/.oe/environment-oecore' and
run 'bitbake something' without using ./oebb.sh as wrapper

I can not consider this message?

Thx,
Raffaele


