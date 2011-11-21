Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lamiaposta71@gmail.com>) id 1RSW3D-0006af-BX
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Nov 2011 16:44:56 +0100
Received: by ywt2 with SMTP id 2so4813567ywt.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2011 07:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=/g85bSegBQCq8fDQLM/9f7OIPjZXWSsXtkeNp/yZxXc=;
	b=p5EsmxtQuIImbnGIHbgB+bfD7ym8WnYAN5/V+22tfPq1efskWZ63KTPgq5mS9RjYfp
	co26YW5ZY4xyClfhyE2K2c/kh6wfb2EjPf0MMXE+RbuRuw1CNMWJKAc2PXPE9cga6Oqw
	8Pa1YZHWC+sxOxiMZJv0Uv7r9MDbN4Yfxn8RI=
MIME-Version: 1.0
Received: by 10.50.94.229 with SMTP id df5mr14887662igb.27.1321889905315; Mon,
	21 Nov 2011 07:38:25 -0800 (PST)
Received: by 10.231.123.91 with HTTP; Mon, 21 Nov 2011 07:38:25 -0800 (PST)
In-Reply-To: <294F4A1A-29D7-492E-9E2F-2414F63F7C77@ti.com>
References: <CAFU7RzPxXLOA2FUQC7v-VuOmZ_G6_5gwokHy4vNt_WB-pcOn7g@mail.gmail.com>
	<294F4A1A-29D7-492E-9E2F-2414F63F7C77@ti.com>
Date: Mon, 21 Nov 2011 16:38:25 +0100
Message-ID: <CAFU7RzMM=ur61PsQdBwbG2m9XT4ubCcD8Be4LiiUtFX=js_EhQ@mail.gmail.com>
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
X-List-Received-Date: Mon, 21 Nov 2011 15:44:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Nov 19, 2011 at 12:51 PM, Kridner, Jason <jdk@ti.com> wrote:
> On Nov 19, 2011, at 3:07 AM, "Raffaele Recalcati" <lamiaposta71@gmail.com=
> wrote:
>
>> I'm sorry for so easy question!
>> It seems that if I compiling for beagleboard I get a 2.6.39 running
>> also on dm3730 cpu.
>
> I recommend moving on to OE-core and meta-ti if you are doing new develop=
ment. That is 3.0 > today, but I expect we will bring it in-line with the B=
eagleBone kernel.

It's ok.
I have the new monster to compile.
I have followed https://wiki.yoctoproject.org/wiki/OpenEmbedded-Core
setup and started, without changing anything, a compilation of
'bitbake core-image-minimal', to test my setup.

Waiting it ends can I go on preparing the setup for beagle-xm with
GLES and gstreamer-ti running?
Is maybe the right starting point
https://github.com/koenkooi/Angstrom-integration-layer.git?

Maybe at http://beagleboard.org/esc/boston2011/beagleboard101 there
should be a presentation about that, but the link is broken.

Thx,
Raffaele



>> It's not clear to me how can dsp codec work correctly at the same time
>> with omap3530 and with dm3730.
>
> Same DSP? =C2=A0There are fairly few differences between those two device=
s. =C2=A0Mostly a process shrink and incremental improvements.
>
>>
>> Thx,
>> Raffaele
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
www.opensurf.it


