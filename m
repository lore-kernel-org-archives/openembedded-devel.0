Received: from newsmtp5.atmel.com ([204.2.163.5] helo=sjogate2.atmel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ludovic.desroches@atmel.com>) id 1QRJ7b-0006BU-Co
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 May 2011 09:12:11 +0200
Received: from meyreuil.atmel.fr ([10.159.254.132])
	by sjogate2.atmel.com (8.13.6/8.13.6) with ESMTP id p4V75gjS004431
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 May 2011 00:05:48 -0700 (PDT)
Received: from [127.0.0.1] ([10.159.245.147])
	by meyreuil.atmel.fr (8.11.7p1+Sun/8.11.7) with ESMTP id p4V78Ya24096
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 May 2011 09:08:34 +0200 (MEST)
Message-ID: <4DE493ED.5010906@atmel.com>
Date: Tue, 31 May 2011 09:08:29 +0200
From: Ludovic Desroches <ludovic.desroches@atmel.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.9.2.17) Gecko/20110414 Lightning/1.0b2 Thunderbird/3.1.10
	ThunderBrowse/3.3.5
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <09fa504b75a241d161f6263aa74393d19993b075.1306760475.git.ludovic.desroches@atmel.com>
	<1306782295.4106.479.camel@mattotaupa>
In-Reply-To: <1306782295.4106.479.camel@mattotaupa>
X-MIME-Autoconverted: from 8bit to quoted-printable by sjogate2.atmel.com id
	p4V75gjS004431
Subject: Re: [PATCH v3] tiobench: Add version 0.3.3 (initial recipe)
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
X-List-Received-Date: Tue, 31 May 2011 07:12:11 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hello Paul,

On 5/30/2011 9:04 PM, Paul Menzel wrote:
> From: Ludovic Desroches<ludovic.desroches@atmel.com>
> Date: Mon, 30 May 2011 18:43:14 +0200
>
> Build tested
> =E2=80=A2 with task-base image with the tiobench package on atmel board=
s by Ludovic Desroches and
> =E2=80=A2 using `angstrom-2010.x` and `minimal{,-uclibc}` for `MACHINE =
=3D "beagleboard"` by Paul Menzel.
>
> Signed-off-by: Ludovic Desroches<ludovic.desroches@atmel.com>
> Signed-off-by: Paul Menzel<paulepanter@users.sourceforge.net>
> ---
> v2 =E2=86=92 v3
> =E2=80=A2 sort dependencies
> =E2=80=A2 update `LICENSE`
> =E2=80=A2 remove overrides, which are the defaults
> =E2=80=A2 use ${PN} and ${P}
> =E2=80=A2 rename directory for the patch
>
> Ludovic, could you please test the updated patch and tell me if you sen=
d the Makefile patch upstream.
No problem, it is still ok. Thanks for your help. It's good for me to=20
see how this recipe has to look like since we can find different ways=20
into other (maybe old) recipes. I confess I have seen some of the=20
changes you asked but I forget them!

I have not sent the Makefile patch upstream, since the last release is=20
quite old, I don't know the project is still active.

Regards,

Ludovic





