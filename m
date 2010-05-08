Received: from szluug.org
	([85.17.92.45] helo=americium.stoicheia.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <soltys@szluug.org>) id 1OAfBS-0006mA-2T
	for openembedded-devel@lists.openembedded.org;
	Sat, 08 May 2010 10:14:56 +0200
Received: from [192.168.0.3] (soltys.soad.pl [83.168.118.74])
	by americium.stoicheia.net (Postfix) with ESMTPA id D0ADB68160
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  8 May 2010 10:14:17 +0200 (CEST)
Message-ID: <4BE51C8B.7050401@szluug.org>
Date: Sat, 08 May 2010 10:10:51 +0200
From: =?UTF-8?B?S3J6eXN6dG9mICdzb2x0eXMnIEtvcm/Fm2Npaw==?= <soltys@szluug.org>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; pl;
	rv:1.9.1.9) Gecko/20100317 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4BE43043.2000605@szluug.org> <4BE4E626.8030800@freyther.de>
In-Reply-To: <4BE4E626.8030800@freyther.de>
X-Enigmail-Version: 1.0.1
OpenPGP: id=C7D30884
X-AVK-Virus-Check: AVA 21.240;F1206
X-SA-Exim-Connect-IP: 85.17.92.45
X-SA-Exim-Mail-From: soltys@szluug.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: FreeBSD 8 bitbake errors
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
X-List-Received-Date: Sat, 08 May 2010 08:14:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1
=20
W dniu 2010-05-08 06:18, Holger Freyther pisze:
> On 05/07/2010 11:22 PM, Krzysztof 'soltys' Koro=C5=9Bcik wrote:
>> Hi all,
>> I'm trying to setup oe environment on fresh FreeBSD 8 install. I'd
>> installed everything listed in [1] and [2], but when I try to bitbake
>> anything I get this:
>>
>> [soltys@ ~/oe/ngw100]$ bitbake nano
>> NOTE: Handling BitBake files: / (6387/8361) [76 %]ERROR: Information
>> not available for target 'i386-freebsd8'
>
> we need an entry for freebsd8.x, it should be mostly the same as for
> freebsd7
>

Maybe it's true but there is no entry for any version of freebsd,
coppying entry i386-linux to i386-freebsd8 in siteinfo.bbclass seams
to work for that errors.

- --=20

Krzysztof 'soltys' Koroscik
jid: soltys@szluug.org
e-mail: soltys@szluug.org
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/
=20
iEYEARECAAYFAkvlHIoACgkQNbd+EcfTCITzIgCgplmrEO3w/nAN59nPHjJg0Zmc
d4EAnR6tKj/23CqCI5fu1clm6nSgxeRP
=3DG1WS
-----END PGP SIGNATURE-----



