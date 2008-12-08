Received: from [83.222.19.8] (helo=mail.asoft.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mad@mail.asoft.ru>) id 1L9nkv-0001wM-5D
	for openembedded-devel@openembedded.org; Mon, 08 Dec 2008 22:35:05 +0100
Received: from localhost ([95.72.101.9]) (authenticated bits=0)
	by mail.asoft.ru (8.13.4/8.13.4) with ESMTP id mB8LV70B017697;
	Tue, 9 Dec 2008 00:31:09 +0300
Date: Tue, 9 Dec 2008 00:31:08 +0300
From: Dmitry Artamonow <mad_soft@inbox.ru>
To: Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>
Message-ID: <20081208213107.GA5746@rainbow>
References: <ghithj$qk7$2@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <ghithj$qk7$2@ger.gmane.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-Greylist: Sender succeeded SMTP AUTH authentication, not delayed by
	milter-greylist-2.0.2 (mail.asoft.ru [0.0.0.0]);
	Tue, 09 Dec 2008 00:31:09 +0300 (MSK)
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.asoft.ru id
	mB8LV70B017697
Cc: openembedded-devel@openembedded.org
Subject: Re: [Angstrom-devel] ANGSTROM_MODE renamed to ANGSTROMLIBC
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
X-List-Received-Date: Mon, 08 Dec 2008 21:35:05 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 11:39 Mon 08 Dec     , Koen Kooi wrote:
> Hi,
>
> Due to changes in how bitbake handles environment vars ANGSTROM_MODE ha=
s=20
> been renamed to ANGSTROMLIBC:
>
> http://cgit.openembedded.net/cgit.cgi?url=3Dopenembedded/commit/&id=3D3=
25476d19b821623dbe151d7026c20dfd3754432
>
> Please update your private buildscripts accordingly, the public angstro=
m=20
> ones have already been updated.
>
I think "Building =C5ngstr=F6m" page [1] should be updated as well - it
mentions ANGSTROM_MODE in the couple of places.

> regards,
>
> Koen
>

[1] http://www.angstrom-distribution.org/building-%C3%A5ngstr%C3%B6m

--=20
Best regards,
Dmitry "MAD" Artamonow



