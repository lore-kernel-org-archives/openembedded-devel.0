Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1RV8c7-0000kN-6B
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Nov 2011 22:19:47 +0100
Received: by qyk30 with SMTP id 30so1839885qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2011 13:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=m8IUSxzj1Zdd4krQKa47zFTZwc+jmess7dps/SeX0Fk=;
	b=hL5qgtRAqEVrhq0+pwVDRO0oqPDQu+0Qeyn/TgAq2BVEP5UEiedx5L7XnzEFw7RLAD
	Fj7z2CxJDYhYMRVaz0fK06tVjQGRL7ukBRkihX6lXVhggrrBkD2Xp4LZ+mx1+nAlYuCS
	XezvU+yWjSiW45LtgNN+0UsKWJhXOosiE4KCQ=
MIME-Version: 1.0
Received: by 10.229.85.193 with SMTP id p1mr3445622qcl.152.1322514788281; Mon,
	28 Nov 2011 13:13:08 -0800 (PST)
Received: by 10.229.94.72 with HTTP; Mon, 28 Nov 2011 13:13:08 -0800 (PST)
In-Reply-To: <alpine.LNX.2.02.1111281848560.1090@myhost>
References: <CA+M6bX=PYZ+2vb32ZmT3SirqHdKpCtD90QqtHhQiWSp38f1kVA@mail.gmail.com>
	<1322476245.26081.89.camel@phil-desktop>
	<1322478479.26287.15.camel@ted>
	<alpine.LNX.2.02.1111281848560.1090@myhost>
Date: Mon, 28 Nov 2011 14:13:08 -0700
Message-ID: <CA+M6bXmW9d_+QYOGsGXggA4UvSySe1s6RRF_2Mcu77xvk04Kew@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Documentation problems
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
X-List-Received-Date: Mon, 28 Nov 2011 21:19:47 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Nov 28, 2011 at 11:02 AM, Bernhard Guillon
<Bernhard.Guillon@opensimpad.org> wrote:
> On Mon, 28 Nov 2011, Richard Purdie wrote:
>
>> Rather than fork off the Yocto docs for OE's needs, it would be nice to
>> see if there was a way we could share the documentation.
>
> I like that idea + the pull based model idea from Koen. In my opinion a pull
> based model for the documentation lower the barriers to write documentation
> because nobody want to write something false.
>
> But the project webpage should not look like a docbook page.

In my mind, that's only half of the problem, the deep dive side of
things.  Or would that really be so few pages it doesn't matter (along
with having the full manual online) ?

-- 
Tom


