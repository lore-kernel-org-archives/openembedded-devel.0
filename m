Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1GZ1CN-0007HW-Mo
	for openembedded-devel@openembedded.org; Sun, 15 Oct 2006 10:18:19 +0200
Received: from [130.89.7.128] (vpn007128.vpn.utwente.nl [130.89.7.128])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	k9F8BcJG025650 for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Oct 2006 10:11:38 +0200
Message-ID: <4531ED53.1050506@dominion.kabel.utwente.nl>
Date: Sun, 15 Oct 2006 10:12:03 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.7 (Macintosh/20060909)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>
References: <E1GYf1g-00024R-9w@linuxtogo.org>
	<20061015003742.GB12679@twibble.org>
In-Reply-To: <20061015003742.GB12679@twibble.org>
X-Enigmail-Version: 0.94.1.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: [oe-commits] org.oe.dev strace: bump pr after last patch
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 15 Oct 2006 08:18:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Jamie Lenehan schreef:
> On Sat, Oct 14, 2006 at 10:37:48AM +0200, "koen commit" wrote:
>> strace: bump pr after last patch
> 
> Was there some reason for this? (Just to make sure I didn't miss
> something!) In this case it had no effect on any existing strace
> build (the change is a no-op for glibc < 2.5) and since glibc 2.5
> didn't build previously it can't have had any change on glibc 2.5
> built strace's...

People who's build broke (like me :) ) wouldn't get past it because OE tries to finish
building the unpatched version. I was trying to avoid the 'I updated and it still fails'
bugreports.

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (Darwin)

iD8DBQFFMezqMkyGM64RGpERAu91AKCQi9TdvwBitbJJenZZNnG+qmzU6gCfdsI7
kKmgwCXTcn1sWuiz8BPbKzc=
=yhek
-----END PGP SIGNATURE-----


