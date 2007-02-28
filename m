Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HMOYR-0007ja-0Q
	for openembedded-devel@openembedded.org; Wed, 28 Feb 2007 14:09:11 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l1SD98ox016956 for <openembedded-devel@openembedded.org>;
	Wed, 28 Feb 2007 14:09:08 +0100
Message-ID: <45E57EF4.9050706@dominion.kabel.utwente.nl>
Date: Wed, 28 Feb 2007 14:09:08 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <407130732.20070227223500@gmail.com>	<1172609341.28406.169.camel@localhost.localdomain>
	<1828813817.20070227233137@gmail.com>
In-Reply-To: <1828813817.20070227233137@gmail.com>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: [RFC] base_less_or_equal() for numerical value testing in OE
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
X-List-Received-Date: Wed, 28 Feb 2007 13:09:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Paul Sokolovsky schreef:
> Hello Richard,
> 
> Tuesday, February 27, 2007, 10:49:01 PM, you wrote:
> 
>> On Tue, 2007-02-27 at 22:35 +0200, Paul Sokolovsky wrote:
>>> This code was committed, as it doesn't affect any existing aspect of
>>> OE. Please feel free to tweak it, and of course use!
> 
>> So its not really a RFC, is it? ;-)
> 
>   Disapprove is easy if it's wrong.

To illustrate the point: your commit broke building for machines that don't set root flash
size (e.g. machines that don't have flash).
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFF5X70MkyGM64RGpERAiiOAJ9BQhhTkQRDjkBZOFwiSEBQMXofXQCgt+3B
B3ddYIOI+Blw0Z5tX9R0WfE=
=E2kF
-----END PGP SIGNATURE-----


