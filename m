Received: from [209.85.198.244] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1LYBj9-0005dC-67
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 Feb 2009 05:02:03 +0100
Received: by rv-out-0708.google.com with SMTP id b17so1088230rvf.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2009 20:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=3WqbP+IapWiHI9dQsPGqYc4aqmgJ0oIHgjd5LbZhDpc=;
	b=TxWF2A3tKuErhksq9jBXCIUj5WYj+NHMpx/6vRg4zDchHhz58DqQcUaf+rPdxnL/rf
	dM+5Ku08jCWZ8W0UTKNtScl7loGBw1BAmG8uxKKfEpa0xfpVhKLw3JjK7WTDFW0nkgJn
	vBHEtHUiyYwvXHzCx2syBaZWkeOv8mXISKvwg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=HFqijX9mvqIdiAKNCkRHY2EBsCeGdcwkIduQNsKtRQKowIgSs2mc/UAFv4fPkn08mM
	T0kyJZyfNZjsSRPknahSrC/s5F2gpaIixOfpEom/3hOv5IGNKcwNBkC8QUyibaL8jlhj
	z6R65t1tdKGM5EpCWDuAdYviMNsc3RUFlGfb0=
MIME-Version: 1.0
Received: by 10.141.210.21 with SMTP id m21mr1465361rvq.204.1234584032068; 
	Fri, 13 Feb 2009 20:00:32 -0800 (PST)
In-Reply-To: <4996379F.50003@whitby.id.au>
References: <499570E4.1020503@balister.org> <4996379F.50003@whitby.id.au>
Date: Fri, 13 Feb 2009 20:00:32 -0800
Message-ID: <19c1b8a90902132000m4368f3e5ma5addfe5e4e75d69@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Having trouble keeping track of the Patches?
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
X-List-Received-Date: Sat, 14 Feb 2009 04:02:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Fri, Feb 13, 2009 at 7:16 PM, Rod Whitby <rod@whitby.id.au> wrote:
> Philip Balister wrote:
>> Patches sent to the list are being tracked with patchwork now:
>>
>> http://patchwork.openembedded.org/project/openembedded/list/
>>
>> If you submit a patch, please update the flags as comments occur and
>> consensus happens.

Great work. It would be nice if there is  link on openembedded.org
main page to patchwork.

Thx

-Khem


