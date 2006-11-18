Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <freyther@inf.fu-berlin.de>) id 1GlNt7-0008K7-3V
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Nov 2006 11:57:33 +0100
Received: from [88.134.98.23] (helo=[192.168.1.100])
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.60)
	(envelope-from <freyther@inf.fu-berlin.de>) id 1GlNqi-0008Df-SM
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Nov 2006 11:55:05 +0100
Mime-Version: 1.0 (Apple Message framework v752.3)
X-Gpgmail-State: !signed
Message-Id: <31406A3C-DA2A-420F-8DDC-D57F0B6FC345@inf.fu-berlin.de>
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
From: Holger Freyther <freyther@inf.fu-berlin.de>
Date: Sat, 18 Nov 2006 11:52:38 +0100
X-Mailer: Apple Mail (2.752.3)
X-Broken-Reverse-DNS: no host name found for IP address 88.134.98.23
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: I need your number(s), BitBake/OE parsing speed
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
X-List-Received-Date: Sat, 18 Nov 2006 10:57:33 -0000
Content-Type: text/plain;
	charset=UTF-8;
	delsp=yes;
	format=flowed
Content-Transfer-Encoding: quoted-printable

Hey,

if I got through your spam filter here is what I want you to do

1.) time bitbake -p opie-image   and do that three times and save the =20=

numbers
2.) apply the oe_less_anon.patch to OpenEmbedded
3.) time bitbake -p opie-image and do that three times and save the =20
numbers
4.) apply the BitBake patch (it should apply to 1.6 as well)
5.) time bitbake -p opie-image and do that three times and save the =20
numbers

6.) send me either a postcard with the numbers on it, or use email to =20=

transport the numbers

z.

=EF=BF=BC=EF=BF=BC
--
Holger Freyther
freyther@inf.fu-berlin.de




