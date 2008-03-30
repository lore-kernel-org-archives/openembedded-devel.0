Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JfyH6-0000Za-71
	for openembedded-devel@openembedded.org; Sun, 30 Mar 2008 16:12:44 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JfyH1-00081y-Lt
	for openembedded-devel@openembedded.org; Sun, 30 Mar 2008 14:12:39 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 30 Mar 2008 14:12:39 +0000
Received: from koen by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 30 Mar 2008 14:12:39 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Sun, 30 Mar 2008 16:12:26 +0200
Message-ID: <fso74a$8is$1@ger.gmane.org>
References: <c384c5ea0803300622p72792646uc0f84190c878454b@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
In-Reply-To: <c384c5ea0803300622p72792646uc0f84190c878454b@mail.gmail.com>
X-Enigmail-Version: 0.95.6
Sender: news <news@ger.gmane.org>
Subject: Re: Distro maintainers: consider switching from util-linux to util-linux-ng
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
X-List-Received-Date: Sun, 30 Mar 2008 14:12:44 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Leon Woestenberg schreef:
| Hello all,
|
| consider switching to util-linux-ng, util-linux-ng is the maintained
fork of
| util-linux, whereas the latter is now dead AFAIK.
|
| http://userweb.kernel.org/~kzak/util-linux-ng/

Looks nice, maintained software is almost always nicer than unmaintained
~ sw.

| I have committed it a while ago, and tested it to work ok for me.
Needs more
| testers, so I propose to switch over.
|
| The Changelist:
|
|
http://git.kernel.org/?p=utils/util-linux-ng/util-linux-ng.git;a=blob;f=docs/v2.14-ReleaseNotes;h=c8ca19de79947d21dfbb16b1db4393881a93e47f;hb=915b80830b61264d4b3d3e52797054078595a003
|
| whichs shows me that 2.14 has arrived. Volunteers?

If people add 2.14, please check all the u-a's, since 2.14 includes
ionice, which used to be in the schedutils package (or still is), and
busybox might have grown a few more applets.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFH75/JMkyGM64RGpERAk2rAJ9jZmEoxosyF0dx9YdH/k9GYkIU6QCgnXB+
gAYrYW4di1d+q0On3sNlO1U=
=YO40
-----END PGP SIGNATURE-----



