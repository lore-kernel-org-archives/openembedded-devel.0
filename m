Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JbxVi-00080H-CJ
	for openembedded-devel@openembedded.org; Wed, 19 Mar 2008 13:35:19 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JbxVh-0004NI-MW
	for openembedded-devel@openembedded.org; Wed, 19 Mar 2008 12:35:13 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 19 Mar 2008 12:35:13 +0000
Received: from koen by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 19 Mar 2008 12:35:13 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Wed, 19 Mar 2008 13:35:05 +0100
Message-ID: <frr19p$t15$1@ger.gmane.org>
References: <3D9ECBB5-7C37-4D62-8D15-F2F0673EB867@student.utwente.nl>
	<1205928049.29700.7.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
In-Reply-To: <1205928049.29700.7.camel@hammer.suse.cz>
X-Enigmail-Version: 0.95.6
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] error out on .la files pointing to ${WORKDIR}
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
X-List-Received-Date: Wed, 19 Mar 2008 12:35:19 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Stanislav Brabec schreef:
| Koen Kooi wrote:
|
|> Things in stagin (e.g. .la files) point to ${WORKDIR} are broken and
|> should die. If we want packaged-staging and rm_work to function we
|> need to fix them. Since we are all lazy we need some incentive:
|
| This policy is applied in OpenSUSE for several years. So if any packages
| are broken upstream, you will find a fix in OpenSUSE nearly for sure.

Great! Do you have a link to the patch repository?

regards,

Koen


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFH4Qh5MkyGM64RGpERApkUAKC7p4KC+hkhMY9zbDksowMUBVDrygCgsPHD
iuCKVlnsFJOonlrGTKAFzXE=
=cuBG
-----END PGP SIGNATURE-----



