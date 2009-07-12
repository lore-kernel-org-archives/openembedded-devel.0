Received: from [64.22.125.45] (helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1MQ2dj-00031h-QV
	for Openembedded-devel@lists.openembedded.org;
	Sun, 12 Jul 2009 19:15:05 +0200
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id B2DF52C9FF
	for <Openembedded-devel@lists.openembedded.org>;
	Sun, 12 Jul 2009 17:01:17 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0W9su5HfNwNG
	for <Openembedded-devel@lists.openembedded.org>;
	Sun, 12 Jul 2009 17:01:16 +0000 (UTC)
Received: from [10.1.10.2] (host61-87-static.14-79-b.business.telecomitalia.it
	[79.14.87.61]) by wiki.koala.it (Postfix) with ESMTPSA id E363C2C829
	for <Openembedded-devel@lists.openembedded.org>;
	Sun, 12 Jul 2009 17:01:15 +0000 (UTC)
Message-ID: <4A5A1705.5050302@gmail.com>
Date: Sun, 12 Jul 2009 19:01:57 +0200
From: Marco Cavallini <koansoftware@gmail.com>
Organization: KOAN sas - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.22 (X11/20090608)
MIME-Version: 1.0
To: Openembedded-devel@lists.openembedded.org
Subject: Using git tags with OE
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
X-List-Received-Date: Sun, 12 Jul 2009 17:15:10 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Hello,
anybody knows if is possible to use git tags with OE ?

I'd like to tag a patch (SHA-1) identifying a particular 'state of the
art' like it was a 'stable' version.
At the moment I save the last patch SHA-1 and I use it as reference.
For example if I successfully build just now a particular version, then
I tag it mck-0.0.1 into OE so everybody can refer to such tag in the futu=
re.

I thought it could be a good idea, what do you think?

Cordiali Saluti / Kindest Regards / mit freundlichen Gr=FCssen
--
Marco Cavallini | KOAN sas | Bergamo - Italia
 embedded and real-time software engineering
Phone:+39-035-255.235 - Fax:+39-178-22.39.748
      http://www.KoanSoftware.com


