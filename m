Received: from [209.85.210.193] (helo=mail-yx0-f193.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1MM2nl-00043y-SA
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Jul 2009 18:36:54 +0200
Received: by yxe31 with SMTP id 31so1066317yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Jul 2009 09:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=xcB2SFIcFYE1xUihLDRs+Q83ITiZ5v9PSfDS/MqBSHY=;
	b=rWby3i2VwCenTaDJTf3KKFlOTtHH9K0rbkV0swnpWToB3y/r5UxWUdU9oDywf3yLRZ
	giit0PQfiUnyqStwMc+fYZs7kBx9dH0DfS7VXyDEK7BgsWIy52e65yStzc+CxP/a7qGp
	efiXA1qMpInWbON5xzXIxbLwt5bObQ9SgyjNc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=EEoIhFJj35NUXjApISWcR5XHESz+mpwY+WgX7VpG12BcKO/KzLzU8TzGmODwa1SwUX
	vdSblJDhA4+bOqQhDnvIFn/LlsCyxM3tbDh57zaW2u4Nceq6G1eTYcRzL7sU6IFXoYJ4
	5mG5M3Hw5wMsbpbAVCBUeqMdJHStIwxUIna3c=
MIME-Version: 1.0
Received: by 10.100.227.18 with SMTP id z18mr13736924ang.49.1246465491251; 
	Wed, 01 Jul 2009 09:24:51 -0700 (PDT)
In-Reply-To: <200907011558.52497.marcin@juszkiewicz.com.pl>
References: <20090701115959.GA10962@pcimg12.dei.unipd.it>
	<200907011558.52497.marcin@juszkiewicz.com.pl>
Date: Wed, 1 Jul 2009 18:24:51 +0200
Message-ID: <ac9c93b10907010924y2a480b01t47c983c1d80a89b4@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: looking for an arm-based board
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
X-List-Received-Date: Wed, 01 Jul 2009 16:36:55 -0000
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable

2009/7/1 Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>:
> Dnia =B6roda, 1 lipca 2009 o 13:59:59 Ottavio Campana napisa=B3(a):
>
>> This time  I need a  small arm with  standard peripherals (UART,  SPI
>> or I2C) and ethernet.  The task it has  to do is controlling  a few
>> devices with the commands received over TCP/IP.
>>
>> Since I don't know all the supported machines, can you suggest me a
>> cost effective ARM7 or ARM9 board that works well with OE
>> stable/2009?
>
> Check FriendlyARM devices on http://friendlyarm.eu/ - they costs 125 EURO
> for qvga and 160 EURO for wvga version. You get Samsung s3c2440, 64MB ram=
,
> ethernet, 3 rs232 ports, usb host/device, audio in/out and extra signals
> at connectors.
>
> This is one of cheapest solution for embedded devices

Not sure about shipping, but if you ourder from china the mini board
(without display) is only rmb 499 (which is a little bit more than eur
50)
See http://www.arm9.net/mini2440.asp
not sure if http://www.friendlyarm.us/ will ship to europe

What you could also do is use a sheevaplug. It has uart and ethernet
and I've seen pictures of someone who abused the SD card as I/O
output. You could rip it apart and only use the PCB if that is more
convenient. 1.2GHz cpu, 512M NAND flash, 512 M RAM, gigabit ethernet;
usd 99

Frans


