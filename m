Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JZ2qR-0005Pb-1H
	for openembedded-devel@openembedded.org; Tue, 11 Mar 2008 12:40:40 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JZ2oW-0002Aw-KO
	for openembedded-devel@openembedded.org; Tue, 11 Mar 2008 11:38:36 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 11 Mar 2008 11:38:36 +0000
Received: from koen by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 11 Mar 2008 11:38:36 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Tue, 11 Mar 2008 12:38:27 +0100
Message-ID: <fr5qvj$1f1$1@ger.gmane.org>
References: <fr5mkp$h1b$1@ger.gmane.org>
	<1205233466.4521.35.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
In-Reply-To: <1205233466.4521.35.camel@dax.rpnet.com>
X-Enigmail-Version: 0.95.6
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [Announce] OpenEmbedded stable branch
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
X-List-Received-Date: Tue, 11 Mar 2008 11:40:41 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Richard Purdie schreef:
| On Tue, 2008-03-11 at 11:24 +0100, Koen Kooi wrote:
|> It seems a lot of people are unaware that there is a stable branch where
|> only review patches get applied:
|>
|> org.openembedded.angstrom-2007.12-stable
|>
|> So I don't want to hear anymore of those "OE is unstable" or "There is
|> no stable branch" complaints anymore, mmmmkay ;)
|
| This is a long running topic on irc at the moment since I "broke" OE.dev
| with the ABI change. I've been trying to point out that OE.dev *is* the
| development branch, I just think that people have got too
| comfortable :/.

And now there is a maintained stable branch. Actually, it has been there
~ for almost 3 months now :)

| I don't think we're doing too badly given the fundamental nature of the
| change though...

Certainly not, I was amazed at how few problems there were. I suspect
the nastiest form of problems is the renamed webkit pkgconfig file,
which means people have to manually delete WebKit*pc to get their build
to continue.

And looking back at how the stable branch has been doing I can say that
OE really *needs* .dev since the act of posting a diff for review is
already too much for most people, let alone review another.

That is why Holger and I want to properly use things like
insane.bbclass, sepukku.bbclass and testlab.bbclass to take the
gruntwork out of regression tracking and QA. Sadly we both are short on
time to work on it properly nowadays :(

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFH1m8zMkyGM64RGpERAgPHAJ0aO5E11ts66PXloJU1cLRKK/mVxACffZdo
CTACXRqLVPuG1WQtVvFsTuM=
=fOqt
-----END PGP SIGNATURE-----



