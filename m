Received: from [209.85.198.248] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1LPdFc-0008Ff-4V
	for openembedded-devel@openembedded.org; Wed, 21 Jan 2009 14:36:12 +0100
Received: by rv-out-0708.google.com with SMTP id k29so4481290rvb.0
	for <openembedded-devel@openembedded.org>;
	Wed, 21 Jan 2009 05:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=qONGgb2yDOYHZrUUAYm9eiMF8/n3o9/ixm1Uyk0QExU=;
	b=aribmLE8KCbuRaHWpjbzAgNFeJmKFaJgpB9OFOgMfEqhek5CFRkPBAzPrtuvB1lQZU
	h2RNVd136o0H73DfCG2GGLd/4euhdfO3J/kUTcEgUhRnCvsL5gP41b8JTMOKHXn0faBH
	XwtuvZxmYDwJ8aSwSQrgn+3AH56/ct3Ap9lNs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=xaBq2nudxGFBiZhtYnq7NO40KgDan+ycKr8eoRSk1xmhJ15A4mfvIHIMN7EKi2pljr
	L8Hu6lVv0k+7GF15IMrIXl7G1MJgEbnLsp17QDWm9TarIQqc4Y0ZwoNyQMiw/FDiiGyK
	FHGaaYBakjepoSe7mnOCpe3SVlfJHIQWaGJ+I=
MIME-Version: 1.0
Received: by 10.141.69.1 with SMTP id w1mr2299774rvk.119.1232544545738; Wed, 
	21 Jan 2009 05:29:05 -0800 (PST)
In-Reply-To: <20090120190022.GD30203@smtp.west.cox.net>
References: <f96d234e0901200840s4f346e3ev5f294ac0445522e8@mail.gmail.com>
	<20090120190022.GD30203@smtp.west.cox.net>
Date: Wed, 21 Jan 2009 08:29:05 -0500
Message-ID: <f96d234e0901210529q57d4abf1s98295b7160d6d2da@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel@openembedded.org
Subject: Re: OE weekly changelog 2009-01-12 to 2009-01-19
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
X-List-Received-Date: Wed, 21 Jan 2009 13:36:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On Tue, Jan 20, 2009 at 2:00 PM, Tom Rini <trini@kernel.crashing.org> wrote:
> On Tue, Jan 20, 2009 at 11:40:03AM -0500, Cliff Brake wrote:
>
>> OE weekly changelog 2009-01-12 to 2009-01-19
>
> Hmm, this missed pulling in rpurdie/canadian-sofar into the main branch.

Thanks for pointing that out -- I'll see if I can update the script to
included merges like that.

Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


