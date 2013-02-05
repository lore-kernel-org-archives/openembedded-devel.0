Received: from smtpfb2-g21.free.fr ([212.27.42.10])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1U2iFG-00053X-AL
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Feb 2013 14:07:32 +0100
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by smtpfb2-g21.free.fr (Postfix) with ESMTP id 9EE35CC0798
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Feb 2013 13:51:41 +0100 (CET)
Received: from e6520eb (pac33-2-82-240-38-71.fbx.proxad.net [82.240.38.71])
	(Authenticated sender: eukrea)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id B13F54B018E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Feb 2013 13:51:36 +0100 (CET)
Date: Tue, 5 Feb 2013 13:51:35 +0100
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130205135135.75ebf1dd@e6520eb>
In-Reply-To: <1357834959-9937-2-git-send-email-fahad_usman@mentor.com>
References: <1357834959-9937-1-git-send-email-fahad_usman@mentor.com>
	<1357834959-9937-2-git-send-email-fahad_usman@mentor.com>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.13; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Subject: Re: [meta-browser][PATCH 2/2] chromium: fix dependencies
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
X-List-Received-Date: Tue, 05 Feb 2013 13:07:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Le Thu, 10 Jan 2013 21:22:39 +0500,
Fahad Usman <fahad_usman@mentor.com> a =C3=A9crit :

> * fix dependencies to build chromium package successfully with current st=
ate
>   of OE
>=20
> * add native support to libxi
>=20
> Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
> ---
>  recipes-browser/chromium/chromium_19.0.1049.3.bb |    5 +++--
>  recipes-graphics/libxi/libxi_1.6.1.bbappend      |    2 ++
>  2 files changed, 5 insertions(+), 2 deletions(-)
>  create mode 100644 recipes-graphics/libxi/libxi_1.6.1.bbappend
>=20
applied to master

thanks
Eric


