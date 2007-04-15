Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1Hcz92-0006il-I9
	for openembedded-devel@openembedded.org; Sun, 15 Apr 2007 09:27:32 +0200
Received: from [130.89.6.63] (vpn006063.vpn.utwente.nl [130.89.6.63])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l3F7RMox015312 for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Apr 2007 09:27:25 +0200
Message-ID: <4621D3CE.9030200@dominion.kabel.utwente.nl>
Date: Sun, 15 Apr 2007 09:27:10 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.10 (Macintosh/20070221)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <E1HcvOy-0006EN-Bi@linuxtogo.org>
In-Reply-To: <E1HcvOy-0006EN-Bi@linuxtogo.org>
X-Enigmail-Version: 0.94.2.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: [oe-commits] org.oe.dev conf/*: remove all MACHINE_TASK_PROVIDER definitions that were simply forcibly defining it to the	default value set in bitbake.conf. Approved by hrw and RP.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 15 Apr 2007 07:27:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

rwhitby commit schreef:
> conf/*: remove all MACHINE_TASK_PROVIDER definitions that were simply forcibly defining it to the default value set in bitbake.conf.  Approved by hrw and RP.
> 
> Author: rwhitby@nslu2-linux.org

> conf/distro/include/angstrom.inc

Could you please consult with the distro maintainers before making such changes next time?
The line was left in there to fix angstrom for people with a bogus MACHINE_TASK_PROVIDER
entry in their local.conf.
OTOH, people now get what they deserve now when putting bogus entries in local.conf :)

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGIdPOMkyGM64RGpERAgKrAKCupbjJDnWTtoaTTBjuMueZH5kznwCggqkl
MdRJ7LalRiiqwU6I9rlCK4M=
=Yvo4
-----END PGP SIGNATURE-----


