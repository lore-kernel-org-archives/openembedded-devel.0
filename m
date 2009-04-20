Received: from [209.85.217.180] (helo=mail-gx0-f180.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1Lw1aP-0001kb-UG
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Apr 2009 00:03:34 +0200
Received: by gxk28 with SMTP id 28so2785711gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Apr 2009 14:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=nbw9hHC4cQZIqUjOs7bQ9WUjj5uzfabDdzHSln8U+IE=;
	b=NsEKyzU4RVwMFEa/jOKIUeOrT0L/JahubbcTO+dGvpLbAusikiZARyp14ZjJ+yuK+G
	09FwkExWWZ4h2wsRHP+jZPD3lewLLrnljmRfkN5mK6wiWTXywxOIKaQQsK7Ve3kjUCvA
	NyNdyMzeway0xPiG0qeKmVVN1Ey804nVqgUFw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=cHJRF1lebXOc58sO1A+yddsQwnNqG7FUhtPA2sUr0v3jIEM0+2iWCjMBSFD+75a1Cx
	63qecNmZOeZribhm1a65mgKOKTJwCscbaejORqqfsogXjGWaeXcrDIiumYMbNYsGn5so
	dqX9JFAPnIBJas3FapOKKIoLHJ17oyLqA51EY=
MIME-Version: 1.0
Received: by 10.90.25.11 with SMTP id 11mr476715agy.69.1240264750733; Mon, 20 
	Apr 2009 14:59:10 -0700 (PDT)
In-Reply-To: <1240241104-21935-8-git-send-email-marcin@juszkiewicz.com.pl>
References: <1240241104-21935-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1240241104-21935-8-git-send-email-marcin@juszkiewicz.com.pl>
Date: Mon, 20 Apr 2009 23:59:10 +0200
Message-ID: <c384c5ea0904201459r60692c0bqf3e5300d850c5fb4@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [STABLE][PATCH 1/1] util-linux-ng: depend on virtual/libintl to pass building with uclibc
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
X-List-Received-Date: Mon, 20 Apr 2009 22:03:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Acked-by: Leon Woestenberg <leon@sidebranch.com>

-- 
Leon


