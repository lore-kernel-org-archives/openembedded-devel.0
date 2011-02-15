Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1PpC61-0008Q4-Kk
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Feb 2011 05:01:01 +0100
Received: by wwi18 with SMTP id 18so2610104wwi.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Feb 2011 19:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=fr74bUHV3g2KtL7rW7I2oDdjoM0yOda34TDALmPMGRc=;
	b=YIIHMOdTmq7Gffu3A5MqwYD8WX8ymUzjvmKNTzEkC4sUgLKUGl/uQIjne8Ydpf7szb
	PFBDNsU+YahnoNMfLXmBKjm5JZfK0AlZft9MTC35j1g96yZWDbji+Lm86p10v09I43Yb
	WmcBXlfXcJiqHl4dwyFBBMxLG+I12CVwNRCRs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=TbkFm18k5LhG0MFmfpdJNJZ3KAopEwpITEkbpEei4kaLpGRrgftL39JyZAojRf+mA5
	Xf5ens1OHwwnSLEv+ZG4JjGPlB4hOEnfnudmZwRQoD9B72bz/cp6nzvcq+LV8i3RSP98
	LnH1HBa3+LInsHtMFNL+YWBG7P4zIeddDpX4w=
MIME-Version: 1.0
Received: by 10.216.50.133 with SMTP id z5mr321318web.19.1297742038630; Mon,
	14 Feb 2011 19:53:58 -0800 (PST)
Received: by 10.216.254.137 with HTTP; Mon, 14 Feb 2011 19:53:58 -0800 (PST)
In-Reply-To: <AANLkTikHTA9NDzU5q3Tcwh8hZ9ZrWy=vAHTTTgGPaEAV@mail.gmail.com>
References: <AANLkTikzcmcDMM4SouUkXAeXaus3AyiJq48Puj+mK6d1@mail.gmail.com>
	<AANLkTikHTA9NDzU5q3Tcwh8hZ9ZrWy=vAHTTTgGPaEAV@mail.gmail.com>
Date: Mon, 14 Feb 2011 22:53:58 -0500
Message-ID: <AANLkTi=MBnzbnUMu5E-+TLgmqP330HEo_7opJfDcPgh1@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: testing branch suspended over next couple weeks during release testing
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
X-List-Received-Date: Tue, 15 Feb 2011 04:01:01 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Feb 11, 2011 at 12:41 PM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2011/2/11 Cliff Brake <cliff.brake@gmail.com>:
>> We will not be running our weekly testing branch cycles over the next
>> couple weeks in favor of re-directing resources toward release
>> testing.
>>
>> Thanks,
>> Cliff
>>
>>
> Thanks for the info.
> Can you still consolidate the last round of testing?

Hi Frans,

Done: http://cgit.openembedded.org/cgit.cgi/openembedded/tag/?id=tested_2010-02-03

Thanks for your testing.

Cliff

-- 
=================
http://bec-systems.com


