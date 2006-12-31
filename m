Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1H0ybD-0001Dt-7d
	for openembedded-devel@openembedded.org; Sun, 31 Dec 2006 12:11:31 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	kBVBAYLr026329 for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Dec 2006 12:10:34 +0100
Message-ID: <45979AA9.3030905@dominion.kabel.utwente.nl>
Date: Sun, 31 Dec 2006 12:10:33 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <20061230051641.GA30225@hezmatt.org>	<1167506369.5626.46.camel@localhost.localdomain>	<20061230214326.GE15188@hezmatt.org>	<4596E33D.306@dominion.kabel.utwente.nl>	<20061230235938.GC16490@hezmatt.org>	<1167523571.5626.59.camel@localhost.localdomain>	<459786C7.70000@dominion.kabel.utwente.nl>
	<20061231110033.GA22098@hezmatt.org>
In-Reply-To: <20061231110033.GA22098@hezmatt.org>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: A question of workflow
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
X-List-Received-Date: Sun, 31 Dec 2006 11:11:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Matthew Palmer schreef:
> On Sun, Dec 31, 2006 at 10:45:43AM +0100, Koen Kooi wrote:

>> It doesn't matter which SCM we use with that workflow.
> 
> Which does make me wonder why you went with monotone instead of the
> lowest-common-denominator, since you don't appear to be using any of
> monotone's more interesting features?

Offline commit, diff and history as well as peer-to-peer syncing. We've had 2 periods
(when our bk license ran out and when mtn 0.26 changed the network protocol) were we
tested different SCMs (hg, git, svn, svk, mtn) and each time monotone came out on top.
BTW, most of the questions you asked are answered in http://venge.net/monotone/monotone.html.


regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFFl5qpMkyGM64RGpERAkihAKCJqU1kRwEbtMp7LbufGFn1sMJ8KACgiY3k
QVLw7nVwscXhLBam6Mrktjg=
=tgwY
-----END PGP SIGNATURE-----


