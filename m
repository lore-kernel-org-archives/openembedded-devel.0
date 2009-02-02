Received: from [64.22.125.45] (helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1LU1ec-0004PP-40
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Feb 2009 17:28:10 +0100
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id 596E82C8A2
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Feb 2009 16:19:36 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6-lOC1c8oWEa
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Feb 2009 16:19:34 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTP id 7CFAC2C799
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Feb 2009 16:19:33 +0000 (UTC)
Message-ID: <49871D38.10906@gmail.com>
Date: Mon, 02 Feb 2009 17:20:08 +0100
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.19 (X11/20090105)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: OpenEmbedded toolchain census
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
X-List-Received-Date: Mon, 02 Feb 2009 16:28:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,
I'd like to take a census of OE toolchains available for different
architectures.
Does anybody want to contribute telling me which machine and which
toolchain is using?

I started with the following:
 MACHINE=3Dcollie arm-oabi
 MACHINE=3Dat91sam9263dk arm-gnueabi

and if there are toolchains for DaVinci, MIPS, PowerPC, and so on.
BTW I wonder what is created for
 MACHINE=3Dgeneric-i586

Any hint will be appreciated :-)

Cordiali Saluti / Kindest Regards / mit freundlichen Gr=C3=BCssen
--
Marco Cavallini | KOAN sas | Bergamo - Italia
 embedded and real-time software engineering
Phone:+39-035-255.235 - Fax:+39-178-22.39.748
      http://www.KoanSoftware.com


