Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lamiaposta71@gmail.com>) id 1RSuFJ-00008S-4L
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Nov 2011 18:35:01 +0100
Received: by qyk9 with SMTP id 9so290688qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Nov 2011 09:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=kfbrOVao1pA3chKTOap6w4DOn21/T2o/bATM/+mhIwI=;
	b=rTLXlMVSeySvBgcYKMypT/4MCapXWMPyxTAr68tZzkWxQ4xu/2AoSLQRS+eCsxlr4m
	o7heE+Q2/g80hftA9pDSUnbScfdvNmuwfz10ztJdV6ufDcmhZUmpM6+uDIUGPvYTBfNh
	pAlqpbrbj9XMrqhlDq8ghNzwTlWo+l2g2IKsY=
MIME-Version: 1.0
Received: by 10.229.191.2 with SMTP id dk2mr2326926qcb.32.1321982909344; Tue,
	22 Nov 2011 09:28:29 -0800 (PST)
Received: by 10.229.2.80 with HTTP; Tue, 22 Nov 2011 09:28:29 -0800 (PST)
In-Reply-To: <CAFU7RzNgSSHEGchnv2cJ1HtHrCa=QsOBivBfdqtybjqGCLKDEw@mail.gmail.com>
References: <CAFU7RzPxXLOA2FUQC7v-VuOmZ_G6_5gwokHy4vNt_WB-pcOn7g@mail.gmail.com>
	<6297782.2EN2Ceo0kI@helios> <jae01t$scs$1@dough.gmane.org>
	<2451003.Qx4lekPWFq@helios>
	<CAPOJ94PYDr0MF8C4s4no6d6hrW_sd8_GRioPrnsmxdQf0QyVJA@mail.gmail.com>
	<CAFU7RzNgSSHEGchnv2cJ1HtHrCa=QsOBivBfdqtybjqGCLKDEw@mail.gmail.com>
Date: Tue, 22 Nov 2011 18:28:29 +0100
Message-ID: <CAFU7RzNb6L6B+stCO+SOb1u+9yoqa9sPrpamnub+8KUbedQ67A@mail.gmail.com>
From: Raffaele Recalcati <lamiaposta71@gmail.com>
To: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Tue, 22 Nov 2011 17:35:01 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Nov 22, 2011 at 8:52 AM, Raffaele Recalcati
<lamiaposta71@gmail.com> wrote:
> Hi,
> it seems really better the oe-core architecture.
>
>> oe-core+meta-ti will not support dsp for new developers either, at
>> least not until ti-cgt6x is updated to correspond to the
>> ti_cgt_c6000_6.1.17_setup_linux_x86.bin currently available from TI,
>> or somebody makes the old binary available.
>
> I hope it will be fixed.
> I'm starting now and I find this message:
>
> MACHINE=beagleboard ./oebb.sh bitbake virtual/kernel
> ..
> Layers present in repository:
> openembedded-core/meta-skeleton
> openembedded-core/meta
> ..
> Using /home/sources/.oe/environment-oecore to setup needed variables.
> It is recommended to do '. /home/sources/.oe/environment-oecore' and
> run 'bitbake something' without using ./oebb.sh as wrapper
>
> I can not consider this message?
>
> Thx,
> Raffaele
>

Finally I have 3.0.10+ kernel running on beagleboard.
Thank you very much.
Now I'm trying to find the way to have qt+GLES and gstreamer-ti running.

Raffaele


