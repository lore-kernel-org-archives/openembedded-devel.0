Received: from [209.85.198.242] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1LbygJ-0003Fe-0i
	for openembedded-devel@openembedded.org; Tue, 24 Feb 2009 15:54:47 +0100
Received: by rv-out-0708.google.com with SMTP id l33so2471232rvb.0
	for <openembedded-devel@openembedded.org>;
	Tue, 24 Feb 2009 06:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=LcVMvDdd8Na8Ky3IIU6t/kBF0mlmZtoRzmLtUN0RsvE=;
	b=G9w0jasLcrxGuEU1Fe9kRKTYWYak3tLDUnMNA66rGdXy8RNsxFuKJi1AxqoUVAnQs4
	eP9VuoX5Km3BJuHO/HZJURMMsAMFLkh9sUQNUm1yo3uK85NubB3n86m/p8egnLL0iAfB
	GuUcngRtUefN157QaKxjoIxeAAgA52EzUJQeQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=TDkuCc4kd/4bKx1EBPV72Wrd3DAzszREGSeAW4o4aHJION6LH/JLz9E8VE3c9amGZi
	GQcUK/UUyIFHdaYcohnY3wMXTimnkBgOMfwXAfzBMIfjyOgxhr4NODaBJop2Ja9pSUhk
	ik9MpYwx3BvqaO4C02304dUmhGo3XDh8Lxq+U=
MIME-Version: 1.0
Received: by 10.141.115.6 with SMTP id s6mr2636147rvm.124.1235487104685; Tue, 
	24 Feb 2009 06:51:44 -0800 (PST)
In-Reply-To: <f46da1cf0902201818r3fcf3432oc14929b5f455bbe7@mail.gmail.com>
References: <f46da1cf0902201818r3fcf3432oc14929b5f455bbe7@mail.gmail.com>
Date: Tue, 24 Feb 2009 09:51:44 -0500
Message-ID: <f96d234e0902240651r7ad36677h8e828964308e2b50@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel@openembedded.org
Subject: Re: Documentation/User Manual questions
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
X-List-Received-Date: Tue, 24 Feb 2009 14:54:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On Fri, Feb 20, 2009 at 9:18 PM, Theodore A. Roth <taroth@gmail.com> wrote:

> 2: Was the documentation branch really last updated on May 9, 2008? Is
> there a newer branch I have not yet discovered?

Yes, this is likely correct.  Documentation is not OE's strong point.
But the combination of various docs available cover things pretty
well:

http://wiki.openembedded.net/index.php/Documentation

Assistance with documentation is welcome :-)

> 3: There is a ton of information in the Wiki, but finding what one
> needs can be rather tedious if not difficult. Is there any chance of
> pulling information from the Wiki into the user manual?
>
> The format of a user manual can make finding information so much more
> efficient. A table of contents and a good index can make a newbies
> life so much easier.
>
> I would love to step up and take on some of this. My knowledge of OE
> is quite limited at the moment, but with some review from the gurus
> out there, I think I can remedy that.

I would be happy to review patches.

Thanks,
Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


