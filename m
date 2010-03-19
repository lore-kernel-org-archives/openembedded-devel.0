Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ashcharles@gmail.com>) id 1NsluO-0004jV-JJ
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Mar 2010 00:47:36 +0100
Received: by pvc21 with SMTP id 21so1751544pvc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Mar 2010 16:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:from:date:message-id:subject:to:content-type;
	bh=cWqx7wkpZmrE/erz9EvB5SRYe+0Q+G7XmkXCdMqoEa8=;
	b=Vjrhf8VfbLsY5zPaPrvw3XRnZ8eDr9IxiqKu6Nsv5qT5q1BfMvpLnlT962dIZLLLxG
	ZXwnHaIUqZgz0hPAbWzHYNOfK+9IbuRm5jKLXbvELDuQBgD8e+pKsNFGTbnpkluw+V1S
	VZ1OFwzeongojN/weFHZaCaUpTKKnimsHqWdc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=Ekb1RYaEEkTNfEja0bb63p6N/Crri25PXNO7YPaSXdi+ISeXXScPli5kDF2OT/B8JG
	UJbh3VvbgX5qUFfy1XBgR8GOoYfmHuPpgtQYYsgvSGY2Q4yssrPN0lpdec3fxnw9QKVW
	ujJ6CjEoGZ9YtyhKb80GSl/qQ7QfZz2mL1K9I=
MIME-Version: 1.0
Received: by 10.140.56.8 with SMTP id e8mr3917098rva.228.1269042250115; Fri, 
	19 Mar 2010 16:44:10 -0700 (PDT)
In-Reply-To: <20100319214907.GN2425@xora-desktop.xora.org.uk>
References: <1239889359-13953-1-git-send-email-khimov@altell.ru> 
	<1268769038-30979-1-git-send-email-khimov@altell.ru>
	<201003192355.52441.roman@khimov.ru> 
	<bd4a003f1003191434t57c3f126gdc0f53790ef75aed@mail.gmail.com> 
	<20100319214907.GN2425@xora-desktop.xora.org.uk>
From: Ash Charles <ashcharles@gmail.com>
Date: Fri, 19 Mar 2010 16:43:50 -0700
Message-ID: <bd4a003f1003191643m15c0aa40id914236ef35ce037@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: ashcharles@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] cmake.bbclass: force CMAKE_INSTALL_SO_NO_EXE to be 0
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
X-List-Received-Date: Fri, 19 Mar 2010 23:47:36 -0000
Content-Type: text/plain; charset=UTF-8

Acked-by: Ash Charles <ashcharles@gmail.com>

On Fri, Mar 19, 2010 at 2:49 PM, Graeme Gregory <dp@xora.org.uk> wrote:
> On Fri, Mar 19, 2010 at 02:34:56PM -0700, Ash Charles wrote:
>> On Fri, Mar 19, 2010 at 1:55 PM, Roman I Khimov <roman@khimov.ru> wrote:
>> > So, I've rebased that to current, it looks like an obvious one and still no
>> > one cares. As per policy, I need two ack's on this one. Should I break that
>> > and push it or just wait another year till someone else interested in cmake
>> > will ack it?
>>
>> Hi Roman,
>>
>> I'm not in a position to ack this as I'm new to this mailing list. I
>> use OpenEmbedded+Cmake for several projects though and this looks like
>> a sensible fix.
>>
> Ash, if you can verify the change then please Ack, we arent as strict
> as other projects.
>
> Graeme
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


