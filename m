Received: from li19-45.members.linode.com ([64.22.125.45] helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hachreak@koansoftware.com>) id 1O3m4Q-0007dG-4q
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Apr 2010 10:11:06 +0200
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id 42AB42C7F5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Apr 2010 08:06:23 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mWrPpmJ37UZq
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Apr 2010 08:06:19 +0000 (UTC)
Received: from [192.168.1.49]
	(host16-124-dynamic.2-87-r.retail.telecomitalia.it [87.2.124.16])
	by wiki.koala.it (Postfix) with ESMTPSA id 008D82C7DE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Apr 2010 08:06:18 +0000 (UTC)
Message-ID: <4BCC0F40.1070105@koansoftware.com>
Date: Mon, 19 Apr 2010 10:07:28 +0200
From: Leo <hachreak@koansoftware.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; it;
	rv:1.9.1.5) Gecko/20091204 Lightning/1.0b1 Thunderbird/3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 64.22.125.45
X-SA-Exim-Mail-From: hachreak@koansoftware.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: bitbake 1.8.18 don't find recipes in oe.dev
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
X-List-Received-Date: Mon, 19 Apr 2010 08:11:06 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi at all! :D
I use last bitbake stable release 1.8.18 and latest OE git version.
Recently a strange thing happens to me: bitbake can't find any recipes.
So, I tried latest bitbake git version and everything works fine.
Someone has encountered the same problem?

     thanks for all response.
          .hachreak.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJLzA9AAAoJECf4lwfLs0xJGkYIAIK9zt+2J55PegvziI8WMLFU
gUFyYprvHdnDNin1tDhsrJ64Ox5Hs7W5LD+G1fNC/sBjvUhWZxBDtjo7mcUtuTmj
So6NgTqa9EU6sRPVKHVOzyMTZDJu8ZDRW4D7EZ+2VD60GSROjGiVsqEUN/jAuXV+
U+TXDXCkGlHNvZ8RQHMZ+Ll8pJI9fDN8K9dt8kKmXBq9t+cMpyeF1cJx48vBt12D
nQNa6IY1MxxUE/9e9JQVlJAZNQjpCpFaykWyKN21FuCUAkQaRxbtKXwrYJpLWriV
pT47C6bRtPB44SY4SuL1aIP0JMFyfFI3tKz2xbPnI2QjNaBQmdanaQbzzeA9r7o=
=xfid
-----END PGP SIGNATURE-----


