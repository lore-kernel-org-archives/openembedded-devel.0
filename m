Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1PGm2G-0006uE-Nu
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Nov 2010 06:18:58 +0100
Received: by wwd20 with SMTP id 20so974239wwd.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Nov 2010 21:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=jTQPrvieHxpaETEcN574xd2amXcyqqU0VZ515G7qv80=;
	b=S2coRLJzV/C3Q8Qhyle6htBWrZdRwXifR+ZK6p3e9yBuvLJDz7X7cVjdRmEi6kSDnd
	SqyitfXTF6WTrmlSE/c/zgeAkARl9GkZSb5ZSRLWxl9ck+EFhYzp5tXV3x8pRjO4hQOC
	4Ws4H6s5llcSESLWj1WTUDnqfSCsRDi8qXzOY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=Dm3BLYzbljYUIpCK/4w3a56lX2zgZlYZKM6UzBdDLLWoh1zLvlDPo9F5mjPNOzEKpJ
	rwljpSAtxF6RNKLASPR1ukDb/BH0kZt17pOvVzrfrsfsBWY5tKaMmkxDD25sgthOZ2Q9
	YKV/AeD95zso4DWyfGwsamy5bPe7o+qP7rpTA=
MIME-Version: 1.0
Received: by 10.216.78.204 with SMTP id g54mr3211320wee.34.1289539071715; Thu,
	11 Nov 2010 21:17:51 -0800 (PST)
Received: by 10.216.235.214 with HTTP; Thu, 11 Nov 2010 21:17:51 -0800 (PST)
Date: Fri, 12 Nov 2010 00:17:51 -0500
Message-ID: <AANLkTin8E_sSKJcCW7_gtx85_Uo6SvwHFTdiUA8XZ2tv@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: testing branch 2010-11-12
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
X-List-Received-Date: Fri, 12 Nov 2010 05:18:58 -0000
Content-Type: text/plain; charset=ISO-8859-1

testing-next is ready for clean builds.  Not many builds succeeded
last week--I suspect people have been busy:

http://cgit.openembedded.org/cgit.cgi/openembedded/tag/?id=tested_2010-11-04

An overview of the testing process:
http://wiki.openembedded.net/index.php/Testing

Thanks,
Cliff

-- 
=================
http://bec-systems.com


