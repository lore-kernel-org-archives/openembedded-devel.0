Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P4fcU-0006iI-BU
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Oct 2010 22:02:16 +0200
Received: by iwn7 with SMTP id 7so1043472iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Oct 2010 13:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=TBWdu1gD6PWSzS9equE+ajAWli9e6oDhtZlhfwCpsQU=;
	b=f5MgHSJKY3e9h1jro4C2HW52rP26XP7H2kBRhruNpvRnrATKUMY4WpIY3fw/EJVvj7
	rgs52hiLoNltTufa2lQ6uw6ZWufDpSTCTdsROWyAIHc9j7K6jbGdUD+r+JyNyWlDHda0
	haIPHlqStqwMD7Nkg8l5Z56AVbdq4FWC7Erx8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=SqH7OtMwwO6tdMyPy5/YHrNlnvqIivmTsh2SOIT3EbJCSD3WF2EAAyn8AaAkm7QXEH
	vlZ/4gZZp4Aq+D8O8mhTc6dx9nzk+wM0K5HpF4XVR73KyyNFuC158P/M70VLULlqT96L
	/TGgMrqKJaI3D+n/EAepJnAiNfE3gfSulkh3o=
MIME-Version: 1.0
Received: by 10.42.194.67 with SMTP id dx3mr813981icb.375.1286654509307; Sat,
	09 Oct 2010 13:01:49 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Sat, 9 Oct 2010 13:01:49 -0700 (PDT)
In-Reply-To: <AANLkTins9qf9rSMyH3WpRfV9qqzmDZztFnoLysBQtYhJ@mail.gmail.com>
References: <AANLkTin=ucR4=4zJQg=thwRbqehhCzRa-DE6NwCGb76R@mail.gmail.com>
	<AANLkTi=eg==2A_jTuUcqYtbvE1B6mBtqi28qKetGH9B-@mail.gmail.com>
	<i8pgqr$8n1$2@dough.gmane.org>
	<AANLkTins9qf9rSMyH3WpRfV9qqzmDZztFnoLysBQtYhJ@mail.gmail.com>
Date: Sat, 9 Oct 2010 22:01:49 +0200
Message-ID: <AANLkTi=2oxaBC+Z_fcy6hB9jjHVkZJAvkjJKSHTnekk1@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: recipy_sanity experiment
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
X-List-Received-Date: Sat, 09 Oct 2010 20:02:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

wrt license: updated perl, checked all things that were not
Artistic|GPLv1 and fixed them where needed


