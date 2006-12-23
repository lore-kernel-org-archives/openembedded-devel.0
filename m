Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1Gy5X8-0001vR-6Z
	for openembedded-devel@openembedded.org; Sat, 23 Dec 2006 12:59:22 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	kBNBxFLr027871 for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Dec 2006 12:59:16 +0100
Message-ID: <458D1A13.8010304@dominion.kabel.utwente.nl>
Date: Sat, 23 Dec 2006 12:59:15 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <BAY102-W7D12C0528A63863A6E8F3D6E40@phx.gbl>	<456EA72F.1060507@sun.com>	<456EBA6B.90501@dominion.kabel.utwente.nl>	<456F10F2.5060807@sun.com>	<458BF100.1090602@dominion.kabel.utwente.nl>
	<emj54a$b6s$1@sea.gmane.org>
In-Reply-To: <emj54a$b6s$1@sea.gmane.org>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: Initial attempt to get cdc to build in OE
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
X-List-Received-Date: Sat, 23 Dec 2006 11:59:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Rolf Leggewie schreef:
> Koen Kooi wrote:
> 
>> I was getting very annoyed with all the people complaining "OMG! we need java!!!!! LOL", 
>> but doing absolutely nothing to help getting java into OE (and hence making it available 
>> to the neo1973). So I decided to actually do something:
>>
>> http://www.openembedded.org/~koen/java/
>>
>> It errors out somewhere in do_compile, probably because kaffeh isn't sun j2se (on my build 
>> machine).
> 
> I tried unsuccessfully to get kaffe compiled on OE.  I doubt it will be 
> much help, but what I have done is available in bug 410.

That is only sideways related, since you need some form of j2se on your host system.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFFjRoTMkyGM64RGpERAj9VAJ92zPng11Js9+1c/mO/yNNlknp3FgCfVvMO
9cTw1i70aAv7meiukX7XkTo=
=g2mY
-----END PGP SIGNATURE-----


