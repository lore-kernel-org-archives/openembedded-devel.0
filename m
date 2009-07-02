Received: from [209.85.218.228] (helo=mail-bw0-f228.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1MMKaq-0005dt-UZ
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Jul 2009 13:36:44 +0200
Received: by bwz28 with SMTP id 28so898805bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jul 2009 04:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=BklCILcoeVEentmfg0aYY4USrFtfKJfillMBX9f02is=;
	b=LYm3vm6gqEctm1sbjIJSf6RYVTXZu4GiqNk9Rg7s912M8moMPZCv4lXOEuYu7L7JFT
	fJek8r9LpsVO2SxuVBXgyFQMEe/WM7Qvlj6XzxjIxx8FpgN/5FGxxRC4QKFG098QpdL1
	zbEOWM+WAQpl5hhN4inKK1rYFlsJUnJLzNF68=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=sFMDIvOje2NdzV6X/KQsHgCfaZGp+21dTEKT+doPjcpSlm4ghOM9gGPYuxF0kgVNld
	EdtwV7S+rrH6SA0JIuKnSjoVMPaEvZhYGEUdzUTXfZrsb5BYGu+gvcK3WmuzH4WB8E0q
	EXNyFu+SwL0BY9FMQrIEBAk09XLEzR1FCGUYQ=
MIME-Version: 1.0
Received: by 10.103.197.14 with SMTP id z14mr6255833mup.92.1246533882303; Thu, 
	02 Jul 2009 04:24:42 -0700 (PDT)
In-Reply-To: <fce2a370907020419u72355948ne46c2de6350511b4@mail.gmail.com>
References: <1246522458-18500-1-git-send-email-ihar.hrachyshka@gmail.com>
	<200907021307.40519.holger+oe@freyther.de>
	<fce2a370907020419u72355948ne46c2de6350511b4@mail.gmail.com>
Date: Thu, 2 Jul 2009 14:24:42 +0300
Message-ID: <fce2a370907020424q5797bc98x6fa4653ecc2977f7@mail.gmail.com>
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] qt4: updated version to 4.5.2.
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
X-List-Received-Date: Thu, 02 Jul 2009 11:36:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Ow, I found -M option. Resending the patch.

On Thu, Jul 2, 2009 at 2:19 PM, Ihar
Hrachyshka<ihar.hrachyshka@gmail.com> wrote:
> Just git mv + checksums. If there is a flag, I don't know about it.
> Can you provide me with its name?
>
> On Thu, Jul 2, 2009 at 2:07 PM, Holger Hans Peter
> Freyther<holger+oe@freyther.de> wrote:
>> On Thursday 02 July 2009 10:14:18 Ihar Hrachyshka wrote:
>>> Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
>>
>> Is there any actual change besides the git mv? Did git fail to record this
>> move or is there a flag to git format patch?
>>
>> z.
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>


