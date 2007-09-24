Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1IZknk-0005OS-Pt
	for openembedded-devel@openembedded.org; Mon, 24 Sep 2007 12:04:28 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l8OA07xW010492 for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Sep 2007 12:00:07 +0200
Message-ID: <46F78AB2.10609@student.utwente.nl>
Date: Mon, 24 Sep 2007 12:00:18 +0200
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <E1IZk6G-0000Nw-Ca@linuxtogo.org>
In-Reply-To: <E1IZk6G-0000Nw-Ca@linuxtogo.org>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: [oe-commits] org.oe.dev merge of	'709567d645f4e7cbcb5c96f0cf8b99276d2e9318'
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
X-List-Received-Date: Mon, 24 Sep 2007 10:04:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

rwhitby commit schreef:
> merge of '709567d645f4e7cbcb5c96f0cf8b99276d2e9318'
>      and 'bbea886577d16293379de278796e667a3ca5aac3'

I've been noticing that you are pushing a lot of spurious, unneeded and excessive merges,
please stop doing that, it creates an unnecessary burden on the servers, users and scm
history.
Please read the manual on http://monotone.ca if you have trouble understanding monotone.

Everyone: we have an automerger running on monotone.openembedded.org roughly every 30
minutes, so 95% of the time the 'multiple head' situation will resolve itself.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFG94qyMkyGM64RGpERAuv0AKCrog+L0/kFUl52gNht10h8l3x34gCgiWe1
Oro73h/mmdUHWFPrKe1M684=
=v0pE
-----END PGP SIGNATURE-----


