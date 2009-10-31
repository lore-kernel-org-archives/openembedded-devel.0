Received: from [85.214.48.103] (helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1N4FMN-0002ux-06
	for openembedded-devel@lists.openembedded.org;
	Sat, 31 Oct 2009 15:55:22 +0100
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 97E5211001B1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Oct 2009 15:54:11 +0100 (CET)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 271A611000AC
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Oct 2009 15:54:10 +0100 (CET)
Received: from rhein.familie-heinold.de (g225007026.adsl.alicedsl.de
	[92.225.7.26]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Oct 2009 15:54:10 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id C69F33C108; Sat, 31 Oct 2009 15:54:04 +0100 (CET)
Date: Sat, 31 Oct 2009 15:54:04 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091031145402.GA4300@rhein.zuhause.netz>
References: <200910302300.02775.david.lanzendoerfer@o2s.ch>
MIME-Version: 1.0
In-Reply-To: <200910302300.02775.david.lanzendoerfer@o2s.ch>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 85.214.48.103
X-SA-Exim-Mail-From: heinold@inf.fu-berlin.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Maemo5 and OE
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
X-List-Received-Date: Sat, 31 Oct 2009 14:55:23 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2009 at 10:59:56PM +0100, David Lanzend=F6rfer wrote:
> Hi people
> I'm wondering if theres already some OE-port for maemo5.
> I've seen maemo4 in the tree, but maemo5 is missing.
> Is there already some project, or should I do the bitbake files on my o=
wn?
> Is there a wish for a patch to add it into the OE-tree?
> Im asking because I didnt find a running project for maemo5 in OE.
>=20
> greatings
> 	leviathan


Hi,

the maemo4 part isnt perfect and mainly used for building java-packages.
There was the GSoC Project to get working maemo4 images out of OE,=20
but until now its not merged. Maybee when it is merged its easy enough to
setup a maemo5 port.

Bye  Henning


