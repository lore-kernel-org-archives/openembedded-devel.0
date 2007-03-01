Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HMgku-0004Sr-8b
	for openembedded-devel@openembedded.org; Thu, 01 Mar 2007 09:35:16 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l218ZCox025217 for <openembedded-devel@openembedded.org>;
	Thu, 1 Mar 2007 09:35:12 +0100
Message-ID: <45E6903F.6040708@dominion.kabel.utwente.nl>
Date: Thu, 01 Mar 2007 09:35:11 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <E1HMatS-0005Qf-5q@linuxtogo.org>
In-Reply-To: <E1HMatS-0005Qf-5q@linuxtogo.org>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: [oe-commits] org.oe.dev rootfs_ipk.bbclass: Implements a	sensational new feature called 'oe-feed' which, for the first time ever, actually lets you use your ipk deploy dir as a feed in	ipkg.conf./mtcommit ../classes/rootfs_ipk.bbclass Oh	wait......we already could do that in the past, now couldn't we?? Set DEPLOY_ENABLE_OEFEED=1 in your shell env or	local.conf to activate fast oe-feed/Packages creation, set DEPLOY_ENABLE_OEFEED=2 to enable traditional (and slooooow) oe-feed/Packages creation.
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
X-List-Received-Date: Thu, 01 Mar 2007 08:35:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

coredump2 commit schreef:
> rootfs_ipk.bbclass: Implements a  sensational new feature called 'oe-feed' which

OEs feed management tools were removed a few years ago since it was decided that feed
management was out of scope. That still holds.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFF5pA/MkyGM64RGpERAl19AKCiEPA77iqbTftvDodtwkNY/ht1eQCfSDCb
yMBVcYX011R0J6ZCXeUthho=
=35QD
-----END PGP SIGNATURE-----


