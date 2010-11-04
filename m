Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1PE7eJ-0002fC-AP
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Nov 2010 22:47:11 +0100
Received: by wya21 with SMTP id 21so2417559wya.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Nov 2010 14:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=T3hthAw1y9pa4XBIWBkhcsJTqYnIVhg5AGZ5DRTpZ24=;
	b=V5FoVm4GXSkA/Hb0eITPMAJchHurYXjJOKg8nfHZciIXEo3rgGwe0To18njvZcQBVw
	bXlq32bF2TNaNPqX45iRU9zXQnHG+6+eB5YX4nLl6G51bT7poZo7OEWDt+y6jzwYbPoH
	lshA/KVSGWZdkdh3brRvDAszVM9bfdZmVgbBI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=CICQx+BEb593VkMTo7lDztDzHRbu+/ksqfsoBrxImJZtOU/lDzTQlEX9Sfi7pXkPJD
	WveFse8Mz9k8Vi4gbo+7MTNG/8YL5j3iLaGLL8aM+c0Dudez6NmnCsMG4jkEm/wRIS8H
	xygcYlmShSTp/CblwnFybmJB69gbVH3vyRDHY=
MIME-Version: 1.0
Received: by 10.216.162.70 with SMTP id x48mr386130wek.4.1288907178789; Thu,
	04 Nov 2010 14:46:18 -0700 (PDT)
Received: by 10.216.235.214 with HTTP; Thu, 4 Nov 2010 14:46:18 -0700 (PDT)
Date: Thu, 4 Nov 2010 17:46:18 -0400
Message-ID: <AANLkTimLpymROEFYv6+TsvtRP-nf8xzNKFp+-d6Q9K8r@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: testing branch 2010-11-04
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Nov 2010 21:47:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

Had a decent run with testing last week as a number of combinations built:

http://cgit.openembedded.org/cgit.cgi/openembedded/tag/?id=tested_2010-10-29

testing-next is ready for clean builds.  testing branch has been moved
forward to last weeks testing-next.

For more information on testing, please see:
http://wiki.openembedded.org/index.php/Testing#Testing_Log

Thanks,
Cliff

-- 
=================
http://bec-systems.com


