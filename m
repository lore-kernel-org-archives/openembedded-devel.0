Received: from [209.85.132.246] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <e.robertson.svg@gmail.com>) id 1LtPW7-0000ok-LU
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Apr 2009 19:00:27 +0200
Received: by an-out-0708.google.com with SMTP id b2so3812501ana.42
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Apr 2009 09:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=gR5e6LUiv5roi2YZUMxHsaZ3TCXvel+mWatfe96soac=;
	b=kw64CbJnVGjH7THmqlwEJxU0uoUmtm9cfyCh/0d2mfgxZ97VhPJpqh10HmCDGvKnMq
	NrnAc3YhvWd6neS9KGynLmRpAzGICHBBblygpd4Q+i6x8bzFhxbAKZ0kkTBQL+kcLiMT
	3GDaY4DUBF1PuSApcDFf7moblQCR0OoSSYKME=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=cfqiFLfw0a45+ocbFvcWCNIhwFVXnSmnq50WdBsmPB1h7ROifiCGqx4QmtPBOIWZfo
	KpWNadBMBzFUA5gfZqBUpkCPGJf1bToeYgVjSGmMKHCSRbwja0UhpYzfOtRK6U4gij83
	3Sng+NZ9FCsuP1ugrq25Eu21tG1vNQHHTF5oU=
MIME-Version: 1.0
Received: by 10.142.203.19 with SMTP id a19mr2688922wfg.310.1239641803511; 
	Mon, 13 Apr 2009 09:56:43 -0700 (PDT)
Date: Mon, 13 Apr 2009 11:56:43 -0500
Message-ID: <3972542e0904130956s395ed9b3l30dce30433ace482@mail.gmail.com>
From: E Robertson <e.robertson.svg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.132.246
X-SA-Exim-Mail-From: e.robertson.svg@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_50,RDNS_NONE,SPF_PASS
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: security packages
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
X-List-Received-Date: Mon, 13 Apr 2009 17:00:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi All,
What's the simplest and/or smallest way to implement a public/private
key system available?
libgcrypt is too bulky and have rather large dependencies as well. Is
their another package or method I could use?
Ideally, I would like to generate a key pair externally and add a
simple shell script to do the decryption.
Any ideas?
Thanks.


