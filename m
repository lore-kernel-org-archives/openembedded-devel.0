Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sujak.marek@gmail.com>) id 1PirvX-0005gG-Ub
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Jan 2011 18:16:04 +0100
Received: by qyk36 with SMTP id 36so3551326qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jan 2011 09:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=6pba+CiUeYjAFYJeDk6sZ8Hci+cxOmZPoohIYHnnJZY=;
	b=xOfBJ/Is+wNqhSz3Qdw+2l+F8eF+eBh8rT/1V4TuvIloL8qZxEamyGYtqFCPn+gVzN
	O3Kl9SJNbHp8LV/KCt3NnaNxx50Y4Ob9nV2tvcAEJ4cXF1aFDm7ovMGmK2nJymEUT7Yo
	dWsCQkp4wvpuWwtkgUTvd2hblwH5IJ8NZCcxs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=OqeJeM8mJXlkZ+7+5W5okFYckqFb+7sIJuleXPOidV89NTACPiP6iCZibmSl9Oyzuq
	Fe8eW3MFgHFF+6MRK9uwolEQNirG7SYJlHpeEERAGfE1l6HSCvH3OHh645Qobh60w724
	SzKAer0WjW/QVgMCXTpKth6BEEwkoKFs5a5pY=
MIME-Version: 1.0
Received: by 10.224.60.74 with SMTP id o10mr1419595qah.317.1296234912413; Fri,
	28 Jan 2011 09:15:12 -0800 (PST)
Received: by 10.220.188.3 with HTTP; Fri, 28 Jan 2011 09:15:12 -0800 (PST)
In-Reply-To: <1296232330.21132.17.camel@mattotaupa>
References: <1296219611-14580-1-git-send-email-sujak.marek@gmail.com>
	<1296220508.3831.8.camel@mattotaupa>
	<AANLkTi=Oqmf7KsN=_ygrZ4YkuO+aLCTsyn9e1jE13QYo@mail.gmail.com>
	<1296232330.21132.17.camel@mattotaupa>
Date: Fri, 28 Jan 2011 18:15:12 +0100
Message-ID: <AANLkTinSd1bbEp40xbMSZhjnuQsrdKMCQN-OTZLk2oUP@mail.gmail.com>
From: Marek Sujak <sujak.marek@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH v2] VMX25: Add machine support for vmx25
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
X-List-Received-Date: Fri, 28 Jan 2011 17:16:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

Dear Paul

A: No.
> Q: Should I include quotations after my reply?
>
> http://daringfireball.net/2007/07/on_top
> http://en.opensuse.org/openSUSE:Mailing_list_netiquette#Interleaved_style
>

I hope this is fixed now.

What distribution (and Git branch) did you use? The tool chain depends
> on this choice.
>


Distribution is angstrom-2010.x. Toolchain is eglibc based, all properties
are "default" without any modifications.
Git branch is "org.openembedded.org". The default one after git clone.
This is the first time that i am trying to push something somewhere so i
hope i do not make any mess.


> > It depends on:
> > barebox 2010.10 + patch.
> > kernel 2.6.35 + patch.
> >
> > I will commit these files today.
> >
> > There are of-course bugs in kernel, but the images works fine for me.
> > I corrected my Git username as you recommended. (thanks)
>
> Thank you for your answer. I do not have any commit access, so I hope
> that the other developers will push your patches soon.
>
>
I hope too. Thank you for your time.

Best regards,
Marek

