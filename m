Received: from [74.125.46.158] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1Lw3Bv-0006dG-LY
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Apr 2009 01:46:23 +0200
Received: by yw-out-1718.google.com with SMTP id 9so1536056ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Apr 2009 16:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=YoOLXwomCSp4BYOD+ymVq/4ZJZjKDbRW+xc4q3rVjA8=;
	b=Ab2+xjOnrorBs4Ffayr1wezDbe8I+YcXyjviE+OIV1T91NwGoatgKifLH063QWcBzb
	61ruxx4zwpzxIPLOOQc9igWeN8xJGCikWILv0DWFcAAS7PywJdGCcITwZYMBVJR0VgVb
	nUq0bzrLDt9zrpCDTi1j/x81baKeqv+M9u8+4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=tyjrt9wi8TJxefvalbtIZDZczCXDUGbOrjlAcx8t6r9OD9cQ9pUt5IfFC7CKRbIrb5
	RbOrmAJsMQyODaBymz6eA6LC25ycxuzI7zkV/giY2KBdQnB7NNfq7YgJBcHcdqtBjFJc
	JS0Ji/X/jMFGRafLuLB5wD30tCxGHxTwpa/Io=
MIME-Version: 1.0
Received: by 10.150.201.2 with SMTP id y2mr7283028ybf.160.1240270922040; Mon, 
	20 Apr 2009 16:42:02 -0700 (PDT)
In-Reply-To: <c384c5ea0904201542y7d6de263ve1de19745ed29d47@mail.gmail.com>
References: <c384c5ea0904201542y7d6de263ve1de19745ed29d47@mail.gmail.com>
Date: Mon, 20 Apr 2009 19:42:02 -0400
Message-ID: <f96d234e0904201642o7144b20dr18a3ac4308cab3bb@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Reflection on MTN to GIT change?
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
X-List-Received-Date: Mon, 20 Apr 2009 23:46:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On Mon, Apr 20, 2009 at 6:42 PM, Leon Woestenberg
<leon.woestenberg@gmail.com> wrote:
> Hello,
>
> just wanted to see how we feel about the move to git as our scm?
>
> Personally, I like the speed of git, I like the very healthy commit
> rate we have in OE now*. Still struggling with the concept of git
> though.
> Overall, a good move I think.

It has been a positive change from my perspective.  About everything I
do is less pain, and supporting customers using OE is easier.

Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


