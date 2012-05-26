Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SYA18-0006m5-MC
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 May 2012 07:58:22 +0200
Received: by eaal1 with SMTP id l1so450772eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 May 2012 22:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=Ao+slbb8XAvpJ0Lipyc2QvvqihBUNjmPj6jR3mtrjWE=;
	b=GsKNRcd+au7uzgk6mATZ8j+wlb3/lkbqFKTVzcZq8IhQfeeLJdmiZ2IBJiuoHCXdg4
	TVRxFoGcSCwyM6BE/+ozflZ/k5wm1GrrIR1mh8uqJf6PlUpsbmcQepBDT86x8WC1NGP6
	Tu/ro7KWwexoAzUUm4z7tWxwFI8Jr8fcIoLMOInuLzFAVUHhVnouKyqT2rsFOMGZsY+N
	B62QnPUbkEcz+7CkVASyf9AmjD0/ZtFp4uprOM99twuGkyjd8H8FSByg8YDcGEs7fmfk
	+j1s6xT8Zn01alvThJ/xb5k1KoXMnf6Cfg2duKNa8C6l3l6s97pAL8mV9n+ReWGJ3jnO
	BgYg==
Received: by 10.14.95.1 with SMTP id o1mr272729eef.77.1338011289311; Fri, 25
	May 2012 22:48:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.188.11 with HTTP; Fri, 25 May 2012 22:47:39 -0700 (PDT)
In-Reply-To: <4FBD4DCD.3010505@itPenguin.de>
References: <4FBD4DCD.3010505@itPenguin.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 25 May 2012 22:47:39 -0700
Message-ID: <CAMKF1spv-o5MkH7=KSrEY28d3fBKq47G4YZF6E19fOX4KMx-QQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: invalid base-passwd_3.5.20.bb
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
X-List-Received-Date: Sat, 26 May 2012 05:58:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, May 23, 2012 at 1:51 PM, info <info@itpenguin.de> wrote:
> Release 2011.3
>
> At =C2=A0ftp://ftp.debian.org/debian/pool/main/b/base-passwd/
> these version is not available, so the building of all
> images failes:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0base-passwd_3.5.20.tar.gz
>
> verions 3.5.22 and 3.5.24 are available.
>
> Please update the recipe.
>
> Thank you, Roland
>


can you try out this patch

http://patchwork.openembedded.org/patch/28839/

and see if it solves the fetching problem ?
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


