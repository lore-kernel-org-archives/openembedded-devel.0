Received: from [74.125.92.150] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1L0cto-0007PM-5e
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Nov 2008 15:10:20 +0100
Received: by qw-out-1920.google.com with SMTP id 5so550519qwf.36
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Nov 2008 06:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=JL6Zblo5MkUcsD1XPIlQWrHUHmCWxBMM3WWZCk0Di2k=;
	b=NiDqTMgXsTT5vACsiBYP0qxFz1IOJGKp4oxYIq8F2rGiarSp/9tLRfyAkwXmMKyyf2
	O84G5p/3alBuNsgdDCn5wMHIgbWisyFMqMALgPFhS8a97+31jFZcNw0iU816CVB7yXGM
	szJP4Jpux2KpLWYqr1r8eLNhBGxHroSXKsB6E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=DpmnYyk606yaDvP0/MHAFtjaKbqks7OOcQOzkaOE6PWe91HqAHch5a4QHMMWwSjys2
	t1gnqSjb6heTixTF4RtDqQQ/e7CSiZedOB+WKOfenfRqFath7eX45FuqiDX/Be/3lWq4
	u9CWe6XijxLKCP5aQLLRvRtaj23I/MztH6PlY=
Received: by 10.214.241.8 with SMTP id o8mr11087946qah.360.1226585297282;
	Thu, 13 Nov 2008 06:08:17 -0800 (PST)
Received: by 10.214.12.10 with HTTP; Thu, 13 Nov 2008 06:08:17 -0800 (PST)
Message-ID: <c384c5ea0811130608v47862518j845053b4f3291958@mail.gmail.com>
Date: Thu, 13 Nov 2008 15:08:17 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200811121733.59749.gerwin@vanderkruis.net>
MIME-Version: 1.0
References: <200811121733.59749.gerwin@vanderkruis.net>
Subject: Re: Transferring images to flash avr32
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
X-List-Received-Date: Thu, 13 Nov 2008 14:10:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Gerwin,

On Wed, Nov 12, 2008 at 5:33 PM, Gerwin van der Kruis
<gerwin@vanderkruis.net> wrote:
> I managed to succesfully compile the images for avr32 .
>
> I want to use tftp and u-boot to boot the images on my ATNGW100 board.
>
> Is there somewhere a manual how to put the images on the board ?
>
What is your starting point?

Do you have an existing u-boot in FlashROM?
Do you have a JTAG programmer (the Atmel specific programming device,
cannot remember its name, it's blue-ish).

Regards,
-- 
Leon


