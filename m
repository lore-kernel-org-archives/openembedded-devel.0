Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TDbYQ-0005ZP-HC for openembedded-devel@lists.openembedded.org;
	Mon, 17 Sep 2012 15:40:03 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TDbMG-00074H-MV for openembedded-devel@lists.openembedded.org;
	Mon, 17 Sep 2012 15:27:28 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2012 15:27:28 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2012 15:27:28 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 17 Sep 2012 15:27:16 +0200
Message-ID: <k378fh$nm6$1@ger.gmane.org>
References: <1347879491-2425-1-git-send-email-koen@dominion.thruhere.net>
	<CAP9ODKr6hWv7ED5YWxX1vbouE3C-NSySoKxi=7FOW_J-xoFS_g@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
In-Reply-To: <CAP9ODKr6hWv7ED5YWxX1vbouE3C-NSySoKxi=7FOW_J-xoFS_g@mail.gmail.com>
X-Enigmail-Version: 1.4.4
Subject: Re: [for-denzil][systemd update 0/6] Systemd updates
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
X-List-Received-Date: Mon, 17 Sep 2012 13:40:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 17-09-12 15:13, Otavio Salvador schreef:
> On Mon, Sep 17, 2012 at 7:58 AM, Koen Kooi <koen@dominion.thruhere.net>
> wrote:
>> A big update to systemd v189. Runtime tested on angstrom.
>> 
>> This patchset depends on the bluez updates sent to the oe-core list
>> since bluez uses a deprecated udev API that went away somewhere in
>> between 182 and 189.
> 
> This is a too big update for a stable branch in my point of view.

It however is the only sane way to fix all the bugs users have reported with
system v44. I stopped with backporting patches after the stack grew to 30+
patches.

So what's your plan for getting the systemd bugs fixed in this branch?

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQVyU0MkyGM64RGpERAhdKAJ4q1oqH4fKmnJybuBW+AM1MO3+P8ACcDN8Z
PzJwU9L8SY0kjTUUOJ199aA=
=jw6F
-----END PGP SIGNATURE-----



