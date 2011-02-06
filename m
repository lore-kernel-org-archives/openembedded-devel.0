Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <filip.zyzniewski@gmail.com>) id 1Pm6ns-0002MR-KN
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Feb 2011 16:45:32 +0100
Received: by qyk8 with SMTP id 8so778376qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Feb 2011 07:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=uXGbNZtjlE5zsqsNBhJJL8bDwG8L2B7dwTy0VrLvNOQ=;
	b=matMAo0prLU3uJQ/nKAn7+XP7Tllexvag1B29ueLaYO9xNFz1OFh7lw4+48OYoj+O0
	2nGCLEAQKiF15rkxk1tHL6aLZn0z6dhKTATgs8/haX8Wq3HB7WryftILiIHxQcSR3vTJ
	RIYbgan80LxpUpzj7zHt3nIf2a/XsXlUZ4N8A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=teaSCeaNYYKbw7grL2cE0xMTdXB3CUj9TxiHJ+X9uLbpxYqsBfX6Q0tE0DgR6hcTzI
	UPcq/pifBBxAxIoz4/b+zhDJYQBvc9I4q0nrcJaNT701LvQk6vUvv0fYaNbixQie9dc3
	47ynf8PxUWnVb2MzhxSxlRcMDfMNXNnY9x52k=
MIME-Version: 1.0
Received: by 10.229.229.135 with SMTP id ji7mr12006870qcb.229.1297007071923;
	Sun, 06 Feb 2011 07:44:31 -0800 (PST)
Received: by 10.229.68.100 with HTTP; Sun, 6 Feb 2011 07:44:31 -0800 (PST)
In-Reply-To: <20110206091810.GL3265@jama>
References: <1296926769-2006-1-git-send-email-filip.zyzniewski@gmail.com>
	<AANLkTimkAp+rAiDiiZsyhWYCbjzEaPw7sGc-zo0A3uro@mail.gmail.com>
	<20110206091810.GL3265@jama>
Date: Sun, 6 Feb 2011 16:44:31 +0100
Message-ID: <AANLkTi=qGFU0N60kkf1WMYit+y0DA8sk3R2oMCYbWxnP@mail.gmail.com>
From: Filip Zyzniewski <filip.zyzniewski@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] gnu-config: removed absolute perl binary paths from gnu-configize.
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
X-List-Received-Date: Sun, 06 Feb 2011 15:45:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 2/6/11, Martin Jansa <martin.jansa@gmail.com> wrote:

> And please rebase it on top of master, as first line was changed few
> days ago, so this won't apply anymore.

Well first line is fixed now and the others are if 0'ed anyway, so I
don't think there is a point in applying it anymore.

I've marked this patch in patchwork as superseded.

bye,
Filip


