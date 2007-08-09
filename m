Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1IJ6ji-0003Zu-Gz
	for openembedded-devel@openembedded.org; Thu, 09 Aug 2007 14:03:31 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l79C0i1R029359 for <openembedded-devel@lists.openembedded.org>;
	Thu, 9 Aug 2007 14:00:45 +0200
Message-ID: <46BB01E1.1020008@dominion.kabel.utwente.nl>
Date: Thu, 09 Aug 2007 14:00:33 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <46B9CA83.3010201@dominion.kabel.utwente.nl>
	<1186616179.6091.62.camel@localhost.localdomain>
In-Reply-To: <1186616179.6091.62.camel@localhost.localdomain>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: merging package.bbclass with poky, please review diff
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
X-List-Received-Date: Thu, 09 Aug 2007 12:03:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Richard Purdie schreef:
> On Wed, 2007-08-08 at 15:52 +0200, Koen Kooi wrote:
>> I'd like to merge in the changes from poky, but the diff is rather big, so that's why I'm
>> sending it here for review.
>>
>> The main features are a better do_strip, no more wildcard deps and more comments. The diff
>> is between the .dev class and the class from poky with the PRIVATE_LIBS added.
> 
> I'm all in favour of this. To make this a little more digestible I've
> attached the same patch split into 5 logical units which is more like
> how it would have been committed to Poky. I need to look a little closer
> at the PRIVATE_LIBS bit so thats not included.

2,3 and 4 look like they can be committed as is, and I haven't found any problems with 1
and 5 yet.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGuwHhMkyGM64RGpERAueKAJ4qdYP4Gj4W8jTsoaUcAvLBtGj5HgCeKw1M
hnLHuWkdGdW7q2XDMIh+Sk8=
=j4WP
-----END PGP SIGNATURE-----


