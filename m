Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1UUgq5-0006Oj-Ti
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Apr 2013 19:17:14 +0200
Received: from e6520eb (pac33-2-82-240-38-71.fbx.proxad.net [82.240.38.71])
	(Authenticated sender: eukrea)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id 8B6944B01DD;
	Tue, 23 Apr 2013 18:59:25 +0200 (CEST)
Date: Tue, 23 Apr 2013 18:59:24 +0200
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130423185924.6a01867f@e6520eb>
In-Reply-To: <5175AAA5.3090601@pseudoterminal.org>
References: <5175AAA5.3090601@pseudoterminal.org>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.13; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Subject: Re: [meta-oe] libvpx patch backport request
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
X-List-Received-Date: Tue, 23 Apr 2013 17:17:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Carlos Refael,

Le Mon, 22 Apr 2013 23:24:53 +0200,
Carlos Rafael Giani <dv@pseudoterminal.org> a =C3=A9crit :

> Hello,
>=20
> in the meta-oe master branch, commit=20
> 392e30c21accc720c4e7ae38bc830bfc283a6490 introduces a patch to libvpx=20
> that fixes the library's hardcoded soft/hardfp flags.
> Without this patch, the library cannot be built for hardfp targets.
> I cherry-picked it on my local repository, and it worked well with danny.
>=20
pushed to danny-next,

thanks
Eric


