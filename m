Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1SFNSx-0003Mj-Ep
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Apr 2012 12:29:27 +0200
Received: from eb-e6520 (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 334A64B0147
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Apr 2012 12:20:14 +0200 (CEST)
Date: Wed, 4 Apr 2012 12:20:13 +0200
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120404122013.5f98850b@eb-e6520>
In-Reply-To: <20120404072419.GC4181@jama.jama.net>
References: <20120404091720.4b743c5b@eb-e6520>
	<20120404072419.GC4181@jama.jama.net>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Subject: Re: build meta-oe without systemd
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
X-List-Received-Date: Wed, 04 Apr 2012 10:29:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Le Wed, 4 Apr 2012 09:24:19 +0200,
Martin Jansa <martin.jansa@gmail.com> a =E9crit :

> On Wed, Apr 04, 2012 at 09:17:20AM +0200, Eric B=E9nard wrote:
> > Hi,
> >=20
> > would that make sense to support systemd as a DISTRO_FEATURES ?
> > That would make builds using older udev (< 174) possible with meta-oe as
> > this actually fails because of systemd.
>=20
> You mean without runtime dependency on systemd or even without build
> time dep?
>=20
I mean build time dependency.

Eric


