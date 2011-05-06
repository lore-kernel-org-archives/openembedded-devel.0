Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heroor@gmail.com>) id 1QII0z-0008EL-9S
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 May 2011 12:12:06 +0200
Received: by qwh5 with SMTP id 5so2304171qwh.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 May 2011 03:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=mzM0fiJa4R7kcTjEba35QO+a3hdjmOoaOpqQ186oaIo=;
	b=sh915P6sdH87SVCcoLU3gKW2Rqy/51JiAWkngRScKYnuUG3wSEIGVqaLabUXTs8KKZ
	2GR3cUiakln6zwWx6HSj0XLSJJwFGDvyrtCmXxIL9tLbrgnKCK0oSz9l6H0nOIUPNh6o
	jQj9Y9yq96gfLdGliJw0CHdsW1Toq5ebZ5ALw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=uw1qfwTmHgCgH5w57w/nY3OhAglNc6lrkSwhDryP/jR094EMmsDIejZ9JXJIauHT7V
	fkiqx3z6neJ85WjV8ZUzK6FA5pnm6hGx5QYYjQTQxKGy1U8mOI31K/offxxFWd34spE6
	CKpFROjtjvi/YXhzXD6frmWtpBf/fMD5oGmg0=
MIME-Version: 1.0
Received: by 10.224.135.133 with SMTP id n5mr3346870qat.392.1304676563773;
	Fri, 06 May 2011 03:09:23 -0700 (PDT)
Received: by 10.224.6.79 with HTTP; Fri, 6 May 2011 03:09:23 -0700 (PDT)
In-Reply-To: <20110506090243.GE26466@ibawizard.net>
References: <1304243449-12028-1-git-send-email-heroor@ti.com>
	<20110501173015.GI27708@ibawizard.net>
	<BANLkTimKHp5M5VvMR21+C_rSRBiu2M0BKQ@mail.gmail.com>
	<20110506090243.GE26466@ibawizard.net>
Date: Fri, 6 May 2011 15:39:23 +0530
Message-ID: <BANLkTikt+X9ocYn-0bsfwzbCcZDQFnm_ww@mail.gmail.com>
From: Siddharth Heroor <heroor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/2] zeromq: Add zeromq socket library.
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
X-List-Received-Date: Fri, 06 May 2011 10:12:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, May 6, 2011 at 2:32 PM, Petr =C5=A0tetiar <ynezz@true.cz> wrote:
> Siddharth Heroor <heroor@gmail.com> [2011-05-03 22:18:03]:
>
>> Is the older recipe available somewhere? I didn't have to do this for th=
e
>> latest version.
>
> Yes, it's in patchwork[1]. I should've pushed it few weeks ago, but didn'=
t had
> time to rebase and test it again yet. Hopefully I'll do it during this
> weekend.
Ok. I'll wait for your patch. I'm facing some issues with testing my
patch and so I'll
withdraw it.

--
Sid

>
> AFAIK, libuuid from util-linux-ng is build/run dependency, so it's needed=
.
>
> 1. http://patches.openembedded.org/patch/1885
>
> -- ynezz
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
Sid


