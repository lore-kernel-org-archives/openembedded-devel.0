Received: from [89.149.220.217] (helo=mail.kynisk.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <repvik@kynisk.com>) id 1HNsLn-0004OL-J4
	for openembedded-devel@lists.openembedded.org;
	Sun, 04 Mar 2007 16:10:15 +0100
Received: from [192.168.1.21] (54.84-48-194.nextgentel.com [84.48.194.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.kynisk.com (Postfix) with ESMTP id BDC9D1BF29C
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Mar 2007 16:10:15 +0100 (CET)
From: =?iso-8859-1?q?=D8yvind_Repvik?= <repvik@kynisk.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 4 Mar 2007 16:10:02 +0100
User-Agent: KMail/1.9.5
References: <45E77A73.5020800@protium.com>
	<1173019764.11398.143.camel@localhost.localdomain>
	<45EADF33.1060409@dominion.kabel.utwente.nl>
In-Reply-To: <45EADF33.1060409@dominion.kabel.utwente.nl>
MIME-Version: 1.0
Message-Id: <200703041610.02456.repvik@kynisk.com>
Subject: Re: [oe-commits] org.oe.dev rootfs_ipk: as per OE, policy:	remove feed management tools
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 04 Mar 2007 15:10:15 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Sunday 04 March 2007 16:01, Koen Kooi wrote:
> Matthias Hentges schreef:
> > Am Sonntag, den 04.03.2007, 12:31 +0100 schrieb Koen Kooi:
> >> Assuming the above didn't break, what about this:
> >>
> >> 'bitbake package-index' will generate a deploy/bogofeed, everything el=
se
> >> stays as it is now.
> >
> > My reverted cset did exactly the above, it didn't even so much as touch
> > your holy new ipk directory.
>
> But you put it in do_rootfs, where it doesn't belong.

Well, why didn't you say that in the first place, instead of all this silly=
=20
bickering? This argument has been extremely un-constructive, and the only=20
reason I can see for your arguments when they are all summed up is that you=
=20
made a mistake and you're trying to cover your ass. Get over it already, mo=
ve=20
it away from do_rootfs, but make it possible to choose.

Regards,
=D8yvind Repvik


