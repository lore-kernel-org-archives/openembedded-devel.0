Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HN3oG-0008LC-Ru
	for openembedded-devel@openembedded.org; Fri, 02 Mar 2007 10:12:16 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l229CCox031435 for <openembedded-devel@openembedded.org>;
	Fri, 2 Mar 2007 10:12:12 +0100
Message-ID: <45E7EA6A.7030108@dominion.kabel.utwente.nl>
Date: Fri, 02 Mar 2007 10:12:10 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <07ee01c75c94$15472dd0$6e01a8c0@twilight>
In-Reply-To: <07ee01c75c94$15472dd0$6e01a8c0@twilight>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: fuse package broken?
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
X-List-Received-Date: Fri, 02 Mar 2007 09:12:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Mike (mwester) schreef:
> Is anyone using the fuse packages currently?
> 
> The latest version in OE doesn't build correctly for me (it immediately
> starts building fuse-module -- which is no longer necessary since the fuse
> kernel module is in recent kernels already 

But not in the 2.4 kernels which I targetted when adding fuse. However, every machine I
have seems to support a recent 2.6 kernel nowadays, so I could care less about 2.4. I
think the standalone module can be removed, unless some volunteer steps up to maintain it
for the 2.4 machines.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFF5+pqMkyGM64RGpERAsFHAJ9sVLQbeVimZTm84ZtDNT2/XIvh6gCfekY0
4L0Tk0tjBsg5tO4uPTycRTU=
=CLV4
-----END PGP SIGNATURE-----


