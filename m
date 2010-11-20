Received: from li19-45.members.linode.com ([64.22.125.45] helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1PJkVD-0008Q0-Ii
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Nov 2010 11:17:04 +0100
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id BE2322C7EB
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Nov 2010 10:15:25 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b02vPJgamc8w
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Nov 2010 10:15:21 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTPSA id 1E9D32C7DD
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Nov 2010 10:15:20 +0000 (UTC)
Message-ID: <4CE79FD4.5040905@gmail.com>
Date: Sat, 20 Nov 2010 11:15:48 +0100
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini
User-Agent: Thunderbird 2.0.0.24 (X11/20101027)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CE3D70F.2000101@gmail.com>	<AANLkTin0i5rSxwA8Q3+jN7tLR-Rn3JEei6D==1CjKOh9@mail.gmail.com>	<4CE3EF4C.2050105@gmail.com>	<AANLkTin2v1+3UP_rk593i+V4=e4QeKgPinAkoWNwY0BO@mail.gmail.com>	<4CE42FF0.1000702@mentor.com>
	<4CE4EC1E.50903@gmail.com>
	<AANLkTi=cnG0DyVCmJjKrBEqR4AQgTVVn_ugHyUY194gF@mail.gmail.com>
In-Reply-To: <AANLkTi=cnG0DyVCmJjKrBEqR4AQgTVVn_ugHyUY194gF@mail.gmail.com>
X-SA-Exim-Connect-IP: 64.22.125.45
X-SA-Exim-Mail-From: koansoftware@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_NEUTRAL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Error: git was compiled without libcurl support
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
X-List-Received-Date: Sat, 20 Nov 2010 10:17:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Khem Raj ha scritto, Il 18/11/2010 19:30:

>> Suggestions would be appreciated.
>=20
> why not just use git-native ?
>=20

Due to another error
http://tinderbox.openembedded.net/public/logs/task/10259740.txt


Yes with Debian Lenny and Debian git native because git version is too
old (git-1.6.3.3), and you should face to the following error:

 error: git was compiled without libcurl support

I solved it with this workaround (updated)

http://www.kaeilos.com/debian-lenny-and-git-native

HTH

Cordiali Saluti / Kindest Regards / mit freundlichen Gr=C3=BCssen
--
Marco Cavallini | KOAN sas | Bergamo - Italia
 embedded and real-time software engineering
   Atmel third party certified consultant
Phone:+39-035-255.235 - Fax:+39-178-22.39.748
      http://www.KoanSoftware.com
        http://www.KaeilOS.com



