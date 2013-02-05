Received: from smtpfb1-g21.free.fr ([212.27.42.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1U2iET-00052A-94
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Feb 2013 14:06:51 +0100
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by smtpfb1-g21.free.fr (Postfix) with ESMTP id 81C042CEDC
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Feb 2013 13:50:52 +0100 (CET)
Received: from e6520eb (pac33-2-82-240-38-71.fbx.proxad.net [82.240.38.71])
	(Authenticated sender: eukrea)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id 64F894B018E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Feb 2013 13:50:47 +0100 (CET)
Date: Tue, 5 Feb 2013 13:50:45 +0100
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130205135045.140ea114@e6520eb>
In-Reply-To: <1360013234-32521-1-git-send-email-Martin.Jansa@gmail.com>
References: <1360013234-32521-1-git-send-email-Martin.Jansa@gmail.com>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.13; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Subject: Re: [PATCH][meta-browser] firefox-l10n, firefox-addon: use RDEPENDS_${PN}
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
X-List-Received-Date: Tue, 05 Feb 2013 13:06:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Le Mon,  4 Feb 2013 22:27:14 +0100,
Martin Jansa <martin.jansa@gmail.com> a =C3=A9crit :

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes-mozilla/firefox-addon/firefox-addon.inc | 2 +-
>  recipes-mozilla/firefox-l10n/firefox-l10n.inc   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
applied to master

thanks
Eric


