Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JZ76T-0005Yx-HU
	for openembedded-devel@openembedded.org; Tue, 11 Mar 2008 17:13:58 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JZ74X-0007TN-F5
	for openembedded-devel@openembedded.org; Tue, 11 Mar 2008 16:11:25 +0000
Received: from wlan141019.mobiel.utwente.nl ([130.89.141.19])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 11 Mar 2008 16:11:25 +0000
Received: from koen by wlan141019.mobiel.utwente.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 11 Mar 2008 16:11:25 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Tue, 11 Mar 2008 17:11:12 +0100
Message-ID: <fr6av0$voj$1@ger.gmane.org>
References: <200803110807.11368.zecke@selfish.org>	<20080311120056.748ec358@widy.localdomain>	<20080311101433.77a09fd2@cimmeria>
	<200803111514.49573.zecke@selfish.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: wlan141019.mobiel.utwente.nl
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
In-Reply-To: <200803111514.49573.zecke@selfish.org>
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
Subject: Re: Reconsidering the work flow and how the SCM system fits in
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
X-List-Received-Date: Tue, 11 Mar 2008 16:14:07 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Holger Freyther schreef:

| PS: git-add -i and git-rebase -i really won me over

That's the fundamental difference between git and other (D)SCMs: git is
for generating clean patches ready for e-mail, the others are for
recording history. So the real questions are:

- - Are we going to mail around patches, or are we going to pull changes
from (remote) branches directly?

- - Do we want to keep an accurate record of our tries to get things right
or do we want a clean, compact (and technically incomplete) history?

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFH1q8gMkyGM64RGpERAu3kAKCu1egI5CMdAHNQWDYk0nA4W7nxXACfcag3
gDTbF9G9lDlAZirw8TRQP0U=
=PSs/
-----END PGP SIGNATURE-----



