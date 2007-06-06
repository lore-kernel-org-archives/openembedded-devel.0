Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HvtZ2-0008FO-Qr
	for openembedded-devel@openembedded.org; Wed, 06 Jun 2007 13:20:35 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l56BI8Lr030936 for <openembedded-devel@lists.openembedded.org>;
	Wed, 6 Jun 2007 13:18:09 +0200
Message-ID: <466697F2.6020303@dominion.kabel.utwente.nl>
Date: Wed, 06 Jun 2007 13:18:10 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.0 (Macintosh/20070326)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <E1HvlNq-0004pN-I1@linuxtogo.org>
	<1709000488.20070606140338@gmail.com>
In-Reply-To: <1709000488.20070606140338@gmail.com>
X-Enigmail-Version: 0.95.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: [oe-commits] org.oe.dev usb-gadget-mode: Add usb-gadget mode: An initscript to load the configured USB gadget module on boot
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
X-List-Received-Date: Wed, 06 Jun 2007 11:20:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Paul Sokolovsky schreef:
> Hello coredump2,
> 
> Wednesday, June 6, 2007, 5:36:26 AM, you wrote:
> 
>> usb-gadget-mode: Add usb-gadget mode: An initscript to load the
>> configured USB gadget module on boot
> 
> []
> 
>> +
>> +CONF_FILE="/etc/usb-gadget.conf"
>> +
> 
> []
> 
>         This is nice, but can config go to /etc/default/ to not horde
> /etc top-level? Thanks.

What about using o-hands usbinit[1]?

regards,

Koen


[1] http://svn.o-hand.com/view/poky/trunk/meta/packages/oh/
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGZpfyMkyGM64RGpERAszlAKCL1F2i5ikB+iDD1VOaldsPMlB03gCfQnx4
Ir5Vn+O6fIJnDNDo/F1KbmE=
=7+Gb
-----END PGP SIGNATURE-----


