Received: from [74.125.92.145] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1KyuRy-00014w-92
	for openembedded-devel@lists.openembedded.org;
	Sat, 08 Nov 2008 21:30:30 +0100
Received: by qw-out-1920.google.com with SMTP id 5so1024016qwf.36
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 Nov 2008 12:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=k699gQDEoX89+WcNVZ3bn5kDqY1cX7abeJztUguNifk=;
	b=lso206i7WHk/fMKmUlE9gOOqohaH2+E4u/15cj6e1QTaEoTf1pTRCW2SQuH8q2ou2H
	1TyPAH+ZyAJdLpNbzHsg+GXstp66sB7RD9CkhJ3r5hzvDRd5+YiJ9sjaXpp/qDM681QX
	2uzeq+O9Gh+aWbCZI18XutULgOC8gfjtmfyK0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=da2rQCvPPVT+OvBHX0qhNj8QYrQ0R4pG5HnYBbPQd/44U0rWBHTndU1kEcC+720eS7
	l12HO0icoWQdzgelccaR7XVUpxXiQlfcNFswKQeHLsYBjqO7IYUeRKUiKGt4r/E2kaY2
	4iCfKY19AkROMIsZresUJicCbrbuFpyBpOGhU=
Received: by 10.214.60.5 with SMTP id i5mr5402354qaa.168.1226172866479;
	Sat, 08 Nov 2008 11:34:26 -0800 (PST)
Received: by 10.214.12.10 with HTTP; Sat, 8 Nov 2008 11:34:26 -0800 (PST)
Message-ID: <c384c5ea0811081134t2119fb80r1e316c8e2dec883b@mail.gmail.com>
Date: Sat, 8 Nov 2008 20:34:26 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20081106231034.GA32229@denix.org>
MIME-Version: 1.0
References: <20081103202204.GA11663@denix.org>
	<20081106231034.GA32229@denix.org>
Subject: Re: [RFC] glibc fails with -march=i686 or pentiumpro or pentium3
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
X-List-Received-Date: Sat, 08 Nov 2008 20:30:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

On Fri, Nov 7, 2008 at 12:10 AM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Mon, Nov 03, 2008 at 03:22:04PM -0500, Denys Dmytriyenko wrote:
>> glibc fails with -march=i686 or pentiumpro or pentium3 - it's a known issue
> Any comments for the patch? Can somebody please push it in? Thanks.
>

In the bug tracker Khem Raj confirms he committed this:
http://bugs.openembedded.net/show_bug.cgi?id=4798

Could you verify it works and close the bug?

Thanks both to Khem and you!

Regards,
-- 
Leon


