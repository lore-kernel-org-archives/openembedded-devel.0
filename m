Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TkcDU-0002il-FV for openembedded-devel@lists.openembedded.org;
	Mon, 17 Dec 2012 16:02:53 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TkbzW-0006WY-BH for openembedded-devel@lists.openembedded.org;
	Mon, 17 Dec 2012 15:48:26 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Dec 2012 15:48:26 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Dec 2012 15:48:26 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 17 Dec 2012 15:48:02 +0100
Message-ID: <kanbar$5jn$1@ger.gmane.org>
References: <1355742261-14593-1-git-send-email-ross.burton@intel.com>
	<kan4oj$786$2@ger.gmane.org>
	<CAJTo0LZWt4DwfF6oJ7uTuk2xJTOi0BsLa6mC_JAKYO7-xhJJ3g@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
In-Reply-To: <CAJTo0LZWt4DwfF6oJ7uTuk2xJTOi0BsLa6mC_JAKYO7-xhJJ3g@mail.gmail.com>
X-Enigmail-Version: 1.4.6
Subject: Re: [PATCH] waffle: new package, a GL deferred resolution library.
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
X-List-Received-Date: Mon, 17 Dec 2012 15:02:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 17-12-12 15:20, Burton, Ross schreef:
> On 17 December 2012 12:55, Koen Kooi <koen@dominion.thruhere.net> wrote:
>> *insert usual comment about PR=r0 being a nuisance*
> 
> I still find removing/adding PR lines more annoying than a redundant r0,
> but we'll have to agree to disagree.  Alternatively meta-oe embraces the
> PR service model as oe-core has, and I can drop them for good.

That's a DISTRO thing, not a layer thing to switch to PR service, but yes,
people should switch to PR service sooner than later (angstrom already has).

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQzzCiMkyGM64RGpERAtJPAJ9W+ayP4j81+Rn/GqLuEWowm+uuSQCfd3BR
+oYyQvr39xiq3EtZ9nR6IB8=
=b11f
-----END PGP SIGNATURE-----



