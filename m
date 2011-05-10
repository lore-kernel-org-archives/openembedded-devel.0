Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1QJjmD-00035U-J5
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 12:02:49 +0200
Received: by fxm19 with SMTP id 19so4703516fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2011 03:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=i+7vaETaYsofo2Cf6duoS6RJaxONoYCN88OJoCBfIR4=;
	b=cmVo2NXgaLrD0OATyvWOnvEpkeHc6I4Ig47gHEd3j8Ri4p96URfZK8q8coJ+T8bfCW
	Pl3iN4gWA/wSzIYkjZMjZ7SH6AD/lvPpkRSj+m6dFsy4eWSGetpktHThl9bnTUYg8khN
	Nol/nECR9eRJ7JeMGXT/iO9LVJG84E3AiwOZA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=QjGJy/a4zix1FewWWfDarfsrOg6BKnXPVgfFUSc429o60IFr+HbozJl/SNuDdNjfaG
	bzrv3ssMDrKPQdG0PnWYwXITd4q4hKb+pSBi8qx19qbRfxLqGZwrvccYlsbw4ustbPFp
	TTcJ1cKad/tihK4h8UNN74EqrS2RcPauwSSGc=
Received: by 10.223.66.17 with SMTP id l17mr1523835fai.97.1305021604535;
	Tue, 10 May 2011 03:00:04 -0700 (PDT)
Received: from s42.loc (85-127-250-41.dynamic.xdsl-line.inode.at
	[85.127.250.41])
	by mx.google.com with ESMTPS id l3sm2308055fap.36.2011.05.10.03.00.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2011 03:00:03 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.75)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1QJjjo-0002mb-3M; Tue, 10 May 2011 12:00:20 +0200
Date: Tue, 10 May 2011 12:00:20 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110510100020.GA10493@mx.loc>
References: <4DC8F3A2.2090005@nedap.com>
MIME-Version: 1.0
In-Reply-To: <4DC8F3A2.2090005@nedap.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: x86_64
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
X-List-Received-Date: Tue, 10 May 2011 10:02:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 10, 2011 at 10:13:22AM +0200, Jaap de Jong wrote:
>Hi All,
>
>is there any support for 64 bit intel/amd machines?
>And if so, how to build for them?

Can we settle on a name please for i want to add a qemu machine for
testing x86_64?

x8664
amd64
...

Opinions?

thanks,


