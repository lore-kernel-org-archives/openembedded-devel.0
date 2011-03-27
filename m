Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heroor@gmail.com>) id 1Q3ids-0003kp-W1
	for openembedded-devel@lists.openembedded.org;
	Sun, 27 Mar 2011 07:36:01 +0200
Received: by qwh5 with SMTP id 5so1354773qwh.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2011 22:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=xmSc/nKyQs7msIdk/6La6BcOnBgAuQuXE2ofuk0Gz0s=;
	b=rTp8GSDsfuKF0LoxZwBgo39+x+6CSht6zgZgFH0fBi5YgxsAXHujMWCzsprHj/tmbq
	uTVtWN0ZDjrrPSWtfdy7X/FVinHnNwDPCcnAjapnckB2P8wlTCUo+Yq3KI0s9XUf5+YT
	akUlEYdOkucNIfS6V3IJ3y4U2sy2ZE1jeu+uc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=dJFSo9Zjk/5rGP3Oyo04DJ/VeutVy//O3WJLbCS4mXWMwYvpl1D163wPKsEslqvbVe
	i/OKRJZ5xFtNjibFVQEls53HDOFIvzJbdxmvXxOSA/7O1QpCsMZUMGSFGYBDlrn3QDQ4
	GyLUX2Kz9B9is51tzYpA/f686Bn37ULUSVa8M=
MIME-Version: 1.0
Received: by 10.224.71.69 with SMTP id g5mr2206456qaj.305.1301204044869; Sat,
	26 Mar 2011 22:34:04 -0700 (PDT)
Received: by 10.224.134.5 with HTTP; Sat, 26 Mar 2011 22:34:04 -0700 (PDT)
In-Reply-To: <1301029351-32736-1-git-send-email-heroor@gmail.com>
References: <1301029351-32736-1-git-send-email-heroor@gmail.com>
Date: Sun, 27 Mar 2011 11:04:04 +0530
Message-ID: <AANLkTikovOEEzW4Ecrc81DEetcTJKY5duQ_gtQnhi+QS@mail.gmail.com>
From: Siddharth Heroor <heroor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] TI XDCTools: Add version 3.20.08.88
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
X-List-Received-Date: Sun, 27 Mar 2011 05:36:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 25, 2011 at 10:32 AM, Siddharth Heroor <heroor@gmail.com> wrote=
:
> From: Siddharth Heroor <heroor@ti.com>
>
>
> Signed-off-by: Siddharth Heroor <heroor@ti.com>
> ---
> =A0recipes/ti/ti-xdctools_3.20.08.88.bb | =A0 =A06 ++++++
> =A01 files changed, 6 insertions(+), 0 deletions(-)
> =A0create mode 100644 recipes/ti/ti-xdctools_3.20.08.88.bb
>
> diff --git a/recipes/ti/ti-xdctools_3.20.08.88.bb b/recipes/ti/ti-xdctool=
s_3.20.08.88.bb
> new file mode 100644
> index 0000000..bf0cdcd
> --- /dev/null
> +++ b/recipes/ti/ti-xdctools_3.20.08.88.bb
> @@ -0,0 +1,6 @@
> +require ti-xdctools.inc
> +
> +PV =3D "3_20_08_88"
> +
> +SRC_URI[xdcbin.md5sum] =3D "068447e935adb54f0cacf0e294a281f9"
> +SRC_URI[xdcbin.sha256sum] =3D "a4616fae3cc2a9f46b5b4377bb57af7f7932297cd=
a210a6cbcc5f942256db196"
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
Please consider this patch for inclusion in the 2011.03 maintenance branch.

--=20
Sid


