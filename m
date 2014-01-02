Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 143DB6B5D0
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2014 12:55:38 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1VyhoI-000252-3f for openembedded-devel@lists.openembedded.org;
	Thu, 02 Jan 2014 13:55:38 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jan 2014 13:55:38 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jan 2014 13:55:38 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 02 Jan 2014 13:56:16 +0100
Message-ID: <la3njk$rh$1@ger.gmane.org>
References: <1388577530-4557-1-git-send-email-Martin.Jansa@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
In-Reply-To: <1388577530-4557-1-git-send-email-Martin.Jansa@gmail.com>
X-Enigmail-Version: 1.6
Subject: Re: [meta-oe][PATCH] udisks: Don't enable acl PACKAGECONFIG by default
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
X-List-Received-Date: Thu, 02 Jan 2014 12:55:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Martin Jansa schreef op 01-01-14 12:58:
> * libacl isn't available in oe-core/meta-oe

Yes it is:
https://github.com/openembedded/oe-core/blob/master/meta/recipes-support/attr/acl_2.2.52.bb

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFSxWHwMkyGM64RGpERAvmGAKCzy6nSaxbWBhe9/VaXl439dfWRiwCfa3vp
ez5rPMtceGixyAcVTm2XEUE=
=rj77
-----END PGP SIGNATURE-----


