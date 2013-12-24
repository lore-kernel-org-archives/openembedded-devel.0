Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 0F78260E22
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Dec 2013 14:31:18 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1VvT0u-00053e-Hv for openembedded-devel@lists.openembedded.org;
	Tue, 24 Dec 2013 15:31:16 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Dec 2013 15:31:16 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Dec 2013 15:31:16 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 24 Dec 2013 15:31:07 +0100
Message-ID: <l9c5qu$71s$1@ger.gmane.org>
References: <1386931527-12034-1-git-send-email-schnitzeltony@googlemail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
In-Reply-To: <1386931527-12034-1-git-send-email-schnitzeltony@googlemail.com>
X-Enigmail-Version: 1.6
Subject: Re: [meta-systemd] connman: follow oe-core to 1.20
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Dec 2013 14:31:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Andreas Müller schreef op 13-12-13 11:45:
> Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com> --- 
> .../connman/{connman_1.19.bbappend => connman_1.20.bbappend}
> | 0 1 file changed, 0 insertions(+), 0 deletions(-) rename
> meta-systemd/oe-core/recipes-connectivity/connman/{connman_1.19.bbappend
> => connman_1.20.bbappend} (100%)
> 
> diff --git
> a/meta-systemd/oe-core/recipes-connectivity/connman/connman_1.19.bbappend
> b/meta-systemd/oe-core/recipes-connectivity/connman/connman_1.20.bbappend
>
> 
similarity index 100%
> rename from
> meta-systemd/oe-core/recipes-connectivity/connman/connman_1.19.bbappend 
> rename to
> meta-systemd/oe-core/recipes-connectivity/connman/connman_1.20.bbappend

Do we actually still need those appends? I know we did 2 releases ago, be we
shouldn't need them anymore, right?

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFSuZqrMkyGM64RGpERAua8AJ996vZ7700j9DOMkR5ej0/KsYJcnQCffMI9
2LggTo/r9y41XLrP++Dwi2Q=
=e1x2
-----END PGP SIGNATURE-----


