Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1GY3rL-0000Wh-UD
	for openembedded-devel@openembedded.org; Thu, 12 Oct 2006 18:56:40 +0200
Received: from [172.20.1.6] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	k9CGoCZS002003 for <openembedded-devel@openembedded.org>;
	Thu, 12 Oct 2006 18:50:12 +0200
Message-ID: <452E7258.6080907@dominion.kabel.utwente.nl>
Date: Thu, 12 Oct 2006 18:50:32 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.7 (Macintosh/20060909)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>
References: <452E0947.4070605@dominion.kabel.utwente.nl>
	<1167982954.20061012194408@gmail.com>
In-Reply-To: <1167982954.20061012194408@gmail.com>
X-Enigmail-Version: 0.94.1.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: [Openembedded-devel] kernel maintainers: COMPATIBLE_MACHINE field will become mandatory
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
X-List-Received-Date: Thu, 12 Oct 2006 16:56:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Paul Sokolovsky schreef:
> Hello Koen,
> 
> Thursday, October 12, 2006, 12:22:15 PM, you wrote:
> 
> []
> 
>> Hi,
> 
>> At the OEDEM conference we decided that the COMPATIBLE_MACHINE field will be mandatory for
>>  kernel recipes. If you maintain a kernel recipe: add the appropriate COMPATIBLE_MACHINE
>> field. If you don't maintain a kernel recipe, but want to help: patches welcome.
> 
>> The COMPATIBLE_MACHINE machine field tells bitbake for which machines this is a valid
>> kernel to avoid surprises for some reason the
>> PREFERRED_PROVIDER_virtual/kernel gets broken.
>> A lot of kernels already have that field, so have a look at first if you any questions.
> 
>   Just a question - should there be already machine conf file in OE
> for anything added to COMPATIBLE_MACHINE, or can something be added as
> an informative, "for-future", annotation?

There should already be a machine conf file to avoid cluttering up the metadata with
'might be' stuff. You are however free to add the machine conf file in question :)

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (Darwin)

iD8DBQFFLnJYMkyGM64RGpERAr7FAKCYxC9l2QZghpJt5dLdA1ATNH7ABwCfeaEM
JJFvkJmx8Vi5YvQu5bSKYOI=
=XIxm
-----END PGP SIGNATURE-----


