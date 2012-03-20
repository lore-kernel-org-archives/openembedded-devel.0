Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1S9tOU-0004CM-Ax
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Mar 2012 08:22:10 +0100
Received: by wibhj13 with SMTP id hj13so4122312wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Mar 2012 00:13:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=7+MiUBOeUwCNnL6KHEI1cW45a0bV39mcf6ZAgCDYZd4=;
	b=CyuAwvib7Ct0xCj+1haPH/8bVqius/mXstG+LWs1V3G0+tDdc0omtNEfyyRo0Hkun3
	T+O0WH4u0fgWdKnoiBB0z9I7ipjmFA+Qjvx4eDWXFgosNPeX/wzfdPEMHyAi0XPcjoFX
	1HnghId1FzfEQ8bfCxm4EGOSWW9rbJb33vXNXkB86cHVJ5GpfHwaNmta0ceOfMOvOifZ
	55bE9NqRjEWTRZeQYmyGJJww8BV2H+7FfSMjXFidSG2LdUQ2XBQtP6A4RFhRdPImr+iF
	9Xv1jIVD4YYBHOKwA1kzzgfj0by07CMwQgWmFwHE2JaqXei3xA4ef9EENMYThkiKfSk9
	QPGQ==
Received: by 10.180.81.166 with SMTP id b6mr5185378wiy.0.1332227598127;
	Tue, 20 Mar 2012 00:13:18 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de
	(pd95cb174.dip0.t-ipconnect.de. [217.92.177.116])
	by mx.google.com with ESMTPS id n8sm3047537wix.10.2012.03.20.00.13.17
	(version=SSLv3 cipher=OTHER); Tue, 20 Mar 2012 00:13:17 -0700 (PDT)
Message-ID: <4F682E0C.4030101@dresearch-fe.de>
Date: Tue, 20 Mar 2012 08:13:16 +0100
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0) Gecko/20120129 Thunderbird/10.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4F61C54B.1000609@dresearch-fe.de>
	<4F66E4F2.2000909@dresearch-fe.de>
	<CA+M6bXmpiegfSspYOwybxKSLf4Ukg5tjRL4VR1aq8T4EFyaaRg@mail.gmail.com>
	<CACW_hTbMZ5R6VB_BChH+3rxx-tqV3jqxioX8Q5ZWsoiHJWZ=7w@mail.gmail.com>
	<20120319162122.GA19810@bill-the-cat>
In-Reply-To: <20120319162122.GA19810@bill-the-cat>
X-Enigmail-Version: 1.4
X-Gm-Message-State: ALoCoQkIh8bxLzD7E66Z0s7uM0TdE9NDCigS4vzsQQqiwM1d1yLKEjXiGEqyeDGFnKhNBgJv47S9
Subject: Re: libmatthew-java-0.7.1.tar.gz not fetchable
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
X-List-Received-Date: Tue, 20 Mar 2012 07:22:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.03.2012 17:21, Tom Rini wrote:
> On Mon, Mar 19, 2012 at 04:44:10PM +0100, Frans Meulenbroeks wrote:
>> 2012/3/19 Tom Rini <tom.rini@gmail.com>:
>>> On Mon, Mar 19, 2012 at 12:49 AM, Steffen Sledz <sledz@dresearch-fe.de> wrote:
>>>> On 15.03.2012 11:32, Steffen Sledz wrote:
>>>>> libmatthew-java-0.7.1.tar.gz (used in 2011.03-maintenance branch) is no longer fetchable from it's original location (the maintainer provides the latests version only). And i did not found another reliable source.
>>>>>
>>>>> Can someone put the tarball into the OE and/or Angstrom mirrors?
>>>>
>>>> Ping!
>>>
>>> If someone points Khem at a copy, this can happen...
>>>
>>> --
>> google is your friend
>>
>> http://pkgs.fedoraproject.org/repo/pkgs/libmatthew-java/libmatthew-java-0.7.1.tar.gz/6a4db221129f230c64a0f937d00bb703/libmatthew-java-0.7.1.tar.gz
>>
>> It might be useful to update the recipe itself as well.
>> Furthermore we might consider running a fetchall and put all fetched
>> on the mirror.
> 
> Does pkgs.fedoraproject.org have a policy about forever, ala
> snapshot.debian.org?  Otherwise, we're just making a problem for
> ourselves in the future.  WRT an everything mirror, I think bandwidth
> usage is a concern there, ala what I think happened with the angstrom
> everything mirror.

Khem has put the tarball on the mirror. But this does not fix our problem.

Fetching from the original url downloads an XHTML error page and stores it under the name of the archive. This of course results in a checksum mismatch. :(

So in my opinion changing the recipe to the fedoraproject url seems to be the best way.

Regards,
Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


