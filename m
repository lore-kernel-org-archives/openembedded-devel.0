Received: from [209.85.198.244] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1Lc0KM-0000zE-M8
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Feb 2009 17:40:14 +0100
Received: by rv-out-0708.google.com with SMTP id b17so2854256rvf.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Feb 2009 08:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=7VCO3U8l91vTvXiS7S/f54HMVTERVix135dGmQ4/ffg=;
	b=sLhsAtA9kAh5KMmKMVrY2bKIlkn0+3eYKHQlj2U7Vr5IHOHM3h16X/aEwQIF6StH3n
	CQ1WvfcEHeALsFhh8ulS4R7OrydFLBuAtlQq5NQ6yyPurE0RPTWazO11m2pCK2h1ctrq
	kXQN6NaoL5a1GqLgrJFeAy/SK9seWCSSqWS/k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=nY+vn9aee0atW2Sat72LtFx6z+se9W73xOLuDZq4HhMbF7YmPbvz3Z4OlbrtJ8KDvR
	4IQcT+nJ8rU/j787Irn+0cKdXRlMcFFhi8c9sRc2hbzAlo6tOqQz0cN3M74DNhHswt5x
	UIdNfiONrJfdO80Ogwn11hXUkOHfFDc2PenX0=
MIME-Version: 1.0
Received: by 10.141.179.5 with SMTP id g5mr2690403rvp.31.1235493431826; Tue, 
	24 Feb 2009 08:37:11 -0800 (PST)
In-Reply-To: <1235492099.27962.62.camel@andromeda>
References: <f46da1cf0902201818r3fcf3432oc14929b5f455bbe7@mail.gmail.com>
	<f96d234e0902240651r7ad36677h8e828964308e2b50@mail.gmail.com>
	<1235492099.27962.62.camel@andromeda>
Date: Tue, 24 Feb 2009 11:37:11 -0500
Message-ID: <f96d234e0902240837l234c10cdw443d3b4c64f81084@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: RFC: Importing docs directory to org.oe.dev.
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
X-List-Received-Date: Tue, 24 Feb 2009 16:40:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On Tue, Feb 24, 2009 at 11:14 AM, Michael 'Mickey' Lauer
<mlauer@vanille-media.de> wrote:
> I want to propose importing the documentation into the org.oe.dev
> branch, notably in the docs directly.

Sounds good to me.  It is a minuscule amount of data -- no reason to
have it separate.

Thanks,
Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


