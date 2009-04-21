Received: from [64.22.125.45] (helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1LwBVn-0000zb-Qr
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Apr 2009 10:39:29 +0200
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id 5F6502C7FD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Apr 2009 08:32:58 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rmpW+-Z+4HqV
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Apr 2009 08:32:57 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTP id C869C2C797
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Apr 2009 08:32:55 +0000 (UTC)
Message-ID: <49ED8539.6000006@gmail.com>
Date: Tue, 21 Apr 2009 10:35:05 +0200
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <49ED22A1.7090208@tait.co.nz>
In-Reply-To: <49ED22A1.7090208@tait.co.nz>
Subject: Re: devshell "No protocol specified"
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
X-List-Received-Date: Tue, 21 Apr 2009 08:39:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Douglas Royds ha scritto:
> Failing to get a devshell console. Fails for both XTERM and KONSOLE:
>=20
> | No protocol specified
> | xterm Xt error: Can't open display: :0
>=20
> The failure is unique to one box (ie. it works fine on a different
> computer).



we recently solved an identical issue
see thread 20/04/2009 "[oe] devshell not working with screen remote shell=
"

BTW could you descrive better what are you doing?
are you on local or remote machine?

Can you try calling xterm in your console?
What happens?

Cordiali Saluti / Kindest Regards / mit freundlichen Gr=C3=BCssen
--
Marco Cavallini | KOAN sas | Bergamo - Italia
 embedded and real-time software engineering
   Atmel third party certified consultant
Phone:+39-035-255.235 - Fax:+39-178-22.39.748
      http://www.KoanSoftware.com


