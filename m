Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PivYK-0007Ll-V3
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Jan 2011 22:08:21 +0100
Received: by iwn8 with SMTP id 8so3636431iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jan 2011 13:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=/6yRXTifB0cumMCQLP0scsYpYS3XjVtOgN0iQhbp7A8=;
	b=SKGgkrA4uBfjBOxHSA159IJyTSi/h7Vcru3VlEgRbMlBaetuUbQ8GZz83Gg+50avXI
	cEgi8s/mQ359ZK2u+MMIkq6srmxJmO2HZA13GqYwpp7fyTG80qifB6DIPXJkT1YLp5lW
	Y82NMPeKeiQQ1ltI/9j6zWBj3/f9xGkpRlc6I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=qJ4ZlIBEj1Z0yLdJFalF23IAb4faekSZM5xpedZJBCek3MMyOqZ/RcqLBNiXMNAKwy
	GVe/Dr6Nka4QTFCXjYFw8LRM6i1SgY2x78AJ1Lp5h6ZmsYvechXIhYC0StrFphSk8d0F
	uLoC/qEMsJzdAMN10d1jJa8HUMDw4JW+at8vc=
MIME-Version: 1.0
Received: by 10.231.207.66 with SMTP id fx2mr3262521ibb.108.1296248845382;
	Fri, 28 Jan 2011 13:07:25 -0800 (PST)
Received: by 10.231.36.68 with HTTP; Fri, 28 Jan 2011 13:07:25 -0800 (PST)
In-Reply-To: <1296240753-10120-6-git-send-email-tom_rini@mentor.com>
References: <1296240753-10120-1-git-send-email-tom_rini@mentor.com>
	<1296240753-10120-6-git-send-email-tom_rini@mentor.com>
Date: Fri, 28 Jan 2011 22:07:25 +0100
Message-ID: <AANLkTinHnMUPsHRJj_oN-AFGnBy_7tWAG-3j+GW=dEK=@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 5/5] bitbake.conf: Drop unused perl-native-runtime ASSUME_PROVIDED
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
X-List-Received-Date: Fri, 28 Jan 2011 21:08:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/1/28 Tom Rini <tom_rini@mentor.com>:
> Signed-off-by: Tom Rini <tom_rini@mentor.com>
Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> ---
> =A0conf/bitbake.conf | =A0 =A01 -
> =A01 files changed, 0 insertions(+), 1 deletions(-)
>
> diff --git a/conf/bitbake.conf b/conf/bitbake.conf
> index 1baecc1..21ffcb1 100644
> --- a/conf/bitbake.conf
> +++ b/conf/bitbake.conf
> @@ -170,7 +170,6 @@ ASSUME_PROVIDED =3D "\
> =A0 =A0 cvs-native \
> =A0 =A0 diffstat-native \
> =A0 =A0 patch-native \
> - =A0 =A0perl-native-runtime \
> =A0 =A0 python-native-runtime \
> =A0 =A0 svn-native \
> =A0 =A0 texinfo-native \
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


