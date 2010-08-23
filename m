Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <coolaj86@gmail.com>) id 1OneZ3-0000RD-Sy
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Aug 2010 23:28:25 +0200
Received: by fxm6 with SMTP id 6so3579291fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Aug 2010 14:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=DsfmZei7I1yxjHVn4TVFYEDfdVEzyjFbXZXQEzzLsGQ=;
	b=P3BIxx6ejrh4KRqfkENSFcEEsSfDzR5o3Kr9MUAb8QCn+OcvRJvJ1KhTkkVzcGEWpm
	34AyUJ2es2XEtaUgJ2Sfbr52jLwDdQ5A2kJhwhqxRGVf7XqZz18t7Es46wyb2RTimoUI
	nU0cEq+hgURP3JSr+RoXvXFm4ukbgCuTUf9Hg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=pU7IlFIbSXExKXxlvq8NC9dU1y5UDJlF7/xYh3GWlnWu6gRrmxoXJTj329WYWUrpqU
	s6bDFoZ8F0NQOAoYt2n2rEWvqZcaPE6zCuP+mjO1CJVmcDZtn2dQqNnD+hJ//eQoF6mx
	QulfAq897Lefd0q7FNTnOuuNrcjx7v2LRGF1k=
Received: by 10.223.126.14 with SMTP id a14mr5088714fas.44.1282598875276; Mon,
	23 Aug 2010 14:27:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.125.209 with HTTP; Mon, 23 Aug 2010 14:27:35 -0700 (PDT)
In-Reply-To: <1282556402.3853.17.camel@mattotaupa>
References: <1282198068-25415-1-git-send-email-coolaj86@gmail.com>
	<AANLkTi=bCxyXU+mubbmFcrtUsHiVsmtsDw0235E69XRd@mail.gmail.com>
	<1282556402.3853.17.camel@mattotaupa>
From: AJ ONeal <coolaj86@gmail.com>
Date: Mon, 23 Aug 2010 15:27:35 -0600
Message-ID: <AANLkTi=ktBQXfW_dbi-2+yUkgGSrParCNt9ZEJCK+JC0@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Rcpt-To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Mail-From: coolaj86@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] added a .bb for node.js
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
X-List-Received-Date: Mon, 23 Aug 2010 21:28:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

>
> You are also missing a Signed-off-by line.
>

All I do to add that is --signoff, correct?

