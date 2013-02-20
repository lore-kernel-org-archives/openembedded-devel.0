Received: from smtpfb2-g21.free.fr ([212.27.42.10])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1U85Ni-0004dn-3P
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Feb 2013 09:50:41 +0100
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by smtpfb2-g21.free.fr (Postfix) with ESMTP id 78E98D19808
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Feb 2013 09:34:16 +0100 (CET)
Received: from e6520eb (tal33-3-82-233-81-124.fbx.proxad.net [82.233.81.124])
	(Authenticated sender: eukrea)
	by smtp3-g21.free.fr (Postfix) with ESMTPSA id 36A29A6294;
	Wed, 20 Feb 2013 09:34:06 +0100 (CET)
Date: Wed, 20 Feb 2013 09:34:05 +0100
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: "Usman, Fahad" <Fahad_Usman@mentor.com>
Message-ID: <20130220093405.48359dc5@e6520eb>
In-Reply-To: <51248946.8090005@mentor.com>
References: <1358786627-20844-1-git-send-email-fahad_usman@mentor.com>
	<51248946.8090005@mentor.com>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.13; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-browser][PATCH] nss: fix access to https websites
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
X-List-Received-Date: Wed, 20 Feb 2013 08:50:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Fahad,

Le Wed, 20 Feb 2013 13:28:54 +0500,
"Usman, Fahad" <Fahad_Usman@mentor.com> a =C3=A9crit :

> On 01/21/2013 09:43 PM, Fahad Usman wrote:
> > Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
> > ---
> >   recipes-support/nss/nss_3.13.3.bb |    4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> >
> Can someone review this patch.
>=20
I applied it a few weeks ago :
https://github.com/OSSystems/meta-browser/commit/d2061edf243ee12caa1a89439f=
fb6af8945b8054

Eric


