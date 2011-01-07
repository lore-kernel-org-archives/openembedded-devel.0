Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1PbD8Z-0002cB-6P
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Jan 2011 15:17:51 +0100
Received: by wyb40 with SMTP id 40so17926747wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Jan 2011 06:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=F4kWRsFKn5zswvETJNCAgwlDHi7aFjD5HTCG+fHNf4w=;
	b=UD4GRvL7MUXysKauhdPTB5egfMiJX+IMRaFfU8q0Wj2Q8bnVAbn+QhWYgwmQLu3BaK
	6Hvg+/aRzfMvSUWLBXAe5lDUPsphjTo8KqFAB+uScONJmRWm1G49TmMi8Irl/90yrTy+
	aQRG3Skpf3ke7AP+1XtNVRpYoGLGl8qBwXa7Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=JssQOhCZrbQVbC2LBmTou70XY0vSgy6+mlUzBU6cbaIpmDaM98D3djX9T4yTH1TiSx
	UsUTHh3dN71hoifC7n63A0r/W95K2dH+kFxXqZYbRoXvBX7mvz5f2l96z5p+XnQ29GEa
	FUSyw7xjqPI5OGIp5/kmZo2LK31CsKw4ARlFg=
MIME-Version: 1.0
Received: by 10.216.51.67 with SMTP id a45mr1559495wec.19.1294409771574; Fri,
	07 Jan 2011 06:16:11 -0800 (PST)
Received: by 10.216.254.137 with HTTP; Fri, 7 Jan 2011 06:16:11 -0800 (PST)
In-Reply-To: <AANLkTimqbQNtFt6NUi5D03nSnfRMyPxqrLYsN=PB4v+C@mail.gmail.com>
References: <AANLkTimqbQNtFt6NUi5D03nSnfRMyPxqrLYsN=PB4v+C@mail.gmail.com>
Date: Fri, 7 Jan 2011 09:16:11 -0500
Message-ID: <AANLkTin+4Z+tNrKG_0Z5iVL-iiO9dMXX+XY96H0DPRGx@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: testing branch 2011-01-06
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
X-List-Received-Date: Fri, 07 Jan 2011 14:17:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 6, 2011 at 6:22 PM, Cliff Brake <cliff.brake@gmail.com> wrote:
> master has been merged to testing-next and is ready for clean builds.
>
> There are only 7 combinations listed as passing. =A0If anyone has data
> that is not entered, I'll check back tomorrow morning before I create
> the tag.

Tag is created:
http://cgit.openembedded.org/cgit.cgi/openembedded/tag/?id=3Dtested_2010-12=
-30

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
http://bec-systems.com


