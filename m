Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1PbD8q-0002cB-1l
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Jan 2011 15:18:08 +0100
Received: by mail-wy0-f175.google.com with SMTP id 40so17926747wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Jan 2011 06:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:cc:content-type;
	bh=0lq1svLoM++sZ4hrR81+lywNMaQz+XOh0sImLwK/w60=;
	b=YhOB66+e5dX3FTBZljbzR2393mpMMEi8D/zf1druHmXX/JI5OPkuvKq8FlHsrAlcMS
	Mf9ScsVNmysoNXMMzp5NTIuEZQb6uz9mH+PRS3mP51M6Q8tgSCv1MVDaW+y3Y6KmhkMB
	rX0P9JGQEmqBJnvp2guwycHrtwR9+gpUiPSRQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	b=HqI4Pw59WvGvnxnNyXgLSONUMsquPngFx1R8qmk3aGhX4UYEs7LEP00BiBzrdJLl1a
	1UcQO7A6oIOng9ntSIHTdPDvY3Y5ucFv796iDKesYf4hq9YPsR2z7tbGh5ArW5parg5j
	J/UnVkzqRUn0sz/r94IfmTbDjw9+JMShlQ2Vc=
MIME-Version: 1.0
Received: by 10.216.51.67 with SMTP id a45mr1560300wec.19.1294409840874; Fri,
	07 Jan 2011 06:17:20 -0800 (PST)
Received: by 10.216.254.137 with HTTP; Fri, 7 Jan 2011 06:17:20 -0800 (PST)
In-Reply-To: <4D22F838.8020806@dresearch.de>
References: <AANLkTin8E_sSKJcCW7_gtx85_Uo6SvwHFTdiUA8XZ2tv@mail.gmail.com>
	<AANLkTimHjCR5N8WDd5kz4qPqZE=-XCyzz-xqYiE6VeaJ@mail.gmail.com>
	<4D22F838.8020806@dresearch.de>
Date: Fri, 7 Jan 2011 09:17:20 -0500
Message-ID: <AANLkTimQasPfRMTbzSOYDTiQ3KPhVV5smQ_-VfisCpAm@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: Steffen Sledz <sledz@dresearch.de>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: testing branch 2010-11-12
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
X-List-Received-Date: Fri, 07 Jan 2011 14:18:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jan 4, 2011 at 5:36 AM, Steffen Sledz <sledz@dresearch.de> wrote:
> Am 18.11.2010 23:13, schrieb Cliff Brake:
>> Last week's test run was a success with 38 combinations passing.
>> Thanks to all running tests:
>>
>> http://cgit.openembedded.org/cgit.cgi/openembedded/tag/?id=tested_2010-11-12
>
> Just a short question (i was "offline" for some weeks).
>
> The Testing Log [1] ends with "tested_2010-10-29". Is this indented?
>
> Steffen
>
> [1] http://wiki.openembedded.net/index.php/Testing#Testing_Log

Looks like I neglected to update this list.  Since cgit provides a
nice list of tags, I decided to simply reference cgit for the tags.

Thanks,
Cliff

-- 
=================
http://bec-systems.com


