Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Piuig-0005g2-4n
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Jan 2011 21:14:58 +0100
Received: by wyb40 with SMTP id 40so3524315wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jan 2011 12:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=9k6jPO7N3RaAXJzREjXIrbjj0FJWh5odbmAQGa4vOY4=;
	b=Jk4FggbwkOd0xrIDdp2cjqMCh8ixl/oYt8df3onvmvGt9ArX3a693ltHK1CNNQmOOt
	GrvygLd79oSCYbE0ABZPhFtypOKuemb9O2roO2cpD6yPHHz1eXM7jg85CzDwnw2UocvP
	M7vU6V2rynUXkIj49DW1B9dKp9xiBIqEcwqV4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=HMpDu4+hZ7PGRR0pbQA6WXf56lzDP6Je+peC44yfIlTrUatQfgSDfMcJCMYo36vDaD
	Rar9yWZKcmZxecN/K5ccWaCHPBl2lbuzvh64mkK38c8pSNbz9G9qZRzfkcSxww4gbgvU
	Mclqux4Sjp0sLNkGfbRuqj+U0iU+5+QjgsOrc=
MIME-Version: 1.0
Received: by 10.227.177.15 with SMTP id bg15mr64747wbb.150.1296245639057; Fri,
	28 Jan 2011 12:13:59 -0800 (PST)
Received: by 10.227.209.13 with HTTP; Fri, 28 Jan 2011 12:13:59 -0800 (PST)
In-Reply-To: <20110128164728.GA3265@jama>
References: <E1Piqw5-0004kv-3P@melo.openembedded.org>
	<20110128164728.GA3265@jama>
Date: Fri, 28 Jan 2011 21:13:59 +0100
Message-ID: <AANLkTikxQKyKgU0_fZEe+M+toLbbUjWwwrCODH9w+qyh@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] Andrea Adami : MAINTAINERS: add committer's entry.
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
X-List-Received-Date: Fri, 28 Jan 2011 20:14:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

MArtin,

oops... so sorry

The intent was to copy/steal the right 'Angstrom' string with bells
and whistles.
I moved it instead of copying it...before being interrupted and realize tha=
t.
Later I did even remove Distro from my scope.

Anyway, I'd have noticed the bad commit now, a few hours ago (with kid in b=
ed)..

Sorry again

Sincerely

Andrea

On Fri, Jan 28, 2011 at 5:47 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Fri, Jan 28, 2011 at 04:12:33PM +0000, git version control wrote:
>> Module: openembedded.git
>> Branch: org.openembedded.dev
>> Commit: 07530194621001e9fbea33e3a094beceef606e48
>> URL: =A0 =A0http://gitweb.openembedded.net/?p=3Dopenembedded.git&a=3Dcom=
mit;h=3D07530194621001e9fbea33e3a094beceef606e48
>>
>> Author: Andrea Adami <andrea.adami@gmail.com>
>> Date: =A0 Fri Jan 28 17:11:26 2011 +0100
>>
>> MAINTAINERS: add committer's entry.
>> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>>
>> ---
>>
>> =A0MAINTAINERS | =A0 11 ++++++++++-
>> =A01 files changed, 10 insertions(+), 1 deletions(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index f1e20dd..4d05c59 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -16,6 +16,16 @@ Recipes: =A0 =A0Maintained recipes (should match pack=
age names, can include wildcard
>>
>> =A0---------------------------------------------------------------------=
--------
>>
>> +Person: =A0 =A0 Andrea Adami
>> +Mail: =A0 =A0 =A0 andrea.adami@gmail.com
>> +Machines: =A0 Zaurus family (direct testing only on c7x0 and spitz)
>> +Recipes: =A0 =A0zaurus-updater, zaurus-installer, nandlogical
>> +Recipes: =A0 =A0linux, linux-kexecboot (Zaurus kernels)
>> +Recipes: =A0 =A0kexecboot, kexec-tools, initramfs-kexecboot-image
>> +Recipes: =A0 =A0klibc, klcc-cross
>> +Classes: =A0 =A0klibc.bbclass
>> +Interests: =A0Early boot, initramfs, klibc-static binaries, kernel, sys=
adm, networking
>> +
>> =A0Person: =A0 =A0 Andreas Holzer
>> =A0Mail: =A0 =A0 =A0 a.holzer@cheese.at
>> =A0Website: =A0 =A0http://members.cheese.at/woody/zaurus/
>> @@ -218,7 +228,6 @@ Interests: =A0OE Eclipse plugins, x86, ARM, wxWidget=
s, xorg, xinput, xinput-calibr
>> =A0Person: =A0 =A0 Martin 'JaMa' Jansa
>> =A0Mail: =A0 =A0 =A0 Martin.Jansa@gmail.com
>> =A0Machines: =A0 spitz, om-gta02
>> -Distros: =A0 =A0SHR, =C5ngstr=F6m
>> =A0Interests: =A0xorg
>> =A0Recipes: =A0 =A0shr/*, xorg-*/*, linux/*openmoko*
>
> I still like SHR and =C5ngstr=F6m and I want them back! :)
>
> --
> Martin 'JaMa' Jansa =A0 =A0 jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


