Received: from li19-45.members.linode.com ([64.22.125.45] helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koansoftware@gmail.com>) id 1PpLAH-0006jR-RJ
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Feb 2011 14:42:01 +0100
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id AC5E62C821;
	Tue, 15 Feb 2011 13:40:03 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SJ-NCi86Ohwl; Tue, 15 Feb 2011 13:39:59 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTPSA id 022E12C7D7;
	Tue, 15 Feb 2011 13:39:58 +0000 (UTC)
Message-ID: <4D5A825C.6050604@gmail.com>
Date: Tue, 15 Feb 2011 14:40:44 +0100
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini
User-Agent: Thunderbird 2.0.0.24 (X11/20101027)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1802836.185231297759904253.JavaMail.defaultUser@defaultHost>
In-Reply-To: <1802836.185231297759904253.JavaMail.defaultUser@defaultHost>
Cc: lamiaposta71@gmail.com
Subject: Re: apache2+php5 on Arago
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
X-List-Received-Date: Tue, 15 Feb 2011 13:42:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Luca Bolognini ha scritto, Il 15/02/2011 09:51:
> Yesterday I had an exchange of emails with Raffaele Recalcati, it was=20
> in italian then I'll try to resume briefly so that everyone can read.
> I=20
> was asking Raffaele (by the way, thank you for your prompt reply) if he=
=20
> had some news about the Apache2+php5 segmentation faults that occurred=20
> in Arago distros.
> I'm currently developing for beagleboard and TI816x-
> evm.
> Raffaele pointed out that he had investigated for some time the=20
> crash in Arago=20
> ( https://gforge.ti.com/gf/project/arago/mailman/?
> _forum_action=3DForumMessageBrowse&thread_id=3D3792&action=3DListThread=
s&mailman_id=3D39=20
> )
> but at length he had chosen to compile the two packages with a "pure"=20
> OE environment, without Arago overlay.
> With this choice, he said that=20
> Apache2 is able to open php pages without problems.
> It seems rather=20
> strange, as recipes are more or less the same (Raffaele added some=20
> customizations but they honestly seem not relevant) and tar.gz source=20
> files are identical.
> What can Arago have introduced to produces such=20
> troubles? It's difficult to say.
> It's quite annoying to use Arago for=20
> all packages of my custom filesystem and then switch to OE only for=20
> apache2 and modphp; all my scripting stuff is concerned with Arago,=20
> it's would be great to have everything confined inside Arago layer.
>=20
> Denys told he would have postponed some further investigations on the=20
> topic, maybe now he has some good news?
> Now however I'm going to make=20
> the same tests of Raffaele, that is have the two packages compiled with=
=20
> "pure" OE; in the meantime, if someone has any ideas...
> Thank you,
> bye
>=20
>=20

Luca,
unfortunately for you, I can only confirm that Apache2+php5 work with a
charm on our customers' ARM9 devices using KaeilOS/Openembedded (not Arag=
o).


Cordiali Saluti / Kindest Regards / mit freundlichen Gr=C3=BCssen
--
Marco Cavallini | KOAN sas | Bergamo - Italia
 embedded and real-time software engineering
   Atmel third party certified consultant
Phone:+39-035-255.235 - Fax:+39-178-22.39.748
      http://www.KoanSoftware.com
        http://www.KaeilOS.com




