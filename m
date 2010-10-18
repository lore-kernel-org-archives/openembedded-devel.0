Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ashcharles@gmail.com>) id 1P7wzm-0006mu-NE
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 23:11:51 +0200
Received: by ewy1 with SMTP id 1so1083125ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Oct 2010 14:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=+qA6u8oOb0XRlPcCZJVn6ihz+ftuNO2WT3cvm6J/m8c=;
	b=rmnA6tLFJAFjcjRY3Q8EHaqHjuqw9z7uytRGAvLngUxSf2JmMIazw38gyx4Xw5W6OO
	MGXvfVObXLBMjXBLlnxY5iFnUhylI2x3WL3bDhY3M4GO2vbkw46iLhEpLF5VvH0k+02X
	D18s4Xf71//PIJeNNP+sSD3zNWEgO57NtknIA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=tuBxPfJmBMiEqs/YdRXyWtuKPFQzrdufsLT11F4zTQfjcvD1CvMlaYlmLxkm6SihPM
	KsXhsLokBvM/0PcVyyYlCFQhph0BacbRZXo4wXuPOl8nH3wx8XYHEzxM5CtDnxdSjBll
	HHKeJEobeL7iZd2SE/bjBNKibKUN605RMMS14=
Received: by 10.213.14.84 with SMTP id f20mr4740193eba.75.1287436275392; Mon,
	18 Oct 2010 14:11:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.29.12 with HTTP; Mon, 18 Oct 2010 14:10:54 -0700 (PDT)
In-Reply-To: <20101018201429.GA818@boggieman>
References: <201010151039.08619.marcin@juszkiewicz.com.pl>
	<20101018201429.GA818@boggieman>
From: Ash Charles <ashcharles@gmail.com>
Date: Mon, 18 Oct 2010 14:10:54 -0700
Message-ID: <AANLkTimuyMQ+dHJWsQf7NpwFqoj34zi0Trd8Nry9n6GV@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: ashcharles@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: RFC: remove old kernels
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
X-List-Received-Date: Mon, 18 Oct 2010 21:11:51 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I have sent a patch following the procedure here:
http://wiki.openembedded.org/index.php/How_to_submit_a_patch_to_OpenEmbedded

This patch removes two outdated gumstix kernels.

As a side-note, should I be adding a '--subject-prefix=oe'  so emails
get a [oe] on the subject?

-Ash


