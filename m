Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kristoffer.ericson@gmail.com>) id 1PMQg3-0007HB-Gt
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Nov 2010 20:43:20 +0100
Received: by eya28 with SMTP id 28so1304406eya.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Nov 2010 11:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:reply-to:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=X93Pb6d8l9lMltUHPal2+Q/7p/JA7QCqcQvXnCjvMP0=;
	b=K8rU8v+G1qdFtUlrqrJQTF10+euthcsoFJB3xETnXn3wZl0oWQ0PUsAH2FX8g52wKg
	PL+fZ+ZIvk221U1S7vjxJs1KKhZUENTa2gd792JTLR4efrUlozz5SDeLME7B44cc6Jy1
	9P7ili49xUMmz52RpoSTBJVxGo+adhsN95ZZk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:reply-to:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=wOK6+kMwAknvM8+KIPkjn5gaxk638RQst1NW04utp6R8ivuMXP44hUb0cuUiHgBMwu
	33xKR0ZNiQPTnBlPtvTy8iiSgZbiLHkMhfQLwbLfpzssa0tsC4pZZ2GuMYiWtCq8MJ+G
	nTI+fNKEmdEoBg4lWqfVCrMy/f3MH6jULH9+8=
Received: by 10.213.23.3 with SMTP id p3mr7692817ebb.52.1290886920081;
	Sat, 27 Nov 2010 11:42:00 -0800 (PST)
Received: from localhost (c-bad8e555.010-30-6c6b7012.cust.bredbandsbolaget.se
	[85.229.216.186])
	by mx.google.com with ESMTPS id q58sm3153290eeh.9.2010.11.27.11.41.59
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 27 Nov 2010 11:41:59 -0800 (PST)
Date: Sat, 27 Nov 2010 20:42:22 +0100
From: Kristoffer Ericson <kristoffer.ericson@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101127194222.GC1878@boggieman.bredbandsbolaget.se>
References: <AANLkTin4u=yb+3U32jcYjhgzYEhtXa9FwRr3xBJ7JE3K@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTin4u=yb+3U32jcYjhgzYEhtXa9FwRr3xBJ7JE3K@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: kristoffer.ericson@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Klaus Schwarzkopf 's patches
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
X-List-Received-Date: Sat, 27 Nov 2010 19:43:20 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline


Would be nice with a --signed-off-by:... otherwise the patches look good.

On Sat, Nov 27, 2010 at 06:43:34PM +0100, Frans Meulenbroeks wrote:
> Hi,
> 
> Can someone pick this up and push these (probably after testing).
> They all seem quite OK to me, but as patchwork is not functioning at
> the moment I cannot easily apply them (getting patches from gmail is a
> little bit of a pain wrt spaces andl linebreaks if you read the mail
> from internet).
> 
> Frans
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


