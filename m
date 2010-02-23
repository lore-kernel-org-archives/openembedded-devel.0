Received: from mail-iw0-f179.google.com ([209.85.223.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1NjyDN-0003up-PG
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Feb 2010 18:06:32 +0100
Received: by iwn9 with SMTP id 9so3485574iwn.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2010 09:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=JwBBxJ5vBY5g1vfTAr1ic4bU++0hTw9/5KtEWRxxLlY=;
	b=BBSC58fEog9TeBMualAFduhvvk4V/fecmOaxVhiLUEs7xU3CbEjkhKsiVEawVrNzRh
	DyxLrvIgl5BFQPR68uPQpbkm2gOVkdDp7CnVZ2FkWHghYRxDq4LEwVV1GK+CU7xcd0wl
	FBpW1uySMjG6AcfhOzQ/N0zS8RjkYfuALC6Ac=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=gaJYw7HUpDPpkxd7hwiWYChX1PBIysoO0wu3EC51PIxCOu3lg2ph2oL+FggyNcqAUV
	4J7b3R26nyAsEUaByydQRFRn/b+Sg8xRbqS0AySiDjsz+XwA3BIwpZ35+iYqFPx+3MjB
	p9KS4B9OALOOnj6EuCcDAG3EeuAU7J8SqDUT0=
MIME-Version: 1.0
Received: by 10.231.148.9 with SMTP id n9mr684306ibv.81.1266944624078; Tue, 23 
	Feb 2010 09:03:44 -0800 (PST)
In-Reply-To: <201002102228.49805.holger+oe@freyther.de>
References: <f96d234e1002091310h6eb4f93ei67068714adadd017@mail.gmail.com>
	<201002102228.49805.holger+oe@freyther.de>
Date: Tue, 23 Feb 2010 12:03:43 -0500
Message-ID: <f96d234e1002230903j24d67bcauca7714045a8d7c77@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.179
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: OE weekly changelog 2010-02-01 to 2010-02-08
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
X-List-Received-Date: Tue, 23 Feb 2010 17:06:33 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Feb 10, 2010 at 4:28 PM, Holger Hans Peter Freyther
<holger+oe@freyther.de> wrote:
> On Tuesday 09 February 2010 22:10:40 Cliff Brake wrote:
>> OE weekly changelog 2010-02-01 to 2010-02-08
>
> Hi Cliff,
>
> do you think having the output of `git shortlog holger/staging-branch` in the
> weekly changelog would be a nice addition?

Added to the script, thanks.

Cliff


