Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <hvontres@gmail.com>) id 1PtSnZ-0004vi-EK
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Feb 2011 23:39:37 +0100
Received: by wwb29 with SMTP id 29so528681wwb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Feb 2011 14:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to
	:content-type; bh=xCSLbUaypIeZkA4rqLTczXKhNEgSfqGqGtTxNth5tlc=;
	b=TvUnJR1T+KDjEE66zIwIrmAnm8e5dG5U9Imkcdmich5Say5OUZJCGavNTHd2pgkPYV
	z0OIQxre+3J0aS821ruxAeO1vek6jlY0ng08qTaxPzDIp7BwHg85nHiVetCFRv1oZ6HT
	5rRiQlbdmiItMPBzT5ecOOk4wC4gQ7PQM7xSo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=Aya3jiAn2oVjJUTO2q8cPWpf5FtXDpqH/oqnRWFBh+jeP6Ql20kcMitehS+8zVPEbV
	I1mXsNCpcYEZBMtl9tEISfPTv+rksoOZbdEQ7MjTwZaYp8eS8zpEoU3tlLWxzz40juO8
	YIW+eaW9pSEthlrKUalWmGb7ysvN8alYpMCVk=
MIME-Version: 1.0
Received: by 10.216.186.144 with SMTP id w16mr3436401wem.13.1298759890648;
	Sat, 26 Feb 2011 14:38:10 -0800 (PST)
Received: by 10.216.174.21 with HTTP; Sat, 26 Feb 2011 14:38:10 -0800 (PST)
Date: Sat, 26 Feb 2011 14:38:10 -0800
Message-ID: <AANLkTikzpcKBzgiQxkMTV75-+a27HE1juKSvitqjLrg3@mail.gmail.com>
From: Hans Henry von Tresckow <hvontres@gmail.com>
To: oe-devel <openembedded-devel@lists.openembedded.org>
Subject: Any good bitbake front-ends out there?
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
X-List-Received-Date: Sat, 26 Feb 2011 22:39:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

I was curious if anybody on the list has any recomendations for a
bitbake front-end.

Thanks,
-- 
Henry von Tresckow (hvontres)


