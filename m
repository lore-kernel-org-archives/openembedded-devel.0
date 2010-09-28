Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1P0hVB-0008AI-PN
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Sep 2010 23:14:18 +0200
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id 094F327C030; Tue, 28 Sep 2010 23:14:01 +0200 (CEST)
Date: Tue, 28 Sep 2010 23:14:01 +0200
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100928211401.GW28423@ibawizard.net>
References: <AANLkTinMWT7K-h+hH0LvPD119Nxxpitro=f6igQvL7-K@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTinMWT7K-h+hH0LvPD119Nxxpitro=f6igQvL7-K@mail.gmail.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@mengele.ibawizard.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] kernel NOTE messages fix
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
X-List-Received-Date: Tue, 28 Sep 2010 21:14:18 -0000
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Frans Meulenbroeks <fransmeulenbroeks@gmail.com> [2010-09-28 18:39:42]:

> The following patch makes (3) happen:
>=20
> diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
> index 5f8bc8a..05ddcc1 100644
> --- a/classes/kernel.bbclass
> +++ b/classes/kernel.bbclass
> @@ -121,7 +121,12 @@ kernel_do_install() {

Hi and thanks! You can add my tested-by, if you wish.

Tested-by: Petr =A9tetiar <ynezz@true.cz>

-- ynezz


