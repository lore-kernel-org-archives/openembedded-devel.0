Received: from [74.125.44.157] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1KlMkM-0000Pd-KN
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Oct 2008 13:53:30 +0200
Received: by yx-out-1718.google.com with SMTP id 4so186217yxp.42
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Oct 2008 04:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=UZql/OUF5lSh08p47tx5eFRm20ukFXIE0oTMjHwfm/g=;
	b=WBaMySq4juVxnBCNg2A0J1aJy0VdeFSpHRKShiTL9XFyw2IS7g9xfoHlsE3lna3vyE
	snrUxeQ7kDNOPJKBcS4lEN5kHAAo45hI4TLxv2wJCx7jAwCDw2KJx4mLQsaDeEp9Pnha
	Slo2+gLHSN9lMqA8uAaJ3axKMzW43r/fscNQU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=WuZN/CAC1r6Jhd6hE7Mqy6ifPDw9ju7qxnz9Xk5DOzy9Hn7cEAFc5cOYDG/W6fiWKf
	PmBBHofT6p+fErWNwqXtYPHNmW1fZvY+BQrZf1tDv06IpBLL64WSIB0+i1JlO2g/QmYX
	KZ4+CYCGAbdx3OuGHeXznSIAAkLUe1qUC9OQM=
Received: by 10.150.219.16 with SMTP id r16mr2015545ybg.172.1222948158769;
	Thu, 02 Oct 2008 04:49:18 -0700 (PDT)
Received: by 10.151.116.12 with HTTP; Thu, 2 Oct 2008 04:49:18 -0700 (PDT)
Message-ID: <f96d234e0810020449p5f175b2ek8f3c46e321cdeb19@mail.gmail.com>
Date: Thu, 2 Oct 2008 07:49:18 -0400
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200810020243.50896.zecke@selfish.org>
MIME-Version: 1.0
References: <48E36C18.4090504@smartlink.ee> <gc017m$gq4$1@ger.gmane.org>
	<48E4082D.9030000@whitby.id.au> <200810020243.50896.zecke@selfish.org>
Subject: Re: I'm sick of that Was Re: git master not updating
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
X-List-Received-Date: Thu, 02 Oct 2008 11:53:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Oct 1, 2008 at 8:43 PM, Holger Freyther <zecke@selfish.org> wrote:
> - I wrote mtn2git because I felt like, no one ever said thank you
> - I run mtn2git on the OE metadata on a server provided by a company that has
> nothing todo with OpenEmbedded
> - I maintain the running of the script over a GPRS line with a couple of
> seconds delay, no one ever said thank you.
>
> Instead I _always_ get complains for a service I do for the community that was
> announced as "experimental and might vanish every day". I'm sick of this
> attitude. I will discontinue this service as of now.

I would like to extend a big thank you, RP, and others for setting
this up and keeping this going.  Having the git mirror has made
supporting new OE users a _lot_ easier, and I am very dependent on it.
 It is my opinion that keeping this migration moving is fairly
important.  While monotone has served the active OE developers well,
it is fairly tedious explaining how it works to new users, and is
somewhat of a barrier to confidence in the project.

Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


