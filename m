Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@haerwu.biz>) id 1JYLyN-0001lr-TO
	for openembedded-devel@openembedded.org; Sun, 09 Mar 2008 14:53:57 +0100
Received: (qmail 16950 invoked by uid 813007); 9 Mar 2008 13:52:08 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 9 Mar 2008 13:52:08 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 9 Mar 2008 14:52:05 +0100
User-Agent: KMail/1.9.9
References: <47D2B73F.7070905@gmx.de>
In-Reply-To: <47D2B73F.7070905@gmx.de>
MIME-Version: 1.0
Message-Id: <200803091452.06972.openembedded@haerwu.biz>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: openembedded@haerwu.biz
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: RFC: move do_deploy to kernel.bbclass
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
X-List-Received-Date: Sun, 09 Mar 2008 13:53:58 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia Saturday 08 of March 2008, Thomas Kunze napisa=B3:
> Hi,
>
> currently nearly every kernel recipe implements do_deploy and nearly
> all implementations are the same. This patch moved do_deploy to
> kernel.bbclass and updates all kernel recipes to use or override it.
> Please have a look if the change this makes to your kernel recipe is ok
> for you. IMO it would be best if you modify your kernel recipe how you
> need it after this is commited. If nobody objects I will commit this
> next Friday (mar 14th).

+1 from me

I did this move in Poky some time ago and forgot to RFC it for OE. So you=20
can also look how it is done in Poky.

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

Do you have any idea how lucky you are that I don't have telekinetic=20
powers?




