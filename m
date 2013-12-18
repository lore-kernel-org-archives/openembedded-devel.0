Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 2136760D7F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Dec 2013 13:36:00 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1VtHI5-0008LA-Iv for openembedded-devel@lists.openembedded.org;
	Wed, 18 Dec 2013 14:35:57 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Dec 2013 14:35:57 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Dec 2013 14:35:57 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 18 Dec 2013 14:35:49 +0100
Message-ID: <l8s8b8$s3a$1@ger.gmane.org>
References: <1387298449-20000-1-git-send-email-andrei@gherzan.ro>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.1
In-Reply-To: <1387298449-20000-1-git-send-email-andrei@gherzan.ro>
X-Enigmail-Version: 1.6
Subject: Re: [meta-multimedia][PATCH 1/1] xbmc: Update to v12.2
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
X-List-Received-Date: Wed, 18 Dec 2013 13:36:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Andrei Gherzan schreef op 17-12-13 17:40:

> - -SRCREV = "82388d55dae79cbb2e486e307e23202e76a43efa" - -PV =
> "11.0+gitr${SRCPV}" -PR = "r14" -SRC_URI =
> "git://github.com/xbmc/xbmc.git;branch=eden \ +SRCREV =
> "32b1a5ef9e7f257a2559a3b766e85a55b22aec5f" +SRC_URI =
> "git://github.com/xbmc/xbmc.git;branch=frodo \ 
> file://0001-configure-don-t-run-python-distutils-to-find-STAGING.patch \ 
> file://0002-Revert-fixed-ios-Add-memory-barriers-to-atomic-Add-S.patch \ 
> file://0003-Revert-fixed-ios-Add-memory-barriers-to-cas-assembly.patch \ 
> -
> file://0004-configure-cope-with-ld-is-gold-DISTRO_FEATURE.patch \ -
> file://configure.in-Avoid-running-code.patch \

FWIW, with binutils >2.22 those assembly patches shouldn't be needed anymore
for ARM.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFSsaS1MkyGM64RGpERAjfUAKCQtHAKeeMZ8z/vU6r+yYCRL2qr8ACfdChd
ENyo1YwVrJfN/Yq+PpzTj+A=
=un8I
-----END PGP SIGNATURE-----


