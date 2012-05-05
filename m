Received: from gn237.zone.eu ([217.146.67.237])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <plaes@plaes.org>) id 1SQlOh-0006MT-10
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 May 2012 22:16:07 +0200
Received: from wow (184-146-131-46.internet.emt.ee [46.131.146.184])
	(Authenticated sender: plaes@plaes.org)
	by gn237.zone.eu (Postfix) with ESMTPSA id 5C497DEB0B36
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  5 May 2012 23:06:18 +0300 (EEST)
Received: by wow (sSMTP sendmail emulation); Sat, 05 May 2012 23:05:54 +0300
From: "Priit Laes" <plaes@plaes.org>
Message-ID: <1336248354.26091.4.camel@localhost.localdomain>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 05 May 2012 23:05:54 +0300
In-Reply-To: <4FA58128.7030906@gmail.com>
References: <1336237032.22405.2.camel@localhost.localdomain>
	<4FA58128.7030906@gmail.com>
X-Mailer: Evolution 3.4.1 
Mime-Version: 1.0
Subject: Re: [meta-handheld] Troubles building kernel for h2200
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
X-List-Received-Date: Sat, 05 May 2012 20:16:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=C3=9Chel kenal p=C3=A4eval, L, 05.05.2012 kell 12:36, kirjutas Khem Raj:
> On 05/05/2012 09:57 AM, Priit Laes wrote:
> > include/asm/arch/uncompress.h:20:20: warning: conflicting types for
> > built-in function 'putc'
>=20
> what version of binutils+gcc is in play and which version of kernel is
> it ?
binutils-2.20.1-r9
gcc-4.5-r49+svnr184907

And kernel is linux-handhelds-2.6-2.6.21-hh20-r27

It's quite possible that I'm posting to the wrong place because I've set
up the system using Angstrom's setup-scripts
( https://github.com/angstrom-distribution/setup-scripts )
using the following tutorial:
http://www.angstrom-distribution.org/building-angstrom


P=C3=A4ikest,
Priit Laes


