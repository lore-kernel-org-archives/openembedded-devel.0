Received: from [209.85.132.245] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LyStL-0001hJ-SO
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Apr 2009 17:37:12 +0200
Received: by an-out-0708.google.com with SMTP id b6so1486515ana.42
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2009 08:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=ZIXeyn36xgoHM2SNf7vn4AqslVjLpmGArNBtT2XJkoQ=;
	b=PMRocohhHT/exnxs/EyJmC3VJS2kcE3NAWzCFvWuVMeUjvW4ei5tJ0auqQQXM0oQg8
	QSCJiDvH3AMinhLeafeh85sBJGtfUYXRttbCZD3KAku/jvJ7XE3/h6fIchr+ARUIOHY0
	RFvBVlROxfZwqJYKvqX4ZwxrimjSA8l/Lioew=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=Vh6P3fJyo0p554rfWngwO9/DP+mZjUCX9xcJq/+57N2GgV61vsAP0jkL4xZOADLbl8
	1Vi5K27F980dpd3GbwS52AmJiIDj+B1xaKTBOLw7vfJw8jU2h9XAVs1CR3hsE9sDyWJK
	GbHs4AoogaIloYGB1q7QDAnlXYUQ/Zh20C8cI=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.164.20 with SMTP id m20mr8827048ane.31.1240846328234; Mon, 
	27 Apr 2009 08:32:08 -0700 (PDT)
In-Reply-To: <200904271803.49498.khimov@altell.ru>
References: <200904271340.28227.khimov@altell.ru>
	<200904271729.33673.khimov@altell.ru>
	<20090427135030.GF18788@smtp.west.cox.net>
	<200904271803.49498.khimov@altell.ru>
Date: Mon, 27 Apr 2009 12:32:08 -0300
X-Google-Sender-Auth: 62cb0af6506cd52f
Message-ID: <be7a9f3d0904270832j4832bc6fqcf058fdfc3d8479@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC] install-native
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
X-List-Received-Date: Mon, 27 Apr 2009 15:37:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On Mon, Apr 27, 2009 at 11:03 AM, Roman I Khimov <khimov@altell.ru> wrote:
> On Monday 27 April 2009 17:50:30 Tom Rini wrote:
>> We have coreutils-native already, why not use install from that and
>> stick coreutils-native into default deps?
>
> Works fine with me also (guaranteed sane coreutils is very good), it's just a
> thing that we need to agree upon.

+1

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


