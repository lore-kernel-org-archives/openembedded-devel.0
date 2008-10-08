Received: from [64.233.184.231] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1KnZR4-0002DJ-4h
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Oct 2008 15:50:42 +0200
Received: by wr-out-0506.google.com with SMTP id c53so1752751wra.20
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Oct 2008 06:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:mime-version:content-type:content-transfer-encoding
	:content-disposition;
	bh=duwfqDDvz1+JMophDQaAFStYuoF/4iXfjP3wyWkNa/4=;
	b=jbfWpkKEgIjd1iOwFv5F6YGRMAnGsndkeEhqmqTmBtcTNmsVIy4L+ViTREsIjWTtBx
	o0tKYSd264QbWrkAbslpK4uJJ8NtjFR8Q7TL8NjAx7QQB8CKgLn+1uM+72lcQ3gt+7+u
	iuAvjCVCk12bOh2HAlZA3+4M9WqryqKAqS/8Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type
	:content-transfer-encoding:content-disposition;
	b=CiBJn61qvXNr/MPLZws6vw5yyArjnM7Y55f3eL5OWOpewAZb/tu15Hdz/R7/GpRfUG
	158BN92Jkmr8Xld2IzNp1DAp+duxM6NCet0IaXvf8A+hYI96PI1dc7oubCNFWwlUoBdf
	j1w61S0Rnx95ZcDL7RsE1KOiGUVHS7bSBaa6I=
Received: by 10.100.132.14 with SMTP id f14mr1595762and.107.1223473563714;
	Wed, 08 Oct 2008 06:46:03 -0700 (PDT)
Received: by 10.100.174.18 with HTTP; Wed, 8 Oct 2008 06:46:03 -0700 (PDT)
Message-ID: <c384c5ea0810080646j6156c19ag284702150c5abe9f@mail.gmail.com>
Date: Wed, 8 Oct 2008 15:46:03 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
Subject: RFC: branch off the last stable branch under monotone?
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
X-List-Received-Date: Wed, 08 Oct 2008 13:50:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello all,

should we, or should we not, branch off a stable branch under
monotone, i.e. the last stable using monotone?

The argument would be to offer the existing use base (which typically
lags behind much) a (last) monotone based branch.

I can imagine the answer should be "no", as the number of maintainers
is low (and I am to blame as well).

Regards,
-- 
Leon


