Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Sk1G7-0003ao-Ez
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Jun 2012 01:02:51 +0200
Received: by dalh21 with SMTP id h21so1960900dal.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jun 2012 15:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=4r3qoMzZkGs4Av0nq1lN8iuWqe17sIWU5ysdd8HM6+4=;
	b=vyBsAl+ManU+Mxj5sXxjF1FdppBoSRzD28Qmle584J7kD/VEh14pG3zK3sgC2QcChw
	Sgtsfu+8obSyBuwRXwCPgLPChxsVZnZhA2VTi15LnWOruU9IrLgsBtwI/nyery/PGOlJ
	AfDqW21E70Cpjdk3QnDCOtNAm//LldeFZ50658GS0J9AnzeR30ejMlUbcL/b0mB7cYwT
	XPPzVYo2Y7PBm9uJ7mWRWwy6zurDAUsGx+DCI0mAmu0x9khIvraMEnx0wgVGupVw4B04
	cDKxDYg91whgY6HgObmI3neHqussWVQ/VXpOPnGvzgAeXdmg4Ww9ks+ZzdU9cDTtm8sz
	bD/Q==
MIME-Version: 1.0
Received: by 10.68.225.170 with SMTP id rl10mr221410pbc.13.1340837516776; Wed,
	27 Jun 2012 15:51:56 -0700 (PDT)
Received: by 10.142.144.18 with HTTP; Wed, 27 Jun 2012 15:51:56 -0700 (PDT)
In-Reply-To: <1340229380-4646-1-git-send-email-andrea.adami@gmail.com>
References: <1340229380-4646-1-git-send-email-andrea.adami@gmail.com>
Date: Thu, 28 Jun 2012 00:51:56 +0200
Message-ID: <CAAQYJAv+JMTGLE_0s=SVN7K1WppgT1jybDNbTP-dj5UAvjQ_jA@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][meta-initramfs][PATCH] kexecboot_git: bump PR after recipe update.
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
X-List-Received-Date: Wed, 27 Jun 2012 23:02:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 20, 2012 at 11:56 PM, Andrea Adami <andrea.adami@gmail.com> wro=
te:
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
> =A0.../recipes-bsp/kexecboot/kexecboot_git.bb =A0 =A0 =A0 =A0 | =A0 =A02 =
+-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb b/meta=
-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
> index b33b640..a3b4cde 100644
> --- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
> +++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
> @@ -1,6 +1,6 @@
> =A0RDEPENDS_${PN} =3D "kexec"
> =A0PV =3D "0.5.9"
> -PR =3D "r8+gitr${SRCREV}"
> +PR =3D "r9+gitr${SRCREV}"
>
> =A0SRC_URI =3D "git://github.com/kexecboot/kexecboot.git;protocol=3Dgit"
> =A0SRCREV =3D "0daa774eac019602cd89048961e95985ea50dadf"
> --
> 1.7.3.4
>

BUMP?


