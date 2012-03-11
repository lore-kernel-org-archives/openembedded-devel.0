Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1S6lDX-0002uT-4x
	for openembedded-devel@lists.openembedded.org;
	Sun, 11 Mar 2012 17:01:55 +0100
Received: by lagw12 with SMTP id w12so3048504lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Mar 2012 08:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=rrakj164E/0u+vR+4Ef3cPuKE/ZhmBJvvQo3mA30xII=;
	b=0XbfqqkwhEaGjN0OfDfEHaNpAeEauCnMaetIzxiORWEZNWipc1D8NfHDboK1k20oO+
	+q4BGe/vk9nBCE3szCgN2cDmmfOLjNadLkBbCR8679SKNbRVAwy3y2QOz8WWNiOttTnr
	GeRk49DSS6ms42IUpYr8gUoL/hX6o1qaCP/LKx5iZb56H8MzJDWE6suhjYupRr5aqa98
	I7HOlNcl8CNZ0/He1Xd3v4lgHiDMjZFbsNcEJRbqtTINR18oiSifczCBDHcJbVa2PeZJ
	4RxMhl/hbeerf9RezVN4nHhpyZLXutTMMws/1UCGVyaT45tnGSQjuyrkHomhbHF/ljR3
	WwKg==
Received: by 10.112.29.200 with SMTP id m8mr3467996lbh.44.1331481193314; Sun,
	11 Mar 2012 08:53:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.27.109 with HTTP; Sun, 11 Mar 2012 08:52:43 -0700 (PDT)
In-Reply-To: <1328211279-8809-1-git-send-email-tworaz666@gmail.com>
References: <1328211279-8809-1-git-send-email-tworaz666@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 11 Mar 2012 08:52:43 -0700
Message-ID: <CAMKF1soDZ1aTJRvCr_WPjLDZHpzRwpPQWW79a7LyOjpHfma3mA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-gnome][PATCH] libgsf: Remove unnecessary gconf RDEPENDS.
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
X-List-Received-Date: Sun, 11 Mar 2012 16:01:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 2, 2012 at 11:34 AM, Peter Tworek <tworaz666@gmail.com> wrote:
> It's added automatically when including gconf bbclass.
>
> Signed-off-by: Peter Tworek <tworaz666@gmail.com>

can you also bump the PR and resubmit plz.

> ---
> =C2=A0meta-gnome/recipes-gnome/libgsf/libgsf_1.14.21.bb | =C2=A0 =C2=A02 =
--
> =C2=A01 files changed, 0 insertions(+), 2 deletions(-)
>
> diff --git a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.21.bb b/meta-gno=
me/recipes-gnome/libgsf/libgsf_1.14.21.bb
> index 6119f86..e8cad9c 100644
> --- a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.21.bb
> +++ b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.21.bb
> @@ -19,5 +19,3 @@ EXTRA_OECONF =3D "\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--without-gnome-vf=
s --without-bonobo \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-gtk-doc =
\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--with-bz2"
> -
> -RDEPENDS_${PN} =3D "gconf"
> --
> 1.7.3.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


