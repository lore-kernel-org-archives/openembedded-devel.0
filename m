Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1P4Kc2-0001ro-Ly
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Oct 2010 23:36:23 +0200
Received: by wyf23 with SMTP id 23so1302632wyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Oct 2010 14:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=/w3wQziA4Uc3EcfE+AaPS+fmYTtszrAgJ2R6hv2Jou4=;
	b=O5bjfh6Kuo4AaYW2OQxVs4lBXqzps3CPon9KYGzfFMwlNHr1Tj+JmLpfvg3/0v2bnL
	f7G/o9gdi55OVNDtpsmshBXrFSohHDIQ4qrRv6SYjefaQwLgOgGasRKxhjOSqYUvZq+b
	zhtP5uKf44pZrtZZaVnHp0RKJmvFmDTDcUqlk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=gjEt3kDbAwcmaI0peQqgKPMhpXqeGIKLMbYTqOc7OlahsYzj8h+JEjHz3+mvBTHrPX
	40mpNhNgJ4GKT7A1abyo+KL3TgWkWz2GPrZvcF2ItUoIkoNKy6YKFSq5IQwevIx0Gcr3
	5yKrJG4sa6ramb9W8cfnnpeotknnY64RKvfXk=
MIME-Version: 1.0
Received: by 10.216.16.85 with SMTP id g63mr377223weg.114.1286573754161; Fri,
	08 Oct 2010 14:35:54 -0700 (PDT)
Received: by 10.216.45.149 with HTTP; Fri, 8 Oct 2010 14:35:54 -0700 (PDT)
Date: Fri, 8 Oct 2010 17:35:54 -0400
Message-ID: <AANLkTik90dJxAJ_+GLQy+3MqP3oRFV9bYO6+BjSwZNkN@mail.gmail.com>
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
Subject: testing branch 2010-10-08
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
X-List-Received-Date: Fri, 08 Oct 2010 21:36:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

master branch has been merged to testing-next and is ready for clean builds.

Last week, we ran into quite a few problems, so I'm not tagging or
moving the testing branch forward.

Note, we have moved the testing cycle from Fri to Fri instead of Mon
to Mon.  This is because people more likely have machines with spare
cycles over the weekend.

http://wiki.openembedded.net/index.php/Testing

Thanks,
Cliff

-- 
=================
http://bec-systems.com


