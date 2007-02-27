Received: from [64.233.182.185] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1HM9Fw-0007XA-Hx
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Feb 2007 21:49:06 +0100
Received: by nf-out-0910.google.com with SMTP id l24so300552nfc
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Feb 2007 12:49:01 -0800 (PST)
Received: by 10.49.8.15 with SMTP id l15mr1922136nfi.1172609340998;
	Tue, 27 Feb 2007 12:49:00 -0800 (PST)
Received: from CUBE ( [82.193.98.4])
	by mx.google.com with ESMTP id c28sm3166237nfb.2007.02.27.12.48.59;
	Tue, 27 Feb 2007 12:49:00 -0800 (PST)
Date: Tue, 27 Feb 2007 22:49:07 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <149482102.20070227224907@gmail.com>
To: Koen Kooi <openembedded-devel@lists.openembedded.org>
In-Reply-To: <45E496B2.5020109@dominion.kabel.utwente.nl>
References: <407130732.20070227223500@gmail.com>
	<45E496B2.5020109@dominion.kabel.utwente.nl>
MIME-Version: 1.0
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
X-List-Received-Date: Tue, 27 Feb 2007 20:49:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Koen,

Tuesday, February 27, 2007, 10:38:10 PM, you wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1

> Paul Sokolovsky schreef:

>>   This code was committed, as it doesn't affect any existing aspect of
>> OE. Please feel free to tweak it, and of course use!

> So this isn't an RFC, just a statement of fact

  I had it in my tree for a week now, tested, so just decided to
commit it, taking into account that it follows existing
base_conditional() signature, doesn't affect anything else, and
offers capability both needed and simple.

>> Please feel free to tweak it, and of course use!

   I mean this. If there're better ideas on naming, etc., these can
be easily applied or discussed. We may want to discuss the whole
situation with such checks in OE: anything else needed/missing? are
we satisfied with such a solution for checks? etc, etc.



-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



