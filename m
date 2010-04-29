Received: from mail-ww0-f47.google.com ([74.125.82.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fabio.mauri@gmail.com>) id 1O7Nuj-0003r0-Pj
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Apr 2010 09:12:02 +0200
Received: by wwg30 with SMTP id 30so497918wwg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Apr 2010 00:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=UZ7OsCOAR7FZmSPT+yV1MaFCRf/dLYxjDHHrf8nGM+c=;
	b=JAoA2ot7Ilq3I33zdsVAwvMvbJRXmUBMwaESdgproEgcUGL12i0/l0ygx/t/pSe8EJ
	0mctn8JHzkOsLE6W3MM0N2fmh49c03vpakjI+SEIl0ltleYb2esueZKNucmR8wDRq//z
	m5F3OlHyKoL52DQV8K4vtPxTQ85YIG/oyJmc4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=qbArb/L4llF83nlnO5lxekRhU0orVJfmR4c3QVHe3/RB+R7vUxzGrbPQKhrqgig7EL
	1JK8TyoyXYY84ceeebbttTsEQ7SO8P5T3XX58w1qyVAUES9Av60+zukE3mCJWTQJTEfQ
	2T91Yi3LFSiyqmTFUoJHlpgUi8dM3vjiyfqho=
MIME-Version: 1.0
Received: by 10.216.85.133 with SMTP id u5mr6492033wee.91.1272524896153; Thu, 
	29 Apr 2010 00:08:16 -0700 (PDT)
Received: by 10.216.221.72 with HTTP; Thu, 29 Apr 2010 00:08:16 -0700 (PDT)
Date: Thu, 29 Apr 2010 09:08:16 +0200
Message-ID: <h2ub7a795c81004290008z458edaf3wd76e38ed4784cd64@mail.gmail.com>
From: Fabio Mauri <fabio.mauri@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.47
X-SA-Exim-Mail-From: fabio.mauri@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Apache2 on angstrom
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
X-List-Received-Date: Thu, 29 Apr 2010 07:12:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi all,

   I am trying to build an image with Apache2 and modphp installed.
During the compilation I get this error message:

http://pastebin.com/uBCr1sYE

following the error message there is the related config.log
Does someone know what is missing in my setup?


-- 
Fabio Mauri

