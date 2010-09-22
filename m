Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OyQcm-0003R6-Uz
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Sep 2010 16:48:49 +0200
Received: by iwn2 with SMTP id 2so597265iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Sep 2010 07:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=rqYGWR2fhFnqD0ptPXQCTSnqTx1wZF2iOBkc3q8SYjM=;
	b=AvoLOTejB2N6z5ahQcy82i/zGwWhKomWevNhtWzncBCzoVv0fjEIYq4rPIFWsvh8CF
	zMaX02fcVypA2oxIi2qjI2YKkFwU2X39cxw7aM1EniFJNmv6KHK8dLMotFa2yvHnhGUh
	zQ4bjGkuflVBPmPbR/Bx35RAB4+H8kKhzHsMY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=v9tQpY/ejGupgi4BqfH65j6Y7figykWbaCr680aBzH5YvVdCjcpApajEB2tVuoktXj
	HFI/ojXqOOcSu47uW9566+y8+NMOsFpK+r5KVKdYR11enCn5zuuTCAqVpS4gO5fG6jX3
	AT0zOgoq4wfK4XvfVMlmFffjsV/yItxqcTGs4=
Received: by 10.231.146.135 with SMTP id h7mr222959ibv.149.1285166920455; Wed,
	22 Sep 2010 07:48:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.200.194 with HTTP; Wed, 22 Sep 2010 07:48:19 -0700 (PDT)
In-Reply-To: <AANLkTi=bZiZt_Da57qAF3KjHR=jZ3JHQFfO2nVGnL5LX@mail.gmail.com>
References: <4C995108.5070108@gmail.com>
	<AANLkTi=bZiZt_Da57qAF3KjHR=jZ3JHQFfO2nVGnL5LX@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 Sep 2010 07:48:19 -0700
Message-ID: <AANLkTinCPAO6J+QUMa-4jm-_wX+wks293YmwH-GVaP8Z@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] pivotinit_1.0.0.bb: Mark as COMPATIBLE_MACHINE=spitz.
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
X-List-Received-Date: Wed, 22 Sep 2010 14:48:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 22, 2010 at 1:27 AM, Andrea Adami <andrea.adami@gmail.com> wrot=
e:
> On Wed, Sep 22, 2010 at 2:42 AM, Graham Gower <graham.gower@gmail.com> wr=
ote:
>> From 909e5617f2534b505c6940b9e409a1ce3cdae1e9 Mon Sep 17 00:00:00 2001
>> From: Graham Gower <graham.gower@gmail.com>
>> Date: Wed, 22 Sep 2010 09:47:53 +0930
>> Subject: [PATCH 3/5] pivotinit_1.0.0.bb: Mark as COMPATIBLE_MACHINE=3Dsp=
itz.
>>
>>
>> Signed-off-by: Graham Gower <graham.gower@gmail.com>
>> ---
>> =C2=A0recipes/pivotinit/pivotinit_1.0.0.bb | =C2=A0 =C2=A01 +
>> =C2=A01 files changed, 1 insertions(+), 0 deletions(-)
>>
>> diff --git a/recipes/pivotinit/pivotinit_1.0.0.bb b/recipes/pivotinit/pi=
votinit_1.0.0.bb
>> index 912cfeb..8b40db2 100644
>> --- a/recipes/pivotinit/pivotinit_1.0.0.bb
>> +++ b/recipes/pivotinit/pivotinit_1.0.0.bb
>> @@ -4,6 +4,7 @@ PRIORITY =3D "required"
>> =C2=A0LICENSE =3D "MIT"
>> =C2=A0PR =3D "r0"
>>
>> +COMPATIBLE_MACHINE =3D "(spitz)"
>> =C2=A0SRC_URI =3D "file://init"
>>
>> =C2=A0do_install () {
>> --
>> 1.7.1
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> Hm...'pivot-init' is specific to old initrd.
>
> Nowadays we are using modern initramfs so pivot-root doesn't apply:
> initramfs is rootfs: you can neither pivot_root, nor unmount it (see
> kernel/Documentation/filesystems/ramfs-rootfs-initramfs.txt).
>
> I suspect this recipe has been obsoleted, I'll grep and see (AltBoot
> was using this iirc).

OK if thats the case then you can move it to obsolete dir.

>
> Regards
>
> Andrea
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
-Khem


