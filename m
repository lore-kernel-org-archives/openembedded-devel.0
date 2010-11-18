Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1PJ9Tt-00009B-9c
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Nov 2010 19:45:13 +0100
Received: by fxm11 with SMTP id 11so1923566fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Nov 2010 10:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=af2IAzrOE6dR585V2KqFk7W/f3BSchUvVlWyhrUNdKQ=;
	b=UqFDhQ2qy7wTEENEa8o52xfi93ZPsyOZxvC2B1ujLFqOhH+IvS/C2xwmV2prAhebed
	5mWnxetRr0jRQtf9TOyU0dWrEP+z4l3kk6muJAh8dK7VUGBRHKy5fNhtgF06b9wNFNOV
	b17prm7C6l38FHz7b0j6+5ej3w3YblOSFARa8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=DsEP0bfvMz08St27e4pZ69FOoynalJ/YqEdJ6QFxEvFRE4cT76Le0jjp6f2QObd8fr
	nY/49ShBczTLyK40gi7D0fKc1sSEyqF7YrGxymWzSn0Xu1iRJf41tB7LqaGiRopo/oCw
	W6KcSIgPyuMOZB90sXgwAnPimu+Cs1n/S3yDo=
Received: by 10.223.83.203 with SMTP id g11mr898881fal.84.1290105846029;
	Thu, 18 Nov 2010 10:44:06 -0800 (PST)
Received: from s42.loc (85-127-155-31.dynamic.xdsl-line.inode.at
	[85.127.155.31])
	by mx.google.com with ESMTPS id a25sm254595fab.13.2010.11.18.10.44.03
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 18 Nov 2010 10:44:04 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1PJ9Sk-0003cP-28; Thu, 18 Nov 2010 19:44:02 +0100
Date: Thu, 18 Nov 2010 19:44:02 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101118184402.GL21346@mx.loc>
References: <1289988503-14693-1-git-send-email-fransmeulenbroeks@gmail.com>
	<AANLkTi=YqETnOXFgSfbGvaR8AbW0HAtnm2=ZJVNCboUM@mail.gmail.com>
	<AANLkTimq5JgxA+T3U9WhBMxgr+Of_H27RF3SemZc69fY@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTimq5JgxA+T3U9WhBMxgr+Of_H27RF3SemZc69fY@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] uclibc++: moved to 0.2.2
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
X-List-Received-Date: Thu, 18 Nov 2010 18:45:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 17, 2010 at 08:56:13PM +0100, Frans Meulenbroeks wrote:
>>> +DESCRIPTION = "A C++ standard library targeted towards the embedded \
>>> +systems/software market."
>>> +HOMEPAGE = "http://cxx.uclibc.org/"
>>> +LICENSE = "LGPL"
>>
>> LGPL also have versions find out which one it is licensed under
>
>Will do

IIRC LGPL >= 2.1


