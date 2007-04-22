Received: from [64.233.166.176] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1Hfkce-00080s-0I
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Apr 2007 00:33:32 +0200
Received: by py-out-1112.google.com with SMTP id n39so1097891pyh
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Apr 2007 15:33:31 -0700 (PDT)
Received: by 10.65.232.19 with SMTP id j19mr1944174qbr.1177277769343;
	Sun, 22 Apr 2007 14:36:09 -0700 (PDT)
Received: from cube ( [82.193.98.7])
	by mx.google.com with ESMTP id 36sm8280848nza.2007.04.22.14.36.08;
	Sun, 22 Apr 2007 14:36:09 -0700 (PDT)
Date: Mon, 23 Apr 2007 00:36:06 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <1044484458.20070423003606@gmail.com>
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <462BC62F.6030907@dominion.kabel.utwente.nl>
References: <20070422202157.BEBB9401B37@tinman.treke.net>
	<462BC62F.6030907@dominion.kabel.utwente.nl>
MIME-Version: 1.0
Subject: Re: [oe-issues] [Bug 2123] Fixed QA issues for opie-image
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 22 Apr 2007 22:33:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Koen,

Sunday, April 22, 2007, 11:31:43 PM, you wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1

> bugzilla-daemon@tinman.treke.net schreef:

>> ------- Comment #4 from pmiscml@gmail.com  2007-04-22 13:21 -------
>> Nice try ;-). The real issue though is that no .bb should ever override
>> PACKAGES variable, only append (prepend). Default PACKAGES and FILES settings
>> are set in *.bbclass. 

> That's not quite true for e.g metapackages since ALLOW_EMPTY will start to generate bogus
> packages.

        Well, of course I meant mundane OPIE packages there ;-)

> regards,

> Koen

[]

-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



