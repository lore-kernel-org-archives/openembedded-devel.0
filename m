Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1GNb8U-0007Hp-Eg
	for openembedded-devel@openembedded.org; Wed, 13 Sep 2006 22:15:06 +0200
Received: from [172.20.1.6] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	k8DKBTw4012903 for <openembedded-devel@openembedded.org>;
	Wed, 13 Sep 2006 22:11:30 +0200
Message-ID: <450865F2.3040907@dominion.kabel.utwente.nl>
Date: Wed, 13 Sep 2006 22:11:30 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.5 (Macintosh/20060719)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>
References: <450851E5.5060800@laposte.net>
	<450861BB.8050500@dominion.kabel.utwente.nl>
	<921824592.20060913230440@gmail.com>
In-Reply-To: <921824592.20060913230440@gmail.com>
X-Enigmail-Version: 0.94.0.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: Improve consistency with bittest content checker + sanitize.py
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
X-List-Received-Date: Wed, 13 Sep 2006 20:15:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Paul Sokolovsky schreef:
> Hello Koen,
>
> Wednesday, September 13, 2006, 10:53:31 PM, you wrote:
>
> []
>
>> I'd like to point out that the-script-formerly-known-as-sanitize.py checks for *OE* styles
>>  and *OE* vars, instead of being a generic tool to check bitbake recipes. What I don't
>> know is where the border between 'bitbake' and 'OE' lies, but bittest is starting to look
>> like OEtest :)
>
>   Let's put bitbake into OE repo then? ;-))

and reverse http://oe-devel.bkbits.net:8080/openembedded/patch@1.2648.59.105 as well?



-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (Darwin)

iD8DBQFFCGXyMkyGM64RGpERAocIAJ982sJJR0PhhWym5zFWF6IuA2rT/gCeK5sP
4AbvaUKvazHO9mGPs6rcrhQ=
=gxr8
-----END PGP SIGNATURE-----


