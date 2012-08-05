Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SxzWv-0003ev-O4 for openembedded-devel@lists.openembedded.org;
	Sun, 05 Aug 2012 14:01:57 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SxzLV-0005J3-Ih for openembedded-devel@lists.openembedded.org;
	Sun, 05 Aug 2012 13:50:09 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Aug 2012 13:50:09 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Aug 2012 13:50:09 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sun, 05 Aug 2012 13:47:31 +0200
Message-ID: <jvlmgc$ui5$1@dough.gmane.org>
References: <1344126001-19256-1-git-send-email-schnitzeltony@googlemail.com>
	<501DDDC4.9040301@balister.org>
	<CALbNGRSToYmnu-2nj82cucV5FiGMeYaechEJ+X4dyqdUg=N+iA@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
In-Reply-To: <CALbNGRSToYmnu-2nj82cucV5FiGMeYaechEJ+X4dyqdUg=N+iA@mail.gmail.com>
X-Enigmail-Version: 1.4.3
Subject: Re: [meta-angstrom 00/16] split tasks into recipes to reduce number of build tasks
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
X-List-Received-Date: Sun, 05 Aug 2012 12:01:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 05-08-12 08:53, Andreas Müller schreef:
> On Sun, Aug 5, 2012 at 4:43 AM, Philip Balister <philip@balister.org>
> wrote:
>> Shouldn't this patch go to the Angstrom list?
> You are right but from my experience the response on angstrom list is 
> weak and as far as I know there is no patchwork for angstrom.

It is still the only correct place to send such patches to. I bet Khem can
hook it into patchwork if you ask him.

Also the README (I know, people are too lazy to actually read it) mentions
things like:

"Send pull requests to angstrom-distro-devel@linuxtogo.org with
'[meta-angstrom]' in the subject'"

"You are encouraged to fork the mirror on github"

"Other services like gitorious, repo.or.cz or self hosted setups are of
course accepted as well, 'git fetch <remote>' works the same on all of them."
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQHl1TMkyGM64RGpERAuy3AJ9dlLq26SOSAgEdbKzGhOMVW7jGbwCfZORE
hAoMgxvp8A0vT9mh05992yc=
=KiCb
-----END PGP SIGNATURE-----



