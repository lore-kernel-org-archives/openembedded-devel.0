Received: from [64.233.182.185] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1Gc3Kd-000277-Vt
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Oct 2006 19:11:24 +0200
Received: by nf-out-0910.google.com with SMTP id l23so2485933nfc
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Oct 2006 10:03:56 -0700 (PDT)
Received: by 10.49.55.13 with SMTP id h13mr14824579nfk;
	Mon, 23 Oct 2006 10:03:45 -0700 (PDT)
Received: from CUBE ( [82.193.96.235])
	by mx.google.com with ESMTP id x27sm2076368nfb.2006.10.23.10.03.44;
	Mon, 23 Oct 2006 10:03:44 -0700 (PDT)
Date: Mon, 23 Oct 2006 20:03:46 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <2976252.20061023200346@gmail.com>
To: Koen Kooi <koen@dominion.kabel.utwente.nl>
In-Reply-To: <452FC947.6020404@dominion.kabel.utwente.nl>
References: <698474498.20061013195107@gmail.com>
	<452FC947.6020404@dominion.kabel.utwente.nl>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC] handhelds-pxa-2.6 -> linux-handhelds-2.6
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
X-List-Received-Date: Mon, 23 Oct 2006 17:11:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Koen,

Friday, October 13, 2006, 8:13:43 PM, you wrote:

[]

>>   Following the waves of cleanups happening this week, I'd like to
>> propose to rename handhelds-pxa-2.6*.bb which are recipes to build
>> kernels from Handhelds.org CVS tree. Reasons are:
>> 
>> 1. There's a (newer) convention to have generic package name, i.e.
>> "linux" in name of kernel recipes.
>> 2. "pxa" there is misleading, as 2.6 tree supports different
>> architectures. Handhelds.org tree as of now supports PXA, SA, and S3
>> (Samsung) devices. To the various degrees, but that's improving.
>> 
>>   So, I propose to rename the recipes in question to start with
>> "linux-handhelds-2.6" ("2.6" is stil important as there's 2.4 tree and
>> HH.org too).

> Sounds good, wanna prepare some patches?

  Ok, here it is: http://bugs.openembedded.org/show_bug.cgi?id=1524

> regards,

> Koen

-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



