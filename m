Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ss9sv-0002Tn-Sx for openembedded-devel@lists.openembedded.org;
	Fri, 20 Jul 2012 11:52:33 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ss9hw-00073e-Kl for openembedded-devel@lists.openembedded.org;
	Fri, 20 Jul 2012 11:41:12 +0200
Received: from 92.69.199.181 ([92.69.199.181])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jul 2012 11:41:12 +0200
Received: from koen by 92.69.199.181 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jul 2012 11:41:12 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 20 Jul 2012 11:40:59 +0200
Message-ID: <jub93a$odg$1@dough.gmane.org>
References: <1342776917-24116-1-git-send-email-Martin.Jansa@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: 92.69.199.181
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:13.0) Gecko/20120614 Thunderbird/13.0.1
In-Reply-To: <1342776917-24116-1-git-send-email-Martin.Jansa@gmail.com>
X-Enigmail-Version: 1.4.2
Subject: Re: [meta-oe][meta-systemd][PATCH 1/2] systemd: add usbutils to DEPENDS
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
X-List-Received-Date: Fri, 20 Jul 2012 09:52:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 20-07-12 11:35, Martin Jansa schreef:
> * fixes: | No package 'usbutils' found | configure:16015: error: Package
> requirements (usbutils >= 0.82) were not met:
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

koen@dominion:/OE/tentacle/sources/meta-openembedded$ sh contrib/pw-am.sh
32697 32699
2012-07-20 11:39:58 URL:http://patches.openembedded.org/patch/32697/mbox/
[1617] -> "pw-am-32697.patch" [1]
Applying: systemd: add usbutils to DEPENDS
error: patch failed: meta-systemd/recipes-core/systemd/systemd_git.bb:19
error: meta-systemd/recipes-core/systemd/systemd_git.bb: patch does not apply
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQCSerMkyGM64RGpERAoqIAJ0Rt6YFT0K8KCs7+PxGyJxsDs0Q8ACeI3Ga
RQRGiCRllui6tfNwuuzM+d8=
=jKym
-----END PGP SIGNATURE-----



