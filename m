Received: from [141.2.4.18] (helo=mail.tm.informatik.uni-frankfurt.de)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <mickey@tm.informatik.uni-frankfurt.de>)
	id 1GKERr-0003vt-BC for openembedded-devel@lists.openembedded.org;
	Mon, 04 Sep 2006 15:25:11 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.tm.informatik.uni-frankfurt.de (Postfix) with ESMTP id 896BB8DC
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Sep 2006 15:22:32 +0200 (CEST)
Received: from mail.tm.informatik.uni-frankfurt.de ([127.0.0.1])
	by localhost (mail [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 24117-03 for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Sep 2006 15:22:28 +0200 (CEST)
Received: from [141.2.14.64] (gandalf.tm.informatik.uni-frankfurt.de
	[141.2.14.64])
	by mail.tm.informatik.uni-frankfurt.de (Postfix) with ESMTP id B68258D5
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Sep 2006 15:22:28 +0200 (CEST)
From: Michael 'Mickey' Lauer <mickey@tm.informatik.uni-frankfurt.de>
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <44FC27A2.90909@repvik.org>
References: <E1GKCrb-0005hO-P4@linuxtogo.org>
	<1157373682.16945.61.camel@gandalf.tm.informatik.uni-frankfurt.de>
	<44FC27A2.90909@repvik.org>
Organization: VanilleMedia
Date: Mon, 04 Sep 2006 15:22:28 +0200
Message-Id: <1157376148.16945.71.camel@gandalf.tm.informatik.uni-frankfurt.de>
Mime-Version: 1.0
X-Mailer: Evolution 2.7.2.1-3mdv2007.0 
X-Virus-Scanned: by amavisd-new at tm.informatik.uni-frankfurt.de
Subject: Re: Improving consistency
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Sep 2006 13:25:11 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Am Montag, den 04.09.2006, 15:18 +0200 schrieb =D8yvind Repvik:
> Michael 'Mickey' Lauer wrote:
> > Hi developers,
> >=20
> > when you are adding new versions of a bitbake recipe, please
> > take a chance to reorder the metadata according to the
> > "standard" layout found in http://openembedded.org/wiki/StyleGuide
> >=20
>=20
> Question from the curious:
>=20
> Tabs should not be used (use spaces instead). <-- Why is this?

The major problem with tabs is that their appearance depends
on the user's setting (e.g. 4 spaces / 8 spaces per tab), whereas
a fixed number of spaces look the same everywhere
(given a fixed-width font, of course).

When people with 4-spaces-per-tab are editing recipes from people
with 8-spaces-per-tab everything gets messed up. This is why I like
to recommend using all spaces.

--=20
Regards,

Michael 'Mickey' Lauer | FreeLancer | http://www.Vanille-Media.de




