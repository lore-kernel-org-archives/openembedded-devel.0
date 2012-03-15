Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1S8EKV-0000gS-8W
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Mar 2012 18:19:11 +0100
Received: from eb-e6520 (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 8694C4B0179
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Mar 2012 18:10:22 +0100 (CET)
Date: Thu, 15 Mar 2012 18:10:21 +0100
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120315181021.56883348@eb-e6520>
In-Reply-To: <4F622053.50202@dynamicdevices.co.uk>
References: <4F610B38.5060309@dynamicdevices.co.uk>
	<CAP9ODKo_RMjJ1BsP9QQHJY8xwmRzBie3L0DuB1e7jr=N_kuekQ@mail.gmail.com>
	<4F6219FC.7010506@dynamicdevices.co.uk>
	<CAP9ODKrpf0tSGb5e8whj05JUtzjZTkbJMcD2C4TH3YUgJ1pQDg@mail.gmail.com>
	<4F622053.50202@dynamicdevices.co.uk>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Subject: Re: oe-core layer including support for i.MX28
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
X-List-Received-Date: Thu, 15 Mar 2012 17:19:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

Le Thu, 15 Mar 2012 17:01:07 +0000,
Alex J Lennon <ajlennon@dynamicdevices.co.uk> a =E9crit :
> Is the the new machine target and associated recipes, kernel+patches=20
> something that I should expect to be able to merge back into=20
> meta-fsl-arm at some point?
>=20
that depends if meta-fsl-arm is considered as the layer for supporting
evaluation boards from Freescale of the layer which can host any board
using a Freescale i.MX.
I think the first solution is better and that custom boards should
be added to custom layers (maybe on top of meta-fsl-arm if these custom
boards need recipes included in the reference layer).

Eric
--=20
http://eukrea.com/en/news/104-2012


