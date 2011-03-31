Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heroor@gmail.com>) id 1Q5FI8-0001XL-Rn
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 12:39:54 +0200
Received: by qwh5 with SMTP id 5so1446831qwh.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2011 03:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=KWkwQm5vnAZhSHyp+d2Fx90/O+naOvPh8LZj4+KEwGM=;
	b=PGQu9oVCQ+l8wHiR/QIlI4yg6GeV3afo+WUDyxlTQ2V3uWuCUYJmeYVun16dckAG6b
	1igi7Mr2OhR3+Tng8xAk8h7035mOCt1qAtWgO5w0zBemeZda4eegIs6xp2zLDiYY+pMp
	jC2K43gqKNJKZVHQaSf4LdRTDHMfcwmzWO+MU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=LOB+rOM7YJh5KL+XS7TG6YCVU9YMUfzQGuwFwGOuj583X33Ig6f/3oUVqjpKvrUP4I
	flqcCAaPfu3o4bUkU5TLe/RLYZDphmscyr59jPlyqeJEk4rOlqb/mB9XLIL1JaYr4HfG
	f47C5MIdNhYvO7EtW+qY6pmoNZHQ0zMzsqoMM=
MIME-Version: 1.0
Received: by 10.224.138.16 with SMTP id y16mr2076105qat.255.1301567867539;
	Thu, 31 Mar 2011 03:37:47 -0700 (PDT)
Received: by 10.224.134.5 with HTTP; Thu, 31 Mar 2011 03:37:47 -0700 (PDT)
In-Reply-To: <1301470961-15808-3-git-send-email-heroor@gmail.com>
References: <1301470961-15808-1-git-send-email-heroor@gmail.com>
	<1301470961-15808-3-git-send-email-heroor@gmail.com>
Date: Thu, 31 Mar 2011 16:07:47 +0530
Message-ID: <AANLkTim3ssJNA5JV80r4=6z96zD3QYOJjh_x43hdzD+Z@mail.gmail.com>
From: Siddharth Heroor <heroor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 3/3] TI EDMA3LLD Sysbios: Add version 02.11.01.02
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
X-List-Received-Date: Thu, 31 Mar 2011 10:39:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 30, 2011 at 1:12 PM, Siddharth Heroor <heroor@gmail.com> wrote:
> From: Siddharth Heroor <heroor@ti.com>
>
>
> Signed-off-by: Siddharth Heroor <heroor@ti.com>
> ---
> =A0recipes/ti/ti-edma3lld-sysbios_02.11.01.02.bb | =A0 =A06 ++++++
> =A01 files changed, 6 insertions(+), 0 deletions(-)
> =A0create mode 100644 recipes/ti/ti-edma3lld-sysbios_02.11.01.02.bb
>
> diff --git a/recipes/ti/ti-edma3lld-sysbios_02.11.01.02.bb b/recipes/ti/t=
i-edma3lld-sysbios_02.11.01.02.bb
> new file mode 100644
> index 0000000..264dfb3
> --- /dev/null
> +++ b/recipes/ti/ti-edma3lld-sysbios_02.11.01.02.bb
> @@ -0,0 +1,6 @@
> +require ti-edma3lld-sysbios.inc
> +
> +PV =3D "02_11_01_02"
> +
> +SRC_URI[md5sum] =3D "270c15dc5f0a5761adb1ff45ab1adb99"
> +SRC_URI[sha256sum] =3D "bd76114114a099eba15bdce8e3815a8cd2c01d819ebfc630=
f6abdd39da36b525"
> --
> 1.7.0.4

May I know the status of this patch? I don't see it on the patchwork
queue or on the master branch. I see it archived on the -devel mailing
list archive though.

--=20
Sid


