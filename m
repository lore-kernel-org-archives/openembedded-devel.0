Received: from [209.85.217.227] (helo=mail-gx0-f227.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1N6pjx-0003g1-DD
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Nov 2009 19:10:24 +0100
Received: by gxk27 with SMTP id 27so618399gxk.7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Nov 2009 10:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=KxZeZ5C55S1bzz/G05VUOjTwG1DSEDqJak6fuEpkiRI=;
	b=HQ5g+IYHDV437v44FinoqfpnRTLAZNBXtNdZDrMJaqY8hNuQRnc3fHRPvpGiiM+8QX
	ksNCMQuBFR+tiilXa41F+sW7W24d6hRFumr5Rc1g6ERObpObkeKBDI85FeLqdTyin5EI
	ujyTrvSHewidfdRZ2NXiaGj7tixGsrQWPHO9o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=R77Msdn+ETTxCDwHlrHi2cZI1NcQOLeWT1+m141VdzNlJ8vfmIIolRZIC1fn0NREV8
	lf39LKNf+ZB1E1bc+tIyo1/uSlteSVMVY8OvZ4wIXW3J8Yb6qoGe06ghJg3MT3tn/Itq
	eBsy6EnNXCxWO8jVUwpF3bLGB77lnmZZN6VYw=
MIME-Version: 1.0
Received: by 10.100.200.14 with SMTP id x14mr5657631anf.52.1257616904683; Sat, 
	07 Nov 2009 10:01:44 -0800 (PST)
In-Reply-To: <hd40rf$sb7$1@ger.gmane.org>
References: <ac9c93b10911060006x1a60e677ic6f2c192eedc176d@mail.gmail.com>
	<217663.38369.qm@web112503.mail.gq1.yahoo.com>
	<ac9c93b10911060237i44b0d886qccfb0d64f94ae6ec@mail.gmail.com>
	<ac9c93b10911060633h7240008eqd035499cf052af1e@mail.gmail.com>
	<hd40rf$sb7$1@ger.gmane.org>
Date: Sat, 7 Nov 2009 19:01:44 +0100
Message-ID: <ac9c93b10911071001l1e556324q467845ef4771e864@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.217.227
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: mysql 5
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
X-List-Received-Date: Sat, 07 Nov 2009 18:10:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

2009/11/7 Koen Kooi <k.kooi@student.utwente.nl>:
> On 06-11-09 15:33, Frans Meulenbroeks wrote:
>>
>> one more thing
>> when installing mysql5 client or server packages they insist on
>> installing libmysqlclient-dev
>> No idea why this should be the -dev package. Content seems as expected.
>> Solutions are welcome !
>
> Probably a .so file that isn't a symlink to so.4.5.5.64.4
>
> regards,
>
> Koen

Guess so, no idea how this symlinking exactly works and how it is
split over the normal and the -dev package.

Frans


