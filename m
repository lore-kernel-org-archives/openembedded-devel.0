Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1GNTBz-0007Y7-7N
	for openembedded-devel@openembedded.org; Wed, 13 Sep 2006 13:46:11 +0200
Received: from [172.20.1.6] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	k8DBgZkO013807 for <openembedded-devel@openembedded.org>;
	Wed, 13 Sep 2006 13:42:35 +0200
Message-ID: <4507EEAA.2030004@dominion.kabel.utwente.nl>
Date: Wed, 13 Sep 2006 13:42:34 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.5 (Macintosh/20060719)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>
References: <74d0deb30609122310t64dc8b51wecfa7749806be097@mail.gmail.com>	<1158139503.5540.10.camel@localhost.localdomain>	<74d0deb30609130352p4c1c38cdk5415c04d1e0d3035@mail.gmail.com>	<4507E64D.3040105@dominion.kabel.utwente.nl>
	<74d0deb30609130425qa0394bbl9d5e8374e97793ae@mail.gmail.com>
In-Reply-To: <74d0deb30609130425qa0394bbl9d5e8374e97793ae@mail.gmail.com>
X-Enigmail-Version: 0.94.0.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: machine-specific udev packages
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Sep 2006 11:46:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

pHilipp Zabel schreef:
> On 9/13/06, Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> pHilipp Zabel schreef:
>>
>>> btw,
>>> http://www.openembedded.org/repo/org.openembedded.dev/packages/udev/files/mount.sh
>>> returns a 403
>> We'd welcome input from apachache/web savvy people on how to get .sh/.py/.php files to
>> display as text when accessed from http://www.openembedded.org/repo/ or
>> http://www.openembedded.org/filebrowser.
> 
> I'm not -savvy, but perhaps this could work:
> 
> AddType text/plain sh
> AddType text/plain py
> AddType text/plain php
> 
> in repo/.htaccess

That doesn't work :(

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (Darwin)

iD8DBQFFB+6qMkyGM64RGpERAiHQAJ9bR58S3fx6KeZGyONajPOGwbJcUwCgh3E7
WF7PEj4emDPSKwuVbgv9sOo=
=Et5V
-----END PGP SIGNATURE-----


