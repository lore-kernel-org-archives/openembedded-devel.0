Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SImPO-0000wO-UN
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Apr 2012 21:43:51 +0200
Received: by lagw12 with SMTP id w12so2530981lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Apr 2012 12:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=vjLaDpMzgS4fnDkKZ9tI8Jr8HmceXgLdndyMAvVGbk0=;
	b=Smi7Ou4TzW2seUSvkzS2SmzaO1d2tGWN378m2oVduyZ4kEo2mLk32DFFdga6YmFzJn
	2tT1VEC3Sj49D3mBUXhw6Np5hLtiZCgCv20k5wZWH+ooaFvucB3IwCtAY2vubirpH/Fh
	q4Gj8kUVjFeizxeQF0qPoYZ8/VS3gYJwKnHRklErLXj+ChYr8mY6krKDS1Izux1sqgzN
	co1qgDbczHcFhFf7+W29+2shPjCRCWviSKqS67rycTmnNfWTrt36kYCIPEaVRC32JSuk
	RKS3QkkYBnKKnsNtxHySOyFKv40kHlzB4eeGTHu6Ovn+S0P+9KED2gpeaSJBH0+uKd66
	/5/g==
Received: by 10.112.83.105 with SMTP id p9mr1286265lby.43.1334345669160; Fri,
	13 Apr 2012 12:34:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Fri, 13 Apr 2012 12:33:58 -0700 (PDT)
In-Reply-To: <4F875256.1010100@zoho.com>
References: <4F875256.1010100@zoho.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 13 Apr 2012 12:33:58 -0700
Message-ID: <CAMKF1spP6QpS5NV2ViL3AduwTU3-WdCFi59K-cX3t9EOLgP8-g@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Apply patches on embedded linux board
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
X-List-Received-Date: Fri, 13 Apr 2012 19:43:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 12, 2012 at 3:08 PM, Kevin Qiu <k_q_11@zoho.com> wrote:
> =C2=A0I am a newbie on Linux. I need to apply the following patch to fix =
the user
> button http://patches.openembedded.org/patch/7091/. However, I am not sur=
e
> if I do need the kernel source to apply the patch. I am just using the
> Angstrom distro coming with the board.

OK. This will need some learning. You need to learn how to compile a
Linux kernel.
google will show up many documents that should help you learn that.

Angstrom does have binary feeds too so check if a patched kernel is
already available
for your device if its there then you dont have to learn how to
compile the kernel


