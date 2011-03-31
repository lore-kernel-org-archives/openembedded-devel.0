Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5P1w-0004hC-TB
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 23:03:49 +0200
Received: by fxm19 with SMTP id 19so2480156fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2011 14:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=2WxADMn1L1OndwQ4FQatGOW7/06IR+eEI6oNFFDeMPU=;
	b=sw56uTDbPKh/IqnFrrJBC20PJuDvL3w8oNLZylEbHr0bWudifIsSVVIbEP7WfUVJre
	/x3fLPcJevllNX+SW2ETWigo7TrOhcuTWuK1VWMDb+48Vuz3+jTm2WrDpTuadhxOiRei
	wOGq8w9Nev4MhTZKcB9fZZ/YfdvqKjpUZVmtg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=bQYmFOm/B6pcQY/wM9zlnvLLxjCJCKQ5LTTnNy/MIOfSMSeYMFfDW6lHcYSgcqJMXr
	+k5dKDCwzcDEgGpgvhJ/rFAFlwzp8zF1qAvP1n/zGuD2yv16pGvmk01vkui0IxavjWyw
	jw3r3OpMScy572PwUD0fH05g4E9OkNt5hlfHE=
Received: by 10.223.14.137 with SMTP id g9mr1970384faa.8.1301605308465; Thu,
	31 Mar 2011 14:01:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.23.136 with HTTP; Thu, 31 Mar 2011 14:01:18 -0700 (PDT)
In-Reply-To: <20110331204758.GG3745@jama.jama.net>
References: <cover.1301560589.git.Martin.Jansa@gmail.com>
	<8d76bc22e6b97944d4af16b2d9a6e318200d857b.1301560589.git.Martin.Jansa@gmail.com>
	<AANLkTimZoMAuYXF4BruMZyZVU8T_M-AcaJ8S2BWZVmtW@mail.gmail.com>
	<20110331204758.GG3745@jama.jama.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 31 Mar 2011 14:01:18 -0700
Message-ID: <AANLkTi=Tr-GvisGYU5QxzfCKqthzsRX-2mfuQQfjcYvO@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 7/8] task-x11-illume: add LIC_FILES_CHKSUM
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
X-List-Received-Date: Thu, 31 Mar 2011 21:03:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 31, 2011 at 1:47 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Thu, Mar 31, 2011 at 01:39:03PM -0700, Khem Raj wrote:
>> On Thu, Mar 31, 2011 at 3:17 AM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
>> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> > ---
>> > =C2=A0meta-efl/recipes-efl/tasks/task-x11-illume.bb | =C2=A0 =C2=A01 +
>> > =C2=A01 files changed, 1 insertions(+), 0 deletions(-)
>> >
>> > diff --git a/meta-efl/recipes-efl/tasks/task-x11-illume.bb b/meta-efl/=
recipes-efl/tasks/task-x11-illume.bb
>> > index 8b14adb..e197cc7 100644
>> > --- a/meta-efl/recipes-efl/tasks/task-x11-illume.bb
>> > +++ b/meta-efl/recipes-efl/tasks/task-x11-illume.bb
>> > @@ -1,6 +1,7 @@
>> > =C2=A0DESCRIPTION =3D "The Illume Windowing Environment -- install thi=
s task to get the Enlightenment Window Manager + the Illume environment."
>> > =C2=A0SECTION =3D "x11/wm"
>> > =C2=A0LICENSE =3D "MIT"
>> > +LIC_FILES_CHKSUM =3D "file://${TOPDIR}/meta-openembedded/meta-efl/COP=
YING.MIT;md5=3D3da9cfbcb788c80a0384361b4de20420"
>>
>> why not copy the license file to workdir first
>
> you mean introduce SRC_URI for task-* recipes?
>
> I don't really like hardcoding meta-openembedded path here, so maybe we c=
an introduce
> METAOEBASE for this, like oe-core does with POKYBASE in LIC_FILES_CHKSUMs

yes that would be better I think
>
> bitbake@jama ~/shr-core/openembedded-core/meta/recipes-core/tasks $ git g=
rep LIC_FILES_CHKSUM
> task-base.bb:LIC_FILES_CHKSUM =3D "file://${POKYBASE}/LICENSE;md5=3D3f40d=
7994397109285ec7b81fdeb3b58 \
> task-cross-canadian.bb:LIC_FILES_CHKSUM =3D "file://${POKYBASE}/LICENSE;m=
d5=3D3f40d7994397109285ec7b81fdeb3b58 \
> task-poky-boot.bb:LIC_FILES_CHKSUM =3D "file://${POKYBASE}/LICENSE;md5=3D=
3f40d7994397109285ec7b81fdeb3b58 \
> task-poky-nfs.bb:LIC_FILES_CHKSUM =3D "file://${POKYBASE}/LICENSE;md5=3D3=
f40d7994397109285ec7b81fdeb3b58 \
> task-poky-sdk.bb:LIC_FILES_CHKSUM =3D "file://${POKYBASE}/LICENSE;md5=3D3=
f40d7994397109285ec7b81fdeb3b58 \
> task-poky-ssh-dropbear.bb:LIC_FILES_CHKSUM =3D "file://${POKYBASE}/LICENS=
E;md5=3D3f40d7994397109285ec7b81fdeb3b58 \
> task-poky-ssh-openssh.bb:LIC_FILES_CHKSUM =3D "file://${POKYBASE}/LICENSE=
;md5=3D3f40d7994397109285ec7b81fdeb3b58 \
> task-poky-standalone-sdk-target.bb:LIC_FILES_CHKSUM =3D "file://${POKYBAS=
E}/LICENSE;md5=3D3f40d7994397109285ec7b81fdeb3b58 \
> task-poky-tools.bb:LIC_FILES_CHKSUM =3D "file://${POKYBASE}/LICENSE;md5=
=3D3f40d7994397109285ec7b81fdeb3b58 \
> task-sdk-host.bb:LIC_FILES_CHKSUM =3D "file://${POKYBASE}/LICENSE;md5=3D3=
f40d7994397109285ec7b81fdeb3b58 \
>
> Regards,
> --
> Martin 'JaMa' Jansa =C2=A0 =C2=A0 jabber: Martin.Jansa@gmail.com
>


