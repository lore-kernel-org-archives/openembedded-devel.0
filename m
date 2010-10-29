Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1PBo2j-0004HY-7b
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Oct 2010 14:26:49 +0200
Received: by wwb39 with SMTP id 39so3017907wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Oct 2010 05:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=yJKith1gdgwdui3I7CWAJM8jp+xR4qubnezgcnCh3Xc=;
	b=pHCnG9MH/ZiYAk4WPiMLMxlu/N5a20cdA8Lf83zZkQZSEJRxVU9AzlukN9Lu2kFbbu
	r7puM7ODYoLCAR9e0ObaEO6Ow9qn1ar8+nlfSJHG9vQ7TicXcUOyLOxlz60Aze2mzDW4
	w5t5kL5schX44aPKaOBb+/rJP7/XtTup6zbik=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=s2tJodSkvemrkWw5w1c5BMntVShBbPRag27ZRS2CEXrzFbOEk+7YD4haYfmAe7RGaz
	DBWlGckhMiD63MSK+L7Xt+7GFIYDSwPo4s9PUagH9V6JKe3FJQzsSMnLnqOl+pI5J/EZ
	A1lyutuIZxOIoqOg9g2ESn4oxHwax3lwxU9lQ=
MIME-Version: 1.0
Received: by 10.227.156.202 with SMTP id y10mr4885015wbw.48.1288355163383;
	Fri, 29 Oct 2010 05:26:03 -0700 (PDT)
Received: by 10.216.235.214 with HTTP; Fri, 29 Oct 2010 05:26:03 -0700 (PDT)
Date: Fri, 29 Oct 2010 08:26:03 -0400
Message-ID: <AANLkTin70=KBJDjW8K6ViS5X03ZaE92680oR88hhy9eK@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: testing branch 2010-10-29
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
X-List-Received-Date: Fri, 29 Oct 2010 12:26:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

testing-next is ready for clean builds.  I'm still working on my
process to get this branch created automatically--thanks for your
patience.

Last weeks testing failed in a number of areas.  The combinations that
worked at listed in the tag:
http://cgit.openembedded.org/cgit.cgi/openembedded/tag/?id=tested_2010-10-25

For more information on the testing effort:
http://wiki.openembedded.org/index.php/Testing

Thanks,
Cliff

-- 
=================
http://bec-systems.com


