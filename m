Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lamiaposta71@gmail.com>) id 1RRpnZ-0001sv-W0
	for openembedded-devel@lists.openembedded.org;
	Sat, 19 Nov 2011 19:37:58 +0100
Received: by vbbey12 with SMTP id ey12so1255669vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Nov 2011 10:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=cXHVWhkeKDCvgKdtD1seRHLwu+OQQjpr10gulNAY7Zg=;
	b=rO9zRxFfZ1Y8oYcufZBjw7vnGBJdhbxdJPlQYgsoXh1i16GY9IIoRBExMGiQ92S/9r
	eksQ8C0M9J1ykh9VtbGYasvzWq3Ca1qXKHVWz+9RH3WLB+Y0E2dKPIt9ps6tAACZRagP
	alXVpTJVeeGS6tlYk3e3pn2puSbxr7XVcWO1A=
MIME-Version: 1.0
Received: by 10.224.186.199 with SMTP id ct7mr3458383qab.41.1321727489930;
	Sat, 19 Nov 2011 10:31:29 -0800 (PST)
Received: by 10.229.88.195 with HTTP; Sat, 19 Nov 2011 10:31:29 -0800 (PST)
In-Reply-To: <294F4A1A-29D7-492E-9E2F-2414F63F7C77@ti.com>
References: <CAFU7RzPxXLOA2FUQC7v-VuOmZ_G6_5gwokHy4vNt_WB-pcOn7g@mail.gmail.com>
	<294F4A1A-29D7-492E-9E2F-2414F63F7C77@ti.com>
Date: Sat, 19 Nov 2011 19:31:29 +0100
Message-ID: <CAFU7RzMcarY1wMNvosJiZzqBaHvBjkKjExp9ko9X4VoThb63yA@mail.gmail.com>
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
X-List-Received-Date: Sat, 19 Nov 2011 18:37:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 19, 2011 at 12:51 PM, Kridner, Jason <jdk@ti.com> wrote:
> On Nov 19, 2011, at 3:07 AM, "Raffaele Recalcati" <lamiaposta71@gmail.com=
> wrote:
>
>> I'm sorry for so easy question!
>> It seems that if I compiling for beagleboard I get a 2.6.39 running
>> also on dm3730 cpu.
>
> I recommend moving on to OE-core and meta-ti if you are doing new develop=
ment. That is 3.0 today, but I expect we will bring it in-line with the Bea=
gleBone kernel.

Thx,
monday I'll try.
If I'll have some problems I'll ask.

>> It's not clear to me how can dsp codec work correctly at the same time
>> with omap3530 and with dm3730.
>
> Same DSP? =C2=A0There are fairly few differences between those two device=
s. =C2=A0Mostly a process shrink and incremental improvements.

Nice.

Raffaele


