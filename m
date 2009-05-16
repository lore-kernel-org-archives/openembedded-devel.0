Received: from [209.85.217.225] (helo=mail-gx0-f225.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1M5Tyd-0007tk-UO
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 May 2009 02:11:45 +0200
Received: by gxk25 with SMTP id 25so2480578gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 May 2009 17:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=92xcRsAjUj1HJiH3ysCDGG7vNHNUy7COhcNqDJTgfVA=;
	b=hOaNEOyxVa0OWB9sjQAHWYbNyRZQVgSP0az1GiPo/eOwb3QMVPndpMKDinPXaURFvC
	/LpnfyDJ8V4aGwPpRSayYbv7xZwMTK2wwBl3K9lSKNYsHyOUN4Jq0a/iJXs59TFJfMqI
	y1eL+rZ3XKVgX9KSebOoPHH8vueFbBGKjqJTA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=fDHxtthhY8UUBq1XtnWlc0xx/QB6/pAWRxNXuDdYajIptUERVu7m6axYrcquVvBwzN
	55pXzA16NasQkDtllOSGP8GDpzC62Q0J9c8xnh+lmOU5Pu2dq35PJnXyYk7PfWHW/SOr
	Pg8R/LzHZ+ZW08olI9tRTlr4MQP9AcpWLNu+o=
MIME-Version: 1.0
Received: by 10.90.56.16 with SMTP id e16mr4300352aga.77.1242518217598; Sat, 
	16 May 2009 16:56:57 -0700 (PDT)
In-Reply-To: <49FD9EEA.4030608@dls.net>
References: <c384c5ea0905030555t48379d37o700254a1c49a4600@mail.gmail.com>
	<49FD9A75.3000609@balister.org> <49FD9EEA.4030608@dls.net>
Date: Sun, 17 May 2009 01:56:57 +0200
Message-ID: <c384c5ea0905161656g33e1fc8dk573e89a440c3333e@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC]: Remove #####...##### lines
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
X-List-Received-Date: Sun, 17 May 2009 00:11:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello,

On Sun, May 3, 2009 at 3:40 PM, Mike (mwester) <mwester@dls.net> wrote:
> Philip Balister wrote:
>> Leon Woestenberg wrote:
>>> #############################################################################
>>>
>>> #I am a bit annoyed by the hash lines in some of the files
>>> #############################################################################
>>>
>>> # They distract me from the real content of the files.
>>> #############################################################################
>>>
>>> RFC_REMOVE_HASHLINES ?= 1
>>
>> Although this might start a coding style war, I also find them distracting.
>
> Let's replace them with prettier formats:
>

My proposal was to *remove* the hash lines, so we cannot have wars on them. :-)

Regards,
-- 
Leon 'peacekeeper' Woestenberg


