Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JhJbn-00028O-Jz
	for openembedded-devel@openembedded.org; Thu, 03 Apr 2008 09:11:39 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JhJbm-0002OD-RI
	for openembedded-devel@openembedded.org; Thu, 03 Apr 2008 07:11:38 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 03 Apr 2008 07:11:38 +0000
Received: from koen by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 03 Apr 2008 07:11:38 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Thu, 03 Apr 2008 09:11:14 +0200
Message-ID: <ft1vui$j7p$1@ger.gmane.org>
References: <c6144fd60804020757j5d41176cof723d8f7d2141849@mail.gmail.com>
	<47F47DD0.7090702@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
In-Reply-To: <47F47DD0.7090702@gmail.com>
X-Enigmail-Version: 0.95.6
Sender: news <news@ger.gmane.org>
Cc: openembedded-users@lists.openembedded.org
Subject: Re: openmoko-minimal-image fails to build because of popt dependency
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
X-List-Received-Date: Thu, 03 Apr 2008 07:11:39 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Junqian Gordon Xu schreef:
| On 04/02/2008 09:57 AM, Peter Haijen wrote:

|> -DEPENDS = "gettext virtual/libintl"
|> +DEPENDS = "gettext virtual/libintl libiconv"

NEVER EVER put libiconv in DEPENDS, we have virtual/libiconv for that.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFH9IMSMkyGM64RGpERAtmmAJsEEaGMVyFM3SG1bwdB/Z1DVo+7mwCfSDvR
378dLiu/P+qQkz5HVaYfnUA=
=cwv9
-----END PGP SIGNATURE-----



