Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JZ6Ob-0004ve-DX
	for openembedded-devel@openembedded.org; Tue, 11 Mar 2008 16:28:25 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JZ6Ma-0005It-Ng
	for openembedded-devel@openembedded.org; Tue, 11 Mar 2008 15:26:00 +0000
Received: from wlan141019.mobiel.utwente.nl ([130.89.141.19])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 11 Mar 2008 15:26:00 +0000
Received: from koen by wlan141019.mobiel.utwente.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 11 Mar 2008 15:26:00 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Tue, 11 Mar 2008 16:25:51 +0100
Message-ID: <fr689v$jps$1@ger.gmane.org>
References: <fr5mkp$h1b$1@ger.gmane.org>
	<200803110950.29059.geoffrey@pager.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: wlan141019.mobiel.utwente.nl
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
In-Reply-To: <200803110950.29059.geoffrey@pager.net>
X-Enigmail-Version: 0.95.6
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
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
X-List-Received-Date: Tue, 11 Mar 2008 15:28:49 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Geoffrey Wossum schreef:
| On Tuesday 11 March 2008 05:24:24 am Koen Kooi wrote:
|
|> It seems a lot of people are unaware that there is a stable branch where
|> only review patches get applied:
|>
|> org.openembedded.angstrom-2007.12-stable
|>
|> So I don't want to hear anymore of those "OE is unstable" or "There is
|> no stable branch" complaints anymore, mmmmkay ;)
|
| It might be a good idea to package up a tarball of the stable version

And there's where you make a thinko ;) It's no a stable version, it's a
stable _branch_, so it gets fixes and things, but only _after_ being
reviewed by at least two people. Creating a tarball of that is
fundamentally no different as making a tarball from .dev: it's a
snapshot of a moment in time, while a stable branch aims to "not break,
keep working" during its lifetime.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFH1qR/MkyGM64RGpERAi6XAKCtB7xWDb4Fd78g9hp17Mj111gimwCfXKq+
yi+rQpeQjnV+nsYenxZeJTM=
=TxIL
-----END PGP SIGNATURE-----



