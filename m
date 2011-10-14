Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1REVNT-0007f4-VX
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Oct 2011 02:11:57 +0200
Received: by ywf7 with SMTP id 7so1746942ywf.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Oct 2011 17:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=rloRhRsx/QJGMRp+WFI5O4/o0HEffn14YiGNx48cGNk=;
	b=GaengTRUtgLTVTJZivT0bQsQvPKE2zg1fpDXGq1aQC8X43lY1oe03VwAwZsxiDIdgU
	wee/mIKJDHshX/lvwDPjBeBO5roDy9HhD4/Y47HothV48YctjYLldNt8MRsWTCCK/DHy
	j6ixuAPx21GhGVWX05q28jcBajj++C6LT6TVQ=
Received: by 10.68.74.4 with SMTP id p4mr12515875pbv.47.1318550768093; Thu, 13
	Oct 2011 17:06:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.48.230 with HTTP; Thu, 13 Oct 2011 17:05:38 -0700 (PDT)
In-Reply-To: <CAObi9r8DqGUVt6ohNvpzQu3ZW-bRh9ET6XL5ZwEGVGK_hbAYUQ@mail.gmail.com>
References: <CAObi9r9=55i4W686VfCv-TGSChsrewu7zSGUsPZC2PbA3x3zbQ@mail.gmail.com>
	<1318497983.14199.54.camel@phil-desktop>
	<CAObi9r8DqGUVt6ohNvpzQu3ZW-bRh9ET6XL5ZwEGVGK_hbAYUQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Oct 2011 17:05:38 -0700
Message-ID: <CAMKF1soW4qGpKttzq36Z0Z4pMbWD8Zf2m-Cgr5pyJZ4M1BLrZQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Creating Rootfs images without packages
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
X-List-Received-Date: Fri, 14 Oct 2011 00:11:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 13, 2011 at 4:07 AM, mgundes <mgcse@hotmail.com> wrote:
>
> =C2=A0 =C2=A0 =C2=A0I meant eliminating whole packages.

look at linux from scratch that might be good starting point for such a thi=
ng.

>
> =C2=A0 =C2=A0 =C2=A0Sometimes you think that it should be a better way ev=
en if you don't
> know the way. I am not expert on OE and unfortunately I don't have any
> proposal. I thought there may be or there should be a way to do but if
> founders and experts don't agree or say current is the best way to go, th=
en
> everything is ok. May be later, when I learn OE good enough and if I figu=
re
> out a way I surely share with OE team :)


>


