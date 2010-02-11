Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NfZmi-000392-KG for openembedded-devel@lists.openembedded.org;
	Thu, 11 Feb 2010 15:12:52 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NfZk6-00013g-Th for openembedded-devel@lists.openembedded.org;
	Thu, 11 Feb 2010 15:10:06 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Feb 2010 15:10:06 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Feb 2010 15:10:06 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 11 Feb 2010 15:06:42 +0100
Message-ID: <hl12tg$meo$2@ger.gmane.org>
References: <1265832780-19939-1-git-send-email-rep.dot.nop@gmail.com>	<1265832780-19939-2-git-send-email-rep.dot.nop@gmail.com>	<1265832780-19939-3-git-send-email-rep.dot.nop@gmail.com>	<1265832780-19939-4-git-send-email-rep.dot.nop@gmail.com>	<1265832780-19939-5-git-send-email-rep.dot.nop@gmail.com>	<1265832780-19939-6-git-send-email-rep.dot.nop@gmail.com>	<1265832780-19939-7-git-send-email-rep.dot.nop@gmail.com>	<1265832780-19939-8-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-9-git-send-email-rep.dot.nop@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100130 Shredder/3.0.2pre
In-Reply-To: <1265832780-19939-9-git-send-email-rep.dot.nop@gmail.com>
X-Enigmail-Version: 1.0.1
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 8/8] xz: add xz package
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
X-List-Received-Date: Thu, 11 Feb 2010 14:12:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 10-02-10 21:13, Bernhard Reutner-Fischer wrote:
> xz is the lzma successor

> +PV = "4.999.9beta"

That seems to violate our versioning policy, you want something like

PV = "4.999.8+4.999.9beta"


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLdA7yMkyGM64RGpERAnsoAJ4uaDiGhIn+wmdxB17vcTC5FeWXwQCeMrZj
IRPeOv6iFyGgLcHcZLL0Wlo=
=qU1s
-----END PGP SIGNATURE-----



