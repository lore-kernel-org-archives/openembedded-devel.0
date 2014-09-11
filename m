Return-Path: <switesh.fulpagare@mindastoneridge.com>
Received: from mail-vc0-f177.google.com (mail-vc0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 3FCC26FE64
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Sep 2014 10:21:03 +0000 (UTC)
Received: by mail-vc0-f177.google.com with SMTP id la4so3392002vcb.36
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Sep 2014 03:21:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=8bppzqhDczjsxDt/DXsKI8fFJvxOMJ6Lm8M00HACaZI=;
	b=aiNoguTnbb45NRZAot5fHD7mAjFbbH1KfwbjEecS5rDYw/UErfE0ZJGej9Yjcj69HL
	kUrbIWO/dPA0oSTIc7EPSE4aNBZ1zvxv3roCXdsFu3SF4OJq8nxFeYIkBAwa4BhvL71X
	vtjWLK1fIc60Zb1aK1V9pK5tqnlojWQhTu+0ffhVHUoGpfx3JHMXFYi+Pmf9Yc3dRri+
	eilgfyhHO2m5eoid/b5aKYIOhyIJA3VHy0di+MiJAMeBQDVUHgrRmp18hXuHmQw//ZsC
	u1+TW8CU1RTK15isdZJETA46zY5kuB2lRiT+5Usnkemx6kW4RHQ9X6v+1Xkl40tMJcr+
	TlEQ==
X-Gm-Message-State: ALoCoQmEDl617w+KN68VkERFmjkoz0M9ILRdNadwms3JRdkZRCSSJigo9b9EFgBVTT2Pggc0jHVhsWuxrxkmRBEYOcoBDGY7NdU5Ezg74qWANYltpw+EM83JHbb+4T4eQV2ASzNt04d9THVNAdCNyrd7PFo5pezVVQ==
MIME-Version: 1.0
X-Received: by 10.52.92.79 with SMTP id ck15mr25013vdb.26.1410430864471; Thu,
	11 Sep 2014 03:21:04 -0700 (PDT)
Received: by 10.52.245.73 with HTTP; Thu, 11 Sep 2014 03:21:04 -0700 (PDT)
In-Reply-To: <CALRGHr-hpQdTxEeG9pk6MEXzzw6TbUBCgUFQ90tFn5FD2UX5Mg@mail.gmail.com>
References: <CALRGHr-x0HHMz8paVPVFxmoZ41zRGBZ4GmY3N35VKfYx57v6Lg@mail.gmail.com>
	<CAP9ODKqZyLwdSGVSResWqOsxTLfPMXhGbh9a1mZL16RTG8nPsQ@mail.gmail.com>
	<CALRGHr9ts28vt-JN2v4SPKjd7-btmWrqVd7G=_cfcv4bGD_z1g@mail.gmail.com>
	<CALRGHr_u5LULhoxx0NLYK6Uux4uZ5Kr7+ikOY-TKqMvDfUfYmg@mail.gmail.com>
	<CAP9ODKp=xaS+WoQe-zKTpcKiqmdk4mHteoZ8a9BqO1w96hcbxg@mail.gmail.com>
	<CALRGHr_OiFeW60BsKxe0XdrBbkcXAE+usv3-=pHnhXCzONK_vg@mail.gmail.com>
	<CAP9ODKoBFp7Pskwch4nLq4mkJOB-uFh1m2w7zz46LZ=CUp5JAg@mail.gmail.com>
	<CALRGHr9iRe3j9j0ce2RnOz7TP+1UzaPqtE5vsooBze_A0fAuyA@mail.gmail.com>
	<CALRGHr98gwgsSQQ9tnLBan-XybFqXN=VoMKYueh5YWhOVXFWXQ@mail.gmail.com>
	<CAP9ODKqbwXrieO8yUJYu6+vBK6qerCCZsamkbz6RO5vS0Wq_oA@mail.gmail.com>
	<CALRGHr-kpOc88VED2YM3ZaS6beSXz_+xujK7UW6PmvO5BwzP2A@mail.gmail.com>
	<CAP9ODKocrq=t1GHqnVqt=SpfGsMXTr_60_K5GaOspuY6gCgm2g@mail.gmail.com>
	<CALRGHr-hpQdTxEeG9pk6MEXzzw6TbUBCgUFQ90tFn5FD2UX5Mg@mail.gmail.com>
Date: Thu, 11 Sep 2014 15:51:04 +0530
Message-ID: <CALRGHr9uXLm2ZuWua76p3jOroNuv1R1fWTjL9hGZ54WZru=yxQ@mail.gmail.com>
From: Switesh Fulpagare <switesh.fulpagare@mindastoneridge.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: Error while bitbake meta-toolchain-qt5
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
X-List-Received-Date: Thu, 11 Sep 2014 10:21:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Otavio,
   This problem is solved.
Thanks for your valuable support.

- Switesh.

On Wed, Sep 10, 2014 at 5:13 PM, Switesh Fulpagare <
switesh.fulpagare@mindastoneridge.com> wrote:

> i am using Daisy branch.
>
> On Wed, Sep 10, 2014 at 4:47 PM, Otavio Salvador <otavio@ossystems.com.br=
>
> wrote:
>
>> On Wed, Sep 10, 2014 at 1:17 AM, Switesh Fulpagare
>> <switesh.fulpagare@mindastoneridge.com> wrote:
>> > Hi Otavio,
>> >      Please confirm the following that i had understood -
>> >
>> > 1. You have pushed the fix.
>> > 2. Now, i have to apply the patch, with
>> >
>> >     SRCREV =3D "98dca3b54f52f08117c1e0d3a1b4826ed12ef23f"
>> > +QT_MODULE_BRANCH =3D "5.4"
>> >
>> >  SRC_URI +=3D " \
>> >
>> file://0001-examples.pro-include-server-buffer-only-when-buildin.patch
>> > \
>> >
>> > 3. I need to write
>> >     SRCREV =3D "98dca3b54f52f08117c1e0d3a1b4826ed12ef23f"
>> >     +QT_MODULE_BRANCH =3D "5.4"
>> > in the file,
>>  Home/bin/fsl-community-bsp/sources/meta-qt5//recipes-qt/qt5/
>> > qtwayland_git.bb
>> >
>> > 4. Then apply patch
>> >     $ patch <
>> > file://0001-examples.pro-include-server-buffer-only-when-buildin.patch=
 \
>> >
>> > Are the above steps are right? Please Otavio consider that i m beginne=
r
>> in
>> > the Linux platform.
>>
>> Are you using Daisy or master?
>>
>>
>> --
>> Otavio Salvador                             O.S. Systems
>> http://www.ossystems.com.br        http://code.ossystems.com.br
>> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>
>

--=20
=E2=80=9CThe contents of this e-mail message and any attachments are confid=
ential=20
and are intended solely for addressee. The information may also be legally=
=20
privileged. This transmission is sent in trust, for the sole purpose of=20
delivery to the intended recipient. If you have received this transmission=
=20
in error, any use, reproduction or dissemination of this transmission is=20
strictly prohibited. If you are not the intended recipient, please=20
immediately notify the sender by reply e-mail or phone and delete this=20
message and its attachments, if any.=E2=80=9D

