Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1OszUP-0001mw-4F
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Sep 2010 16:49:37 +0200
Received: by wye20 with SMTP id 20so6012584wye.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Sep 2010 07:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=yMHgVB9rwo0KVSXVGrxvvBxytZpo2kRJUXqyizEmacw=;
	b=F2U/R7DIGenimVzjB+O5Ce4hu9WBZoDfqvjXH+8tuiaJTBU2MJ9eGN/TC3JPQaGvoa
	WvjZruiP/pkT2rcnpBHY7XgG6rIccuzkLuYlJiIG600a71HqT+4J/7AO/pBNLWchQ+rW
	9+1L+QQGIGcV9eloE9JBlLAWICSDfrG+V2FdM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=GoqUYKn2dgeore7fOvn8SRmockYFF64IG27/H8BOjGQGwfj4f1fOsSuwWYq9wXOcdG
	FGYGheQXf/l2wyTUKdO9900zjPuGioPpi2OjphPkAHwZp1ar5IfjOiDYTfahKHGtV4Pr
	12QMmm8ZdT4k9eGpWjs2nKJRgOGYxBjF6KN5k=
MIME-Version: 1.0
Received: by 10.216.232.90 with SMTP id m68mr1069857weq.10.1283870933614; Tue,
	07 Sep 2010 07:48:53 -0700 (PDT)
Received: by 10.216.21.209 with HTTP; Tue, 7 Sep 2010 07:48:53 -0700 (PDT)
Date: Tue, 7 Sep 2010 10:48:53 -0400
Message-ID: <AANLkTi=Pukbe6T_LM59_1BJS3TG8PwEBWP064YaDCs6u@mail.gmail.com>
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
Subject: testing branch 2010-09-07
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
X-List-Received-Date: Tue, 07 Sep 2010 14:49:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

Last weeks testing cycle was successful:

http://cgit.openembedded.org/cgit.cgi/openembedded/tag/?id=testing_2010-08-30

I see a few more builds succeeding that were failing last week.

The testing-next branch has been moved to current org.openembedded.dev
and is ready for clean builds.

http://wiki.openembedded.net/index.php/Testing

Thanks,
Cliff

-- 
=================
http://bec-systems.com


