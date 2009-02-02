Received: from [64.22.125.45] (helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1LU2aU-0002tP-J0
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Feb 2009 18:28:09 +0100
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id 9D8552C8A2
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Feb 2009 17:19:23 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mOXxWFUz2CPN
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Feb 2009 17:19:19 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTP id E0BDD2C799
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Feb 2009 17:19:18 +0000 (UTC)
Message-ID: <49872B38.10209@gmail.com>
Date: Mon, 02 Feb 2009 18:19:52 +0100
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.19 (X11/20090105)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <49871D38.10906@gmail.com> <gm77ei$g7v$1@ger.gmane.org>
In-Reply-To: <gm77ei$g7v$1@ger.gmane.org>
Subject: Re: OpenEmbedded toolchain census
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
X-List-Received-Date: Mon, 02 Feb 2009 17:28:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Koen,
thank you for answering.

> Let's answer a few questions first:
>=20
> * What do you mean with "toolchains"?

With the term 'toolchain' I simply mean a GNU/toolchain
(http://en.wikipedia.org/wiki/GNU_toolchain)

> * What do you want to do with the resulting information?

Because I can get a arm-oabi toolchain doing

 MACHINE=3Dcollie bitbake meta-toolchain

I wonder if OE could be used for generic toolchain generation as many
other tools do.

> Angstrom will generate working toolchains for nearly every machine in
> OE, so you don't need to know about toolchains. More to the point, if
> you need to ask about them, you shouldn't be touching them :)

The purpose of this reseach is to understand and document how and how
many toolchain can be managed with OE. Results could be posted into wiki
if this effort will be appreciated.
The purpose of such toolchain could be, for example, to build any source
code or package outside OE environment.

If you have futher questions please ask :-)

Cordiali Saluti / Kindest Regards / mit freundlichen Gr=C3=BCssen
--
Marco Cavallini | KOAN sas | Bergamo - Italia
 embedded and real-time software engineering
Phone:+39-035-255.235 - Fax:+39-178-22.39.748
      http://www.KoanSoftware.com


