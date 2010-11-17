Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1PIlBv-0007Rz-QC
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Nov 2010 17:49:04 +0100
Received: by qwd6 with SMTP id 6so8768qwd.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Nov 2010 08:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:received
	:in-reply-to:references:date:message-id:subject:from:to:content-type;
	bh=fsvvAflqnf/jxPbE9/U7KRG0Ov04ZNhYooNIP7DdT/Y=;
	b=xaFGYgM5hRV12yDPrpYHxRtGlqQLWZntMmzFa19+6/YzTi9LmPOrPW5JfJ7maPK9UJ
	QMy+HbUNa0SNYLb+0JlPiNW3oxp9jM7EaLi4jpXhmsuh8qwh1v2F0HCUBW5bpGAs43lQ
	2miRbWNYl0MHXQ/3uXcHVzoTUvMUrqBRrVhO4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=ezitk9+X7JixjvO619ttIyRt10MMakHqWVhI7ujrHzBLqAqcntTzmLB76tBdAYkfqK
	/gk+boQ+Zi7A/TiyUm5nLsfqvVtwFRw89R2MaikC11sR+2lj6ihhgUXo3srj7lkAA2xZ
	LE6n0UcOYsE1MSk6qnnzITgwnVc2FniIk8eEs=
MIME-Version: 1.0
Received: by 10.224.11.75 with SMTP id s11mr7358207qas.293.1290012477019; Wed,
	17 Nov 2010 08:47:57 -0800 (PST)
Received: by 10.220.193.4 with HTTP; Wed, 17 Nov 2010 08:47:54 -0800 (PST)
Received: by 10.220.193.4 with HTTP; Wed, 17 Nov 2010 08:47:54 -0800 (PST)
In-Reply-To: <4CE3F22C.8000104@mentor.com>
References: <AANLkTi=qSnufgxxDHZ+VW6mZED1LFXBduX81HA-kBZEu@mail.gmail.com>
	<1290006345-22363-1-git-send-email-rep.dot.nop@gmail.com>
	<4CE3F22C.8000104@mentor.com>
Date: Wed, 17 Nov 2010 17:47:54 +0100
Message-ID: <AANLkTi=REDDr=0wv9oQDEyUPAYh1KUyDq_p=q0s-0WAy@mail.gmail.com>
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Author: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
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
X-List-Received-Date: Wed, 17 Nov 2010 16:49:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

Yeah, I will have a look, sure.

On 17 Nov 2010 16:20, "Tom Rini" <tom_rini@mentor.com> wrote:

On 11/17/2010 08:05 AM, Bernhard Reutner-Fischer wrote:
>
>
>     bitbake.conf: add ext4 image suppo...
Looks like e2fsprogs needs to be more careful about moving stuff for
update-alternatives.  Mind fixing that and doing this as a 2 parter?

-- 
Tom Rini
Mentor Graphics Corporation



_______________________________________________
Openembedded-devel mailing list
Openembedded-devel...

