Received: from [74.125.44.152] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <slapinid@gmail.com>) id 1KR7NX-0000jw-MU
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Aug 2008 17:26:15 +0200
Received: by yx-out-1718.google.com with SMTP id 4so119113yxp.42
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Aug 2008 08:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:mime-version:content-type:content-transfer-encoding
	:content-disposition;
	bh=9SZbKgeHgcOM6RHJvW9DEjeW7NDpHSQPVy8k9fS9TT0=;
	b=HQ06FLacPZN2AKELX307LgWwfOaB+wA23BuJ1V+LVx07l2DLcdyuZo8ayBPJIJ2KDL
	RouOy/W097aP9tP7XRqG22eaWI4jQ+0DEjHugsfEROumz3KW3vMM1h+5c5lqVL6SAtYO
	kicCAVjjkIHrY9AAWOBF2F74lAMzS9mdMKf08=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type
	:content-transfer-encoding:content-disposition;
	b=RHgwtQvabAh08iDCZumEOxwzFjAZcUZ8pCv540y4ygmzFxqph62MPq7yCcG0PxJ8GK
	+o3j7K/hSZA8tK7YtUacEo4MSjfDKndGU+sb4nWJomPccPMzLMPAuwXsnfN3oEZIosp3
	z2l/Oz4QlhOmmYcrPzLeTF8UN7t5R81uL+DHs=
Received: by 10.150.52.2 with SMTP id z2mr5496925ybz.129.1218122765356;
	Thu, 07 Aug 2008 08:26:05 -0700 (PDT)
Received: by 10.150.227.15 with HTTP; Thu, 7 Aug 2008 08:26:05 -0700 (PDT)
Message-ID: <48239d390808070826g21ea0f1cu2f19710421e36e90@mail.gmail.com>
Date: Thu, 7 Aug 2008 19:26:05 +0400
From: "Sergey Lapin" <slapinid@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: recode-native FTBFS
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
X-List-Received-Date: Thu, 07 Aug 2008 15:26:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi, all!
Who is maintainer for recode?
On current Debian testing, bitbake recode-native fails due to gcc-4.3.

It is trivial to fix, and there's bug by me in bugzilla about that.
I don't really know how to access bugzilla due to oe.net down now,
so could anybody fix it or could I fix it myself?
Actually, testing is needed for gcc<4.3 there.

All the best,
S.


