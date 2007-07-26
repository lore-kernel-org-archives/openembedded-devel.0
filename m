Received: from [66.249.92.175] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <pmiscml@gmail.com>) id 1IE2mz-0000OC-TO
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Jul 2007 14:49:57 +0200
Received: by ug-out-1314.google.com with SMTP id i24so556838ugd
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jul 2007 05:48:37 -0700 (PDT)
Received: by 10.86.97.7 with SMTP id u7mr1165352fgb.1185454117523;
	Thu, 26 Jul 2007 05:48:37 -0700 (PDT)
Received: from ?192.168.20.110? ( [82.193.99.4])
	by mx.google.com with ESMTPS id y2sm5355930mug.2007.07.26.05.48.35
	(version=SSLv3 cipher=OTHER); Thu, 26 Jul 2007 05:48:35 -0700 (PDT)
Date: Thu, 26 Jul 2007 15:48:22 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <1942646629.20070726154822@gmail.com>
To: Koen Kooi <openembedded-devel@lists.openembedded.org>
In-Reply-To: <46A895A1.7040400@dominion.kabel.utwente.nl>
References: <46A711DB.6000205@dominion.kabel.utwente.nl>
	<46A895A1.7040400@dominion.kabel.utwente.nl>
MIME-Version: 1.0
Subject: Re: Activating autotools updates
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
X-List-Received-Date: Thu, 26 Jul 2007 12:49:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Koen,

Thursday, July 26, 2007, 3:37:53 PM, you wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1

> Koen Kooi schreef:
>> Hi,
>> 
>> At guadec we discussed activating autoconf-native 2.61, pkgconfig-native 0.22 and
>> m4-native 1.4.8. The test builds we did didn't show any errors but we'd like more people
>> to try to build their favourite target and report back.

> After multiple success reports I'd like to propose the following timeline:

> 20070802: make m4-native 1.4.8 the default
> 20070809: make autoconf-native 2.61 the default
> 20070816: make pkgconfig-native 0.22 the default
> 20070816+: remove autotools hacks in recipes (e.g overriding do_configure)

  Don't forget automake 1.10.

> what do you think?

> regards,

> Koen

[]

-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



