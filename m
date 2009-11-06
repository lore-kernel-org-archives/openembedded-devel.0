Received: from [209.85.218.217] (helo=mail-bw0-f217.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1N6NeO-0000K4-1r
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Nov 2009 13:10:47 +0100
Received: by bwz9 with SMTP id 9so1048572bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Nov 2009 04:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to:cc
	:content-type:content-transfer-encoding;
	bh=WJVla4BN3Lu++TGt7rO+lVBRq6BkoMEVXlBC+XpMxJM=;
	b=RprVdCD98SyEg2AxNgDg6J46QipSoaRjG3zkollu2pO8Y4mp1wUNFVUTS3WjVyeGxn
	8V1hpjV1f8gsTKYERD1GIMsvlC1M69E++uZch1t5vrR5GL5XFKibysr0ypGRkJT8Y3k7
	MZ3FMPYOJf8DCM4n/A32uyjSrXsk+jXXFf8ec=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=TY6jjsB/mAhHPyw6Wz0RB6Eu2z5BWDMLKQQCfeD2BHySQZYBX4cXhuUrX0+0OZvXD4
	yyWzRvLlRx6w/nZbfY/Bb3RCGFct6UCIPYabwuWi8LhsGFsU97TnhDuio4Ep1yg+FZKp
	AXcPRVNV7QkEIlDxslBqkb1Bot3KgvyEXyUqo=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.179.94 with SMTP id c30mr387615hbg.159.1257509369607; Fri, 
	06 Nov 2009 04:09:29 -0800 (PST)
In-Reply-To: <1257504486-7975-1-git-send-email-ynezz@true.cz>
References: <1257504486-7975-1-git-send-email-ynezz@true.cz>
Date: Fri, 6 Nov 2009 10:09:29 -0200
X-Google-Sender-Auth: 4d3d20f3022ce36a
Message-ID: <be7a9f3d0911060409u60dbf7ecg8b174c3b55441188@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATCH][geodegx] geodegx: Linux 2.6.31.4
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
X-List-Received-Date: Fri, 06 Nov 2009 12:10:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

NACK!

On Fri, Nov 6, 2009 at 8:48 AM, Petr =C5=A0tetiar <ynezz@true.cz> wrote:
>
> Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
>
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> index 808cc11..225a6f8 100644
> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -16954,6 +16954,10 @@ sha256=3Dd7b9f19b92fd5c693c16cd62f441d051b699f28=
ec6a175d1b464e58bacd8c78f
> =C2=A0md5=3D84c077a37684e4cbfa67b18154390d8a
> =C2=A0sha256=3D0acd83f7b85db7ee18c2b0b7505e1ba6fd722c36f49a8870a831c85166=
0e3512
>
> +[http://kernel.org/pub/linux/kernel/v2.6/linux-2.6.31.4.tar.bz2]
> +md5=3Dae7fde9fd0ae0d8ac12a1e1536d6d3ce
> +sha256=3De63041db1ef666ca43293762c8aaec27bd4b54b6d86aee68ebb090c1b66584f=
4
> +
> =C2=A0[http://kernel.org//pub/linux/kernel/v2.6/linux-2.6.9.tar.bz2]
> =C2=A0md5=3De921200f074ca97184e150ef5a4af825
> =C2=A0sha256=3Df5dba6366e87e91234d1b0069cfea655b0a4cb37ea97f899226f16998e=
6ab9f1
> diff --git a/conf/machine/geodegx.conf b/conf/machine/geodegx.conf
> index 0ec6782..6350f2d 100644
> --- a/conf/machine/geodegx.conf
> +++ b/conf/machine/geodegx.conf
> @@ -6,8 +6,10 @@ TARGET_ARCH =3D =C2=A0"i486"
>
> =C2=A0require conf/machine/include/tune-geode.inc
>
> -PREFERRED_PROVIDER_virtual/kernel =3D "linux-geodegx"
> -BOOTSTRAP_EXTRA_RDEPENDS =3D "kernel pciutils udev kernel-modules"
> +PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> +MACHINE_EXTRA_RDEPENDS =3D "kernel grub"
> +MACHINE_FEATURES =3D "kernel26 pci ext2 x86"
> +MACHINE_KERNEL_VERSION =3D "2.6"

You don't need to rdepends on the kernel and bootloader. In my case
for example, I use a initrd and don't need to have the kernel in the
image of rootfs; another issue, I use syslinux.

Besides, machine changes are another commit; please use one commit for
kernel recipe and other to the machine changes.

--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


