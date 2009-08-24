Received: from [209.85.221.183] (helo=mail-qy0-f183.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Mfgb1-0006yx-LU
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Aug 2009 22:56:55 +0200
Received: by qyk13 with SMTP id 13so335983qyk.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2009 13:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=EcRa7M1Bt5reSTYD5ELiA7xtU+UP5xcbb4uzr1rivkA=;
	b=VSpFVFXoL5HAcZJRWKbLKGZsWMBOr+1pCK8YJBe+peoKDGYoevpJFc+l2JBiiVtyyD
	AT/VqTRbK/ZX1c8pBygRPTT3YYgufXX+IdgJlKsP74UNq9FEt0q+8MXNmV6ahZd7D67H
	U3weP9+a8AwFWPuf/uupfF+imSXbiJr8GOPg0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=AEgdHcuP9zsl8ImoZj8y55026ManEDGNz2S35WGP/fAwE9Iiq6tybl87qf0lBIBLrw
	pcIe1c9wr189qh3RX1PfpuRI+C6vFKigADIiPoUhIlYjRDP1kR8VH64u97pne+Rh3EtD
	z3HzG7skH6AVH8SkxO2/9mvVvs66bUeZ0wBj0=
MIME-Version: 1.0
Received: by 10.229.111.195 with SMTP id t3mr1142999qcp.44.1251146347769; Mon, 
	24 Aug 2009 13:39:07 -0700 (PDT)
In-Reply-To: <1251126428-8995-1-git-send-email-edoiron@cbnco.com>
References: <1251126428-8995-1-git-send-email-edoiron@cbnco.com>
Date: Mon, 24 Aug 2009 13:39:07 -0700
Message-ID: <19c1b8a90908241339i1119543bo7bf4784c3cc47dbb@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] nano: add v2.0.9
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
X-List-Received-Date: Mon, 24 Aug 2009 20:56:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2009 at 8:07 AM, Evan Doiron<edoiron@cbnco.com> wrote:
> Signed-off-by: Evan Doiron <edoiron@cbnco.com>
> ---
> =C2=A0conf/checksums.ini =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A04 ++++
> =C2=A0recipes/nano/{nano_2.0.7.bb =3D> nano_2.0.9.bb} | =C2=A0 =C2=A00
> =C2=A02 files changed, 4 insertions(+), 0 deletions(-)
> =C2=A0copy recipes/nano/{nano_2.0.7.bb =3D> nano_2.0.9.bb} (100%)
>
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> index 2c85594..3ee124d 100644
> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -17762,6 +17762,10 @@ sha256=3D0d10d8f70a6fadfb9cfaa7b66c5fe7eba17e64e=
cb96104c4ddedc82f89765d5c
> =C2=A0md5=3D16187fed2bdefec6275ece6401ce4cd2
> =C2=A0sha256=3D5dc783c412c4d1ff463c450d2a2f9e1ea53a43d9ba1dda92bbf5182f60=
db532f
>
> +[http://www.nano-editor.org/dist/v2.0/nano-2.0.9.tar.gz]
> +md5=3D2be94dc43fb60fff4626a2401a977220
> +sha256=3D6d212385680d29dcda35dda7801da19c80182a8bc6bc6d5cf7533034c853d37=
f
> +
> =C2=A0[http://downloads.sourceforge.net/nasm/nasm-0.98.38.tar.bz2]
> =C2=A0md5=3D9f682490c132b070d54e395cb6ee145e
> =C2=A0sha256=3D87e64eff736196862ed46c04a3dffa612d765df980fa974fc65e026d81=
1bd9d0
> diff --git a/recipes/nano/nano_2.0.7.bb b/recipes/nano/nano_2.0.9.bb
> similarity index 100%
> copy from recipes/nano/nano_2.0.7.bb
> copy to recipes/nano/nano_2.0.9.bb

Acked-by:  Khem Raj <raj.khem@gmail.com>

> --
> 1.6.0.2
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


