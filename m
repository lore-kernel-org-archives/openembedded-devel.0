Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P9DR0-0003Th-RD
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Oct 2010 10:57:22 +0200
Received: by gxk22 with SMTP id 22so434449gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Oct 2010 01:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=z+tjxx8MhQys7jIqELh9BBcKN6onH3La53RlKKlajcE=;
	b=gERGFRGWza1jKOb1BjzG8vFIoPSYkz1Jyayibvyb59yxaFEZOosE64gr1yPaFMHlBj
	WKgderaEmo2VXmsYQeV63DrZz27h+AVB2bViH21pplGG/ck2PF54/p2ASgRRihfR3DKT
	XGF+qhlVAoSHSNd9jLHe++Gm/olh0z4s+SMxY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=El/+JS4p+kkLdMEkWPFWd7gVnyCxa4wyTIaa5RMMLr130tNpJ65Fc7OTn+aPoQqjxx
	UHx8NEjNZnYfobJcqY9tK+26t0wBHJEFFFo5h0mgj5VQPhIVTHPwwzzlcl0fx83PUIwt
	sFSzEWyimxd0cc3E4ln0jSnZ5iQEObP/H1o3M=
MIME-Version: 1.0
Received: by 10.42.229.133 with SMTP id ji5mr1855935icb.350.1287737789736;
	Fri, 22 Oct 2010 01:56:29 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Fri, 22 Oct 2010 01:56:29 -0700 (PDT)
In-Reply-To: <1287074146-3705-7-git-send-email-fransmeulenbroeks@gmail.com>
References: <1287074146-3705-1-git-send-email-fransmeulenbroeks@gmail.com>
	<1287074146-3705-2-git-send-email-fransmeulenbroeks@gmail.com>
	<1287074146-3705-3-git-send-email-fransmeulenbroeks@gmail.com>
	<1287074146-3705-4-git-send-email-fransmeulenbroeks@gmail.com>
	<1287074146-3705-5-git-send-email-fransmeulenbroeks@gmail.com>
	<1287074146-3705-6-git-send-email-fransmeulenbroeks@gmail.com>
	<1287074146-3705-7-git-send-email-fransmeulenbroeks@gmail.com>
Date: Fri, 22 Oct 2010 10:56:29 +0200
Message-ID: <AANLkTinWx9kdBbjfDXvFTNcWqg-dN8Rhyynttow57cTk@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 7/7] kaffe-gtk_cvs.bb: remove useless EXTRA_OECONF += ""
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
X-List-Received-Date: Fri, 22 Oct 2010 08:57:31 -0000
X-List-Received-Date: Fri, 22 Oct 2010 08:57:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

ping; i know this is a fairly trivial patch but as it is a recipe I am
not familiar with, I would appreciate it if e.g. the recipe maintainer
would send an ack

2010/10/14 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> ---
> =A0recipes/kaffe/kaffe-gtk_cvs.bb | =A0 =A02 --
> =A01 files changed, 0 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/kaffe/kaffe-gtk_cvs.bb b/recipes/kaffe/kaffe-gtk_cvs=
.bb
> index d75eb63..a96bd59 100644
> --- a/recipes/kaffe/kaffe-gtk_cvs.bb
> +++ b/recipes/kaffe/kaffe-gtk_cvs.bb
> @@ -8,5 +8,3 @@ S =3D "${WORKDIR}/kaffe"
> =A0require kaffe.inc
>
> =A0DEPENDS +=3D "glib-2.0 gmp gtk+ pango zlib libxtst kaffeh-native"
> -
> -EXTRA_OECONF +=3D ""
> --
> 1.6.4.2
>
>


