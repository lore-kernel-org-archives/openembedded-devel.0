Received: from [93.97.175.187] (helo=dan.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1MU6dh-0007Ce-SO
	for openembedded-devel@openembedded.org; Fri, 24 Jul 2009 00:19:50 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n6NM4SpH019596 for <openembedded-devel@openembedded.org>;
	Thu, 23 Jul 2009 23:04:28 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id lz2XxPdjbY1U for <openembedded-devel@openembedded.org>;
	Thu, 23 Jul 2009 23:04:28 +0100 (BST)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n6NM4O5F019580
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@openembedded.org>;
	Thu, 23 Jul 2009 23:04:26 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <200907232141.13597.khimov@altell.ru>
References: <1248201134.26475.15.camel@dax.rpnet.com>
	<200907231246.26866.khimov@altell.ru>
	<1248351596.14790.28.camel@dax.rpnet.com>
	<200907232141.13597.khimov@altell.ru>
Date: Thu, 23 Jul 2009 23:03:35 +0100
Message-Id: <1248386615.14790.43.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-MIME-Autoconverted: from 8bit to quoted-printable by dan.rpsys.net id
	n6NM4SpH019596
Subject: Re: [Bitbake-dev] Bitbake runqueue performance improvement
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
X-List-Received-Date: Thu, 23 Jul 2009 22:19:50 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, 2009-07-23 at 21:41 +0400, Roman I Khimov wrote:
> On =D0=A7=D0=B5=D1=82=D0=B2=D0=B5=D1=80=D0=B3 23 =D0=B8=D1=8E=D0=BB=D1=8F=
 2009 16:19:56 Richard Purdie wrote:
> > The whole point is that we want the dependencies to be clear. Your
> > approach is anything but clear IMO.
>=20
> Well, using DEPENDS for dependencies still looks way better to me, but =
feel=20
> free to revert it.

Are there recipes in OE which need fixing prior to that happening?

Cheers,

Richard



