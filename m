Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1IUNmf-0008Hp-E1
	for openembedded-devel@openembedded.org; Sun, 09 Sep 2007 16:29:09 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l89EQDxP010466 for <openembedded-devel@lists.openembedded.org>;
	Sun, 9 Sep 2007 16:26:14 +0200
Message-ID: <46E4027F.107@student.utwente.nl>
Date: Sun, 09 Sep 2007 16:26:07 +0200
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <46CF6903.7060703@dominion.kabel.utwente.nl>	<20070905225908.dcyz0rbxa8wo4ows@www.bufferoverflow.ch>	<46DFA451.6020006@student.utwente.nl>
	<46E24E51.3080700@student.utwente.nl>
In-Reply-To: <46E24E51.3080700@student.utwente.nl>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: OE website upgraded to drupal 5.2
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
X-List-Received-Date: Sun, 09 Sep 2007 14:29:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Koen Kooi schreef:
> Koen Kooi schreef:
>> Roger Meier schreef:
>>> Hi Koen
>>> Which drupal and module versions did you use before upgrade?
>>> There are still some issues with the wiki headings.
>>> e.g. on page http://www.openembedded.org/wiki/GettingStarted
>> That is manually inserted html, so probably the content-type for wiki needs to get
>> cascaded or we have to patch the markup filter.
> 
> The correct answer was: "we have to patch the markup sanitizer", which I did :) The wiki
> works as expected now, the only issue left is the reversed news.

The reversed news issue turned out to be a case of one 'db_rewrite_sql()' too many, this
is fixed now.

The current TODO:

* unify tinderbox, viewmtn, org.oe.documentation and main website css
* make everything conform to standards (xhtml?)
* get more servers and hosting to spread services

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFG5AJ+MkyGM64RGpERApmmAJ0fUkzSK4e4pYvAiLkhV58Aa4O3vACdGrL5
b+gwB+2P+UuZtp9ywHUCDxI=
=BxJz
-----END PGP SIGNATURE-----


