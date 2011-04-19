Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QC7Ws-0000qC-Er for openembedded-devel@lists.openembedded.org;
	Tue, 19 Apr 2011 11:47:30 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QC7UY-0001Cp-9k for openembedded-devel@lists.openembedded.org;
	Tue, 19 Apr 2011 11:45:06 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Apr 2011 11:45:06 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Apr 2011 11:45:06 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 19 Apr 2011 11:28:08 +0200
Message-ID: <iojkj8$bte$1@dough.gmane.org>
References: <y> <1302718094-6384-1-git-send-email-eyalr@ti.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1302718094-6384-1-git-send-email-eyalr@ti.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCHv2] hostap-daemon: build from git sources
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
X-List-Received-Date: Tue, 19 Apr 2011 09:47:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 13-04-11 20:08, Eyal Reizer wrote:
> * Builds a new version 0.8.x which is not released yet as a zip file.
>   This version has new features like WIFI-direct used in new mac80211
>   versions
> * As the recipe is very similar to the 0.7.3 version, I have created
>   a common include file shared between the 0.7.3 version and the
>   git version
> * Updated the 0.7.3 recipe to use this include file and bumped the PR
> 
> Signed-off-by: Eyal Reizer <eyalr@ti.com>

NAK, 'git' is not a valid PV. '0.7.3+git' would be.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNrVWoMkyGM64RGpERAsfeAJ9sTrhaDQ820O+AsC3vb/6Ol76H9gCcCmyR
dtS43YghO+HCu9fFCXHCd4s=
=fS50
-----END PGP SIGNATURE-----



