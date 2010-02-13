Received: from mail-fx0-f226.google.com ([209.85.220.226])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1NgKdf-0003ds-F1
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Feb 2010 17:14:38 +0100
Received: by fxm26 with SMTP id 26so3488287fxm.13
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Feb 2010 08:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=f4Oseo1qO2dCq0w5pgXfQpDOPlxRtTEP2yg9vHoduW0=;
	b=H7M3DdJtMm6WK5qE/VLlaE6L4W33pflILwJWzmFBoDPoa89/HauYB1WMPYbv4tHAXX
	Nm7q88C8kGEGE38ogBCVCfOdcC+g13uobNWCQmiZijrZ8i/aMKL+/0Otv0owoouB4H0B
	/FzM3t+VmQBwOUtgqnvdVhmRC18mFb+sB1+Ks=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=FPpFoWrQiriKvvc9W7JSmB4UGe7sVVRW8MmyVZqTESVWk/2C+TrSrPqxDg/unr8DYq
	LC1h5FPXHpljEyCOWi7wU79R95zh5S/k7hfObEl19F4cFWFMroiYt+9YXLUTg8rYS7HY
	jauxX8zsG4v0W2Dxal5/dhIL+wgOppNisvUxc=
Received: by 10.223.2.216 with SMTP id 24mr3264411fak.72.1266077519231;
	Sat, 13 Feb 2010 08:11:59 -0800 (PST)
Received: from s42.loc ([84.119.103.202])
	by mx.google.com with ESMTPS id z15sm7370753fkz.36.2010.02.13.08.11.58
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 13 Feb 2010 08:11:58 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1NgKdt-00063E-HQ; Sat, 13 Feb 2010 17:14:49 +0100
Date: Sat, 13 Feb 2010 17:14:49 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100213161449.GD30265@mx.loc>
References: <1265832780-19939-2-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-3-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-4-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-5-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-6-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-7-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-8-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-9-git-send-email-rep.dot.nop@gmail.com>
	<1265892781.3777.1050.camel@mill.internal.reciva.com>
	<20100213125146.GJ10632@mx.loc>
MIME-Version: 1.0
In-Reply-To: <20100213125146.GJ10632@mx.loc>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.226
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: BBCLASSEXTEND canadian?
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
X-List-Received-Date: Sat, 13 Feb 2010 16:14:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Feb 13, 2010 at 01:51:46PM +0100, Bernhard Reutner-Fischer wrote:
>On Thu, Feb 11, 2010 at 12:53:01PM +0000, Phil Blundell wrote:
>>On Wed, 2010-02-10 at 21:13 +0100, Bernhard Reutner-Fischer wrote:
>>> index 0000000..bc5e9ff
>>> --- /dev/null
>>> +++ b/recipes/xz/xz-native.inc
>>> @@ -0,0 +1,2 @@
>>> +inherit native
>>> +require xz_${PV}.bb
>>
>>You could consider using BBCLASSEXTEND to eliminate the need for this
>>separate recipe.
>
>Thanks for that, good thing. This will trim down alot on the number of
>recipes in the tree!

AFAICS BBCLASSEXTEND does not take canadian into account ATM, so i could
convert mpfr without pain but gmp-canadian on darwin (at least 4.2.4 is
mentioned in there) will/would break AFAICT, is that correct?


