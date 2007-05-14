Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HnZK2-0000TO-7I
	for openembedded-devel@openembedded.org; Mon, 14 May 2007 14:06:38 +0200
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l4EC6Sox026392; Mon, 14 May 2007 14:06:28 +0200
Message-ID: <464850C3.90202@dominion.kabel.utwente.nl>
Date: Mon, 14 May 2007 14:06:27 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.10 (Macintosh/20070221)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <1176760923.4623f25b913f9@dominion.kabel.utwente.nl>	<20070418090235.GA21841@twibble.org>	<46262A0F.1050805@dominion.kabel.utwente.nl>	<20070419014949.GA6540@twibble.org>
	<31583224.20070510180054@gmail.com>
In-Reply-To: <31583224.20070510180054@gmail.com>
X-Enigmail-Version: 0.94.2.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: Making /var/lib persistent
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
X-List-Received-Date: Mon, 14 May 2007 12:06:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Paul Sokolovsky schreef:
> Hello Jamie,
> 
> Thursday, April 19, 2007, 4:49:50 AM, you wrote:
> 
>> On Wed, Apr 18, 2007 at 07:24:15AM -0700, Koen Kooi wrote:
>> [...]
>>> Sound like a good idea, do you have a patch for this?
> 
>> Try this out:
> 
>>   http://twibble.org/dist/oe/var-volatiles-1.patch
> 
>> I've tested it locally both with and without tmpfs mounted on
>> /var/volatile and all seems to work as expected.
> 
>         Any news on this? I've been running with this patch soon since
> its original post and don't see any issues. One small nuisance is that
> ls -l /var/log doesn't show what you want, but hardly something can be
> done about that, plus shell completion uses /var/log/ immediately.
> 
>         I suggest committing this patch.

After I have fixed up the rejects I'll commit and push it.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGSFDDMkyGM64RGpERArsZAJ0aPIXjYQW8TcJ4qd5z01RWFbSAUACfWBU0
zg9Qmq0tPnSryt6WDAOki3o=
=DO2J
-----END PGP SIGNATURE-----


