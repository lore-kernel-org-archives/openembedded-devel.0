Received: from mail-iw0-f174.google.com ([209.85.223.174])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NqBgo-0006Sj-RH
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Mar 2010 21:42:39 +0100
Received: by iwn4 with SMTP id 4so172628iwn.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Mar 2010 12:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=o4xUOUKYPlrS0PG84hvH5WnIbkqfR604kyXdx/6u8uI=;
	b=tzJjphamWR+BaIl8yflHreaMvApZ+Rner38BEPEcwBcpniPPyEWjbX14DE3AJ2wdvo
	F2wLy8URDblTXz1lxxvAPJzwStvP5mEAJCW5o9x23yLaPE+cMvc+6eJ1QWREBOY9j1J7
	HMGKlPNxmxaF+Doa12/0MppEomj7bf98Wvst8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=lhF7Y/xqO33YrLjSBo3rCO/HphouA/YVuUnHyASSp7Uc6phJb0rYSKm+H8jsIy9tz5
	Q2qgCVAIT1ljHeXAtx30TiQ9LEnqGfK8CLYP/nqpMesG5rEawie0XZnjQJZ1E4fy+PTo
	k+Bq7vZ4KznKbM2wRsXndZ8Lr/52LG3nJEaTk=
MIME-Version: 1.0
Received: by 10.231.173.129 with SMTP id p1mr232151ibz.85.1268426374597; Fri, 
	12 Mar 2010 12:39:34 -0800 (PST)
In-Reply-To: <4B99B467.2090807@zenlinux.com>
References: <4B99791E.1020102@zenlinux.com>
	<19c1b8a91003111618u5db39b2ft1b614484f5814442@mail.gmail.com>
	<4B99B467.2090807@zenlinux.com>
Date: Fri, 12 Mar 2010 12:39:34 -0800
Message-ID: <19c1b8a91003121239o323ec5adgfbb6b2f1fb4316e6@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.174
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH/RFC] zlib: convert to BBCLASSEXTEND
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
X-List-Received-Date: Fri, 12 Mar 2010 20:42:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Mar 11, 2010 at 7:26 PM, Scott Garman <sgarman@zenlinux.com> wrote:
> On 03/11/2010 04:18 PM, Khem Raj wrote:
>>
>> Thanks for the patch. While this change looks ok. You should submit a full
>> patch
>> where you also delete the unneeded recipes and with proper sign-off
>>
>> http://wiki.openembedded.net/index.php/Commit_Policy
>> http://wiki.openembedded.net/index.php/Commit_log_example
>>
>> might help
>>
>> and also formatting patch with git format-patch would be nice.
>
> Gotcha, thanks for the feedback. Let's try this then. In the future I assume
> the format-patch email should be sent directly to the list and not as an
> attachment - correct me if I'm mistaken.

yeah you could use git send-email
>
> Scott
>
> --
> Scott Garman
> sgarman at zenlinux dot com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


