Received: from [74.125.46.153] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <taroth@gmail.com>) id 1M6VPw-0007w3-C8
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 May 2009 21:56:04 +0200
Received: by yw-out-1718.google.com with SMTP id 9so5816ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 May 2009 12:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=xXURgnkYbUCkT2rUt8Jeiog5NAYK+Xu5wIZumS0hPv8=;
	b=Phizm+nRnQEOOQGx/pDOmDiPu91JmKsMiBSvldupQUJor9umA46vk1lWd6EOJVb7yZ
	bkkLkpMzQ9TNZkjRfCN6qa50W/1S/CdI7IIufpG+A1t543X3/A8Aqlg+y7hHdSmSUCMF
	gBFymo7PMmcaHssDb9jPBKKXGWl3+L0yhQdgE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=YW0hTVF+GhNY1FDtzhJ4vI+yzHYi5DVaYtydxaM7fEfDwjWW+CuRQ3k79ClBtqvILq
	kV4Z5dFDwUzRghIikVSn+hnAvrvCKnYx7Lunmdk2OxmXXxDK1OvvtK6REFve3bOji/Lp
	RcPc+L230m9GAx78dYGNTbBgXxF1qB+G+GjSg=
MIME-Version: 1.0
Received: by 10.150.219.8 with SMTP id r8mr837155ybg.330.1242762520501; Tue, 
	19 May 2009 12:48:40 -0700 (PDT)
In-Reply-To: <20090518153156.GA19357@denix.org>
References: <alpine.DEB.1.00.0905111020490.11037@localhost.localdomain>
	<20090511172937.GA23731@denix.org>
	<f46da1cf0905120844m41413452o2eb88da084bc5c06@mail.gmail.com>
	<20090518153156.GA19357@denix.org>
Date: Tue, 19 May 2009 12:48:40 -0700
Message-ID: <f46da1cf0905191248h1c8d5e95s4038913d2111fbc5@mail.gmail.com>
From: "Theodore A. Roth" <taroth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] evtest: Fixed GNU_HASH QA error.
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
X-List-Received-Date: Tue, 19 May 2009 19:56:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On Mon, May 18, 2009 at 8:31 AM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Tue, May 12, 2009 at 08:44:42AM -0700, Theodore A. Roth wrote:
>> On Mon, May 11, 2009 at 10:29 AM, Denys Dmytriyenko <denis@denix.org> wrote:
>> > On Mon, May 11, 2009 at 10:23:18AM -0700, Theodore A. Roth wrote:
>> >>
>> >> Signed-off-by: Theodore A. Roth <taroth@gmail.com>
>> >
>> > Acked-by: Denys Dmytriyenko <denis@denix.org>
>>
>> I do not have commit access so someone will need to apply this.
>
> Theodore,
>
> I believe Mickey offered you a commit access last time. Not sure if it went
> through though:
>
> http://thread.gmane.org/gmane.comp.handhelds.openembedded/21915/focus=21920

Yes. I sent him my public ssh key, but got no response.

Ted Roth


