Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1SAf8k-0008Qy-J7
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Mar 2012 11:21:06 +0100
Received: from eb-e6520 (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 030E9A6265
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2012 11:12:09 +0100 (CET)
Date: Thu, 22 Mar 2012 11:12:08 +0100
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120322111208.4530c234@eb-e6520>
In-Reply-To: <20120322100758.GG4010@jama.jama.net>
References: <1332410499-18183-1-git-send-email-koen@dominion.thruhere.net>
	<20120322100758.GG4010@jama.jama.net>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Subject: Re: [RFC][meta-oe][meta-toolchain][PATCH] meta-toolchain: populate with gcc and binutils from meta-oe
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
X-List-Received-Date: Thu, 22 Mar 2012 10:21:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Le Thu, 22 Mar 2012 11:07:58 +0100,
Martin Jansa <martin.jansa@gmail.com> a =E9crit :

> On Thu, Mar 22, 2012 at 11:01:39AM +0100, Koen Kooi wrote:
> > Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>=20
> Why not move them?
>=20
> Or create stub of meta-toolchain in 1st patch for people to add it to
> bblayers and then move it in 2nd.
>=20
> If it was copied just that people doesn't have to=20
> update bblayers at the same time as git pull from meta-oe.
>=20
I think the next step is a patch removing them from meta-oe to make
the change less intrusive than a one shot move and give people the
time to update their bblayers.conf.

Eric


