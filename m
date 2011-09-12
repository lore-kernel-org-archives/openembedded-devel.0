Received: from li19-45.members.linode.com ([64.22.125.45] helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koansoftware@gmail.com>) id 1R37xx-00055k-Tj
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Sep 2011 16:58:34 +0200
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id A9D232C7DA;
	Mon, 12 Sep 2011 14:41:32 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nFL98QMg0mkp; Mon, 12 Sep 2011 14:41:28 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTPSA id 11F612C7D7;
	Mon, 12 Sep 2011 14:41:27 +0000 (UTC)
Message-ID: <4E6E1B35.7040709@gmail.com>
Date: Mon, 12 Sep 2011 16:46:13 +0200
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini
User-Agent: Thunderbird 2.0.0.24 (X11/20101027)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4E69E904.6050109@dresearch-fe.de>
	<4E6E14EC.1000301@dresearch-fe.de>
In-Reply-To: <4E6E14EC.1000301@dresearch-fe.de>
Subject: Re: How to verify patches for oe-dev master?
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
X-List-Received-Date: Mon, 12 Sep 2011 14:58:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Steffen Sledz ha scritto, Il 12/09/2011 16:19:
> On 09.09.2011 12:23, Steffen Sledz wrote:
>> At the moment we're using the 2011.03-maintenance branch with angstrom=
-2008.1, and we have a problem verifying patches.
>>
>> Assuming we've found a fix to a bug in 2011.03-maintenance. In my opin=
ion the fix should go to oe-dev master first and find it's way to 2011.03=
-maintenance by a pull request.
>>
>> The problem is that oe-master does not support angstrom-2008.1 any mor=
e, so it's hard to check if the patch compiles/runs well under oe-master.
>=20
> Let me reword the question.
>=20
> Which "general purpose" distros are supported by oe-dev master at the m=
oment and can be used to check if a patch applies, compiles, and runs?
>=20

Hi Steffen,
KaeilOS distro is working in oe-dev master at the moment, but I can't
guarantee that all recipes will work properly with it.

http://www.kaeilos.com/

Feel free to test it if you want.
Tell me more about your system and the issue you are facing to.

Cordiali Saluti / Kindest Regards / mit freundlichen Gr=C3=BCssen
--
Marco Cavallini | KOAN sas | Bergamo - Italia
 embedded and real-time software engineering
   Atmel third party certified consultant
Phone:+39-035-255.235 - Fax:+39-178-22.39.748
      http://www.KoanSoftware.com
        http://www.KaeilOS.com


